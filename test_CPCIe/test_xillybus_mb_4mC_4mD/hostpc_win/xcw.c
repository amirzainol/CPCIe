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
// Entity: 			xcw.c
// Version:			1.0
// Description: 	This file is used to write input of datasets
//
// Additional Comments:
//
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#include <Windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <io.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h> /* Needed only for _O_RDWR definition */
#include <stdint.h>
#include <errno.h>
#include <signal.h>
#include <share.h>
#include <conio.h>
#include <ctype.h>
#include <time.h> // sleep 

#include "cpcie.h"

static int fh0 = 0;
static int fh_C = 0;
int filesize_0_w;
int get_filesize_C(char *the_file);
int get_filesize_U(char *the_file);
char *input_file_U;
char *input_file_C;

int fdw0 = 0;
int fdw_C = 0;
int fdw_cmd_stat;
//int fdr_cmd_stat;
unsigned int written_value;
unsigned int read_value;

void xillybus_init();
void xillybus_close();
void write_addr(int addr, int value);
int read_addr(int addr);
void allwrite(int fd, unsigned int *buf, int len);
void memread(int fd, unsigned int *buf, int len);

void allwritex(int fd, unsigned char *buf, int len);

struct packet 
{ 
	int bytes;  
};

void allwritex(int fd, unsigned char *buf, int len) {
  int sent = 0;
  int rc;

  while (sent < len) {

    rc = _write(fd, buf + sent, len - sent);
	
    if ((rc < 0) && (errno == EINTR))
      continue;

    if (rc < 0) {
      perror("allwrite() failed to write");
      exit(1);
    }
	
    if (rc == 0) {
      fprintf(stderr, "Reached write EOF (?!)\n");
      exit(1);
    }
 
    sent += rc;
  }

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

void xillybus_init()
{
	fdw_cmd_stat = _open("\\\\.\\xillybus_hc_dpram", O_WRONLY | _O_BINARY);

	if (fdw_cmd_stat < 0) {
		if (errno == ENODEV)
			fprintf(stderr, "(Maybe fdw_cmd_stat a read-only file?)\n");
			perror("Failed to open devfile fdw_cmd_stat");
			exit(1);
	}

//	fdr_cmd_stat = _open("\\\\.\\xillybus_hc_dpram", O_RDONLY | _O_BINARY);

//	if (fdr_cmd_stat < 0) {
//		if (errno == ENODEV)
//			fprintf(stderr, "(Maybe fdr_cmd_stat a write-only file?)\n");
//			perror("Failed to open devfile fdr_cmd_stat");
//			exit(1);
//	}

	fdw0 = _open("\\\\.\\xillybus_hcw_d", O_WRONLY | _O_BINARY);

	if (fdw0 < 0) {
		if (errno == ENODEV)
			fprintf(stderr, "(Maybe xillybus_write_32 a read-only file?)\n");
			perror("Failed to open devfile");
			exit(1);
	}

	fdw_C = _open("\\\\.\\xillybus_hcw_c", O_WRONLY | _O_BINARY);

	if (fdw_C < 0) {
		if (errno == ENODEV)
			fprintf(stderr, "(Maybe xillybus_write_32 a read-only file?)\n");
			perror("Failed to open devfile");
			exit(1);
	}

}

int read_addr(int addr)
{
//	if (_lseek(fdr_cmd_stat, addr, SEEK_SET) < 0) {
//		perror("Failed to seek (read)");
//		exit(1);
//	}

//	memread(fdr_cmd_stat, &read_value, 4);
//	return read_value;

	return 0;
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

void xillybus_close()
{
	_close(fdw0);
	_close(fdw_C);
	//_close(fdr_cmd_stat);
	_close(fdw_cmd_stat);
}

int get_filesize_C(char *the_file) {

	int filesize;

	if( _sopen_s( &fh0, the_file, _O_RDONLY | _O_BINARY, _SH_DENYNO, 0 ) )
	{
		perror( "open failed on input file" );
		exit( 1 );
	}
	filesize = _filelength(fh0);

	return filesize;
}

int get_filesize_U(char *the_file) {

	int filesize;

	if( _sopen_s( &fh_C, the_file, _O_RDONLY | _O_BINARY, _SH_DENYNO, 0 ) )
	{
		perror( "open failed on input file" );
		exit( 1 );
	}
	filesize = _filelength(fh_C);

	return filesize;
}

int __cdecl main(int argc, char *argv[]) {


	unsigned char *buf;
	unsigned char *buf_C;
	int donebytes;
	int rc=0;
	int blocksize_0_w = 0;

	xillybus_init();
	
	input_file_U = (argv[1]);
	input_file_C = (argv[2]);
	blocksize_0_w = atoi(argv[3]);
		
	filesize_0_w = get_filesize_U(input_file_U);
	
	write_addr(W_FILESIZE, filesize_0_w);
	write_addr(W_BLOCKSIZE, blocksize_0_w);

	buf_C = (char *) malloc(filesize_0_w);
	donebytes = 0;
	
	printf("\nfilesize %d", filesize_0_w);
	printf("\nblocksize %d", blocksize_0_w);

	while (1) {

		rc = _read(fh_C, buf_C, filesize_0_w);
		rc += 4; // tupple of 4
	  
		if ((rc < 0) && (errno == EINTR))
			continue;
		
		if (rc < 0) {
			perror("allread() failed to read");
			exit(1);
		}
		
		if (rc == 0) {
			fprintf(stderr, "Reached read EOF.\n");
			exit(0);
		}

		allwritex(fdw_C, buf_C, rc);
		break;
	}
	
	printf("\ncompressed done");
	
	Sleep(5000);
	
	_close(fh_C);
	free(buf_C);

	
	filesize_0_w = get_filesize_C(input_file_C);

	buf = (char *) malloc(filesize_0_w);
	donebytes = 0;

	while (1) {

		rc = _read(fh0, buf, filesize_0_w);
		rc += 4; // tupple of 4
	  
		if ((rc < 0) && (errno == EINTR))
			continue;
		
		if (rc < 0) {
			perror("allread() failed to read");
			exit(1);
		}
		
		if (rc == 0) {
			fprintf(stderr, "Reached read EOF.\n");
			exit(0);
		}

		allwritex(fdw0, buf, rc);
		break;
	}

	printf("\ndecompressed done");
	
	Sleep(5000);
	
	_close(fh0);
	free(buf);
	
	xillybus_close();
	
	return 0;
}