// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//This library is free software; you can redistribute it and/or
//modify it under the terms of the GNU Lesser General Public
//License as published by the Free Software Foundation; either
//version 2.1 of the License, or (at your option) any later version.
//
//This library is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
//Lesser General Public License for more details.
//
//You should have received a copy of the GNU Lesser General Public
//License along with this library; if not, write to the Free Software
//Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
//
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//
// Author: 			Mohd Amiruddin Zainol (mohd.a.zainol@gmail.com)
// Entity: 			xcr.c
// Version:			1.0
// Description: 	This file is used to read output
//
// Additional Comments:
//
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

// Originally from Xillybus
#include <io.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h> /* Needed only for _O_RDWR definition */

// The library used in the prototyping
#include <signal.h>
#include <share.h>
#include <conio.h>
#include <ctype.h>
#include <Windows.h>
#include <stdint.h>
#include <time.h> // sleep 

#include "cpcie.h"

char *matrix_UA;
static int fdr = 0;
static int fdr_C = 0;
static int fhA = 0;
int fdw_cmd_stat;
int fdr_cmd_stat;
unsigned int read_value;
unsigned int written_value;
int fdr_cmd_stat;

void xillybus_init();
void xillybus_close();
void open_fdw_cmd_stat();
void open_fdr_cmd_stat();
void memread(int fd, unsigned int *buf, int len);
int read_addr(int addr);
void allwrite(int fd, unsigned int *buf, int len);
void write_addr(int addr, int value);

int __cdecl main(int argc, char *argv[]) {
	
	int rc=0;
	int received = 0;
	int filesize_0_r = 0;
	int blocksize_0_r = 0;
	int totalblock_0_r = 0;
	unsigned char *ptr_D;
	unsigned char *ptr_C;
	FILE *pfile0;
	FILE *pfile_C;
	int n_sim = 1;
	int t_rep = 0;
	int ten = 10;
	int HLS_stat = 0;
	int XCR_stat = 0;
	int XCW_stat = 0;
	int i = 0;
	int j = 0, k = 0;
	int flush_read = 2;

	int offset_header = 3;
	int offset_tail = 0;
	int compressed_size = 0;
	int total_filesize_C = 0;
	
	//unsigned char rd_stat_tlast;
	
	char file_out_c[16] = "out_C.bin";
	char file_out_d[16] = "out_D.bin";

	xillybus_init();
	
	//filesize_0_r = 4096;

	if((pfile_C = fopen(file_out_c,"wb")) == NULL){
		printf("\nUnable to open file output");
		exit(1);
	}	

	if((pfile0 = fopen(file_out_d,"wb")) == NULL){
		printf("\nUnable to open file output");
		exit(1);
	}	
	
	filesize_0_r = read_addr(W_FILESIZE);
	
	while(!filesize_0_r) {
		filesize_0_r = read_addr(W_FILESIZE);
		Sleep(1); // must sleep for 1 ms 
	}
	
	printf("\nfilesize %d", filesize_0_r);
	
	blocksize_0_r = read_addr(W_BLOCKSIZE);
	totalblock_0_r = filesize_0_r / blocksize_0_r;
	
	received += (offset_header+(totalblock_0_r*2))*4;
	
		ptr_C = (unsigned char *)malloc(filesize_0_r);

		if (read_addr(PROC_STATUS) == 1) {
			flush_read -= 1;
		}
			
		while (received < filesize_0_r) {

			rc = _read(fdr_C, ptr_C + received, filesize_0_r - received);
		
			printf("\nrc %d", rc);
			
			if ((rc < 0) && (errno == EINTR))
			continue;

			if (rc < 0) {
				perror("allread() failed to read");
				exit(1);
			}

			if (rc == 0) {
				fprintf(stderr, "Reached read EOF (?!)\n");
				//exit(1);
				break;
			}
			
			received += rc;
			
			if (read_addr(PROC_STATUS) == 1) {
				flush_read -= 1;
			}

			if (flush_read == 0) {
				break;
			}
		}
		
		compressed_size = read_addr(PROC_C_SIZE);
		
		printf("\ncompressed size: %d words\n", compressed_size);
		
		*(ptr_C+0) = filesize_0_r >> 24;
		*(ptr_C+1) = filesize_0_r >> 16;
		*(ptr_C+2) = filesize_0_r >> 8;
		*(ptr_C+3) = filesize_0_r;
		
		*(ptr_C+4) = blocksize_0_r >> 24;
		*(ptr_C+5) = blocksize_0_r >> 16;
		*(ptr_C+6) = blocksize_0_r >> 8;
		*(ptr_C+7) = blocksize_0_r;
		
		*(ptr_C+8) = totalblock_0_r >> 24;
		*(ptr_C+9) = totalblock_0_r >> 16;
		*(ptr_C+10) = totalblock_0_r >> 8;
		*(ptr_C+11) = totalblock_0_r;
		
		// save the compressed size and crc
		for (j=0; j<(totalblock_0_r*2)*4; j++) {
			*(ptr_C+j+12) = *(ptr_C+((compressed_size+(offset_header+(totalblock_0_r*2))+offset_tail)*4)+j);
		}
		
		/*
		for (k=0, j=0; k<1024, j<4096; k++, j+=4) {
			printf("%d\t", k);
			printf("%02X", *(ptr0+j+0));
			printf("%02X", *(ptr0+j+1));
			printf("%02X", *(ptr0+j+2));
			printf("%02X", *(ptr0+j+3));			
			printf("\n");
		}
		*/
		
		total_filesize_C = ((offset_header+(totalblock_0_r*2))+compressed_size)*4;
		
		printf(">Total compressed filesize: %d Bytes\n", total_filesize_C);
		
		fwrite(ptr_C,total_filesize_C,1,pfile_C);
		fclose(pfile_C);
		free(ptr_C);

		received=0;

////////

		ptr_D = (unsigned char *)malloc(filesize_0_r);

		if (read_addr(PROC_STATUS) == 1) {
			flush_read -= 1;
		}
			
		while (received < filesize_0_r) {

			rc = _read(fdr, ptr_D + received, filesize_0_r - received);
		
			if ((rc < 0) && (errno == EINTR))
			continue;

			if (rc < 0) {
				perror("allread() failed to read");
				exit(1);
			}

			if (rc == 0) {
				fprintf(stderr, "Reached read EOF (?!)\n");
				//exit(1);
				break;
			}
			
			received += rc;
		}
		
		/*
		for (k=0, j=0; k<1024, j<4096; k++, j+=4) {
			printf("%d\t", k);
			printf("%02X", *(ptr0+j+0));
			printf("%02X", *(ptr0+j+1));
			printf("%02X", *(ptr0+j+2));
			printf("%02X", *(ptr0+j+3));			
			printf("\n");
		}
		*/
		
		fwrite(ptr_D,received,1,pfile0);
		fclose(pfile0);
		free(ptr_D);

		received=0;
		
	xillybus_close();
	
	return 0;
}

int read_addr(int addr)
{
	if (_lseek(fdr_cmd_stat, addr, SEEK_SET) < 0) {
		perror("Failed to seek (read)");
		exit(1);
	}

	memread(fdr_cmd_stat, &read_value, 4);
	return read_value;
}

void memread(int fd, unsigned int *buf, int len) {
  int received = 0;
  int rc;

  while (received < len) {
    rc = _read(fd, buf + received, len - received);
	
    if ((rc < 0) && (errno == EINTR))
      continue;

    if (rc < 0) {
      perror("memread() failed to read");
      exit(1);
    }
	
    if (rc == 0) {
      fprintf(stderr, "Reached read EOF (?!)\n");
      exit(1);
    }
 
    received += rc;
  }
} 

void write_addr(int addr, int value)
{
	if (_lseek(fdw_cmd_stat, addr, SEEK_SET) < 0) {
		perror("Failed to seek (write)");
		exit(1);
	}

	written_value = (unsigned int) value;
	allwrite(fdw_cmd_stat, &written_value, 4);
}

void allwrite(int fd, unsigned int *buf, int len) {
  int sent = 0;
  int rc;

  // allwrite() loops until all data was indeed written, or exits in
  // case of failure, except for EINTR. The way the EINTR condition is
  // handled is the standard way of making sure the process can be suspended
  // with CTRL-Z and then continue running properly.
  while (sent < len) {
    rc = _write(fd, buf + sent, len - sent);
	
    if ((rc < 0) && (errno == EINTR))
      continue;

    if (rc < 0) {
      perror("allwrite() failed to write");
      exit(1);
    }
	
    // The function has no return value, because it always succeeds (or exits
    // instead of returning).
	// The function doesn't expect to reach EOF either.
    if (rc == 0) {
      fprintf(stderr, "Reached write EOF (?!)\n"); 
      exit(1);
    }
 
    sent += rc;
  }
} 

void xillybus_init()
{

	fdr_cmd_stat = _open("\\\\.\\xillybus_hc_dpram", O_RDONLY | _O_BINARY);

	if (fdr_cmd_stat < 0) {
		if (errno == ENODEV)
			fprintf(stderr, "(Maybe fdr_cmd_stat a write-only file?)\n");
			perror("Failed to open devfile fdr_cmd_stat");
			exit(1);
	}

	fdr = _open("\\\\.\\xillybus_hcr_d", O_RDONLY | _O_BINARY);
  
	if (fdr < 0) {
		if (errno == ENODEV)
			fprintf(stderr, "(Maybe xillybus_read_32 a write-only file?)\n");
			perror("Failed to open devfile");
			exit(1);
	}

	fdr_C= _open("\\\\.\\xillybus_hcr_c", O_RDONLY | _O_BINARY);
  
	if (fdr_C < 0) {
		if (errno == ENODEV)
			fprintf(stderr, "(Maybe xillybus_read_32 a write-only file?)\n");
			perror("Failed to open devfile");
			exit(1);
	}
}

void xillybus_close()
{
	_close(fdr);
	_close(fdr_C);
	_close(fdr_cmd_stat);
}