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
	int filesize_0_r;
	unsigned char *ptr0;
	FILE *pfile0;
	int n_sim = 1;
	int t_rep = 0;
	int ten = 10;
	int HLS_stat = 0;
	int XCR_stat = 0;
	int XCW_stat = 0;
	int i = 0;
	int j = 0, k = 0;
	int flush_read = 2;

	int offset_header = 11;
	int offset_tail = 6;
	int compressed_size = 0;
	int total_filesize_C = 0;
	
	//unsigned char rd_stat_tlast;
	
	char file_out[16] = "sim_X_0XXX.bin";

	xillybus_init();
	
	filesize_0_r = 4096;
	
		if((pfile0 = fopen(file_out,"wb")) == NULL){
			printf("\nUnable to open file output");
			exit(1);
		}	
		
		ptr0 = (unsigned char *)malloc(filesize_0_r);
		
		for (k=0; k<4096; k++) {
			*(ptr0+k) = 0;
		}
		
		received += (offset_header*4);
		
		while (received < filesize_0_r) {

			rc = _read(fdr, ptr0 + received, filesize_0_r - received);
		
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
		
		printf("\ncompressed size: %d\n", compressed_size);
		
		*(ptr0+0) = 0x00;
		*(ptr0+1) = 0x00;
		*(ptr0+2) = 0x10;
		*(ptr0+3) = 0x00;
		
		*(ptr0+4) = 0x00;
		*(ptr0+5) = 0x00;
		*(ptr0+6) = 0x04;
		*(ptr0+7) = 0x00;
		
		*(ptr0+8) = 0x00;
		*(ptr0+9) = 0x00;
		*(ptr0+10) = 0x00;
		*(ptr0+11) = 0x04;
		
		for (j=0; j<32; j++) {
			*(ptr0+j+12) = *(ptr0+((compressed_size+offset_header+offset_tail)*4)+j);
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
		
		total_filesize_C = (offset_header+compressed_size)*4;
		
		//fwrite(ptr0,received,1,pfile0);
		fwrite(ptr0,total_filesize_C,1,pfile0);
		fclose(pfile0);
		free(ptr0);

		received=0;
		
	xillybus_close();
	
	return 0;
	
	printf("\n%08X", read_addr(ADDR_XCR_STAT));
	write_addr(ADDR_XCR_STAT, 5);
	printf("\n%08X", read_addr(ADDR_XCR_STAT));
	
	return 0;
	
	write_addr(ADDR_XCR_STAT, INIT);

	write_addr(ADDR_XCR_STAT, READY);

	XCW_stat = read_addr(ADDR_XCW_STAT);
	while(!XCW_stat)
	{
		XCW_stat = read_addr(ADDR_XCW_STAT);
	}

	filesize_0_r = read_addr(ADDR_RD0);
	t_rep = read_addr(ADDR_XCW_TREP);

	//rd_stat_tlast = (read_addr(ADDR_XCR_STAT)) & 0x000000FF;

	for (i=0; i<t_rep; i++) {

		write_addr(ADDR_XCR_STAT, READY);

		XCW_stat = read_addr(ADDR_XCW_STAT);
		while(!XCW_stat)
		{
			XCW_stat = read_addr(ADDR_XCW_STAT);
		}

		filesize_0_r = read_addr(ADDR_RD0);

		if((pfile0 = fopen(file_out,"wb")) == NULL){
			printf("\nUnable to open file output");
			exit(1);
		}		

		ptr0 = (char *)malloc(filesize_0_r);

		while (received < filesize_0_r) {

			rc = _read(fdr, ptr0 + received, filesize_0_r - received);
	
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

		fwrite(ptr0,received,1,pfile0);
		fclose(pfile0);
		free(ptr0);
		write_addr(ADDR_XCR_STAT, DONE);

		received=0;
		n_sim++;

		Sleep(1);

	} // end of 'for loop' (t_rep)

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

	fdr = _open("\\\\.\\xillybus_hcr", O_RDONLY | _O_BINARY);
  
	if (fdr < 0) {
		if (errno == ENODEV)
			fprintf(stderr, "(Maybe xillybus_read_32 a write-only file?)\n");
			perror("Failed to open devfile");
			exit(1);
	}
}

void xillybus_close()
{
	_close(fdr);
	_close(fdr_cmd_stat);
}