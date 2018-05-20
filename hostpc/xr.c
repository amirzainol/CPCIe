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
// Entity: 			xr.c
// Version:			1.0
// Description: 	This file is used to read input of datasets
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

#define STATUS_CDI		112
#define COMMAND_CR		0

#define mask_C			0xDC000000
#define mask_D			0x98000000

#define c_default		0x30000000
#define c_optimised		0x20000000

#define ADDR_OFFSET		0
#define ADDR00			ADDR_OFFSET+0
#define ADDR01			ADDR_OFFSET+4
#define ADDR02			ADDR_OFFSET+8
#define ADDR03			ADDR_OFFSET+12
#define ADDR04			ADDR_OFFSET+16
#define ADDR05			ADDR_OFFSET+20
#define ADDR06			ADDR_OFFSET+24
#define ADDR07			ADDR_OFFSET+28
#define ADDR08			ADDR_OFFSET+32
#define ADDR09			ADDR_OFFSET+36
#define ADDR10			ADDR_OFFSET+40
#define ADDR11			ADDR_OFFSET+44
#define ADDR12			ADDR_OFFSET+48
#define ADDR13			ADDR_OFFSET+52
#define ADDR14			ADDR_OFFSET+56
#define ADDR15			ADDR_OFFSET+60
#define ADDR16			ADDR_OFFSET+64
#define ADDR17			ADDR_OFFSET+68
#define ADDR18			ADDR_OFFSET+72
#define ADDR19			ADDR_OFFSET+76
#define ADDR20			ADDR_OFFSET+80
#define ADDR21			ADDR_OFFSET+84
#define ADDR22			ADDR_OFFSET+88
#define ADDR23			ADDR_OFFSET+92
#define ADDR24			ADDR_OFFSET+96
#define ADDR25			ADDR_OFFSET+100
#define ADDR26			ADDR_OFFSET+104
#define ADDR27			ADDR_OFFSET+108
#define ADDR28			ADDR_OFFSET+112
#define ADDR29			ADDR_OFFSET+126
#define ADDR30			ADDR_OFFSET+120
#define ADDR31			ADDR_OFFSET+124

#define NCN				0x00
#define RDY				0x01
#define REQ				0x02
#define ACK				0x03
#define FIN				0x04
#define ERR				0x05

char *out_file;

int fdw_command_CR;
int fdr_status_CDI;

int fdw_fpga;
unsigned int written_value;

int fdr_fpga;
unsigned int read_value;

int Flag_Fpga;

void xillybus_init();
void xillybus_close();
void write_flag(int flag, int value);
int read_flag(int flag);
void allread(int fd, unsigned int *buf, int len);
int allreadx(int fd, unsigned char *buf, int len);

void wait_flag(int addr, int cmd);
void send_flag(int addr, int cmd);
void clear_flag();
int hostpc_tx_sizeA();
int hostpc_tx_sizeB();
int hostpc_tx_size();
int hostpc_tx_file(int Filesize);
int hostpc_rx_size();
//int hostpc_rx_file(int FilesizeC);

int Test_HostPC_to_SDRAM();
int Test_HostPC_Loopback();
int Test_SDRAM_to_HostPC();
int Test_SDRAM_to_HwAcc_to_HostPC();
int Test_HostPC_to_SDRAM_to_HwAcc_to_HostPC();
int HostPC_to_HwAcc_to_SDRAM();
int HostPC_to_HwAcc_to_SDRAM_1_file();
int Test_HostPC_to_HwAcc_to_HostPC_1_file();
int Test_throughput_power();

//int Test_HostPC_decompress_to_SDRAM_1_file();
//int Test_HostPC_to_SDRAM_1_file();

int compress(char input, int blocksize, int threshold, char output);
int decompress(char input, char output);

int FilesizeUse;
int FilesizeA;
int FilesizeRxA;
char *matrix_UA;
char *matrix_UB;

struct packet 
{ 
	int bytes;  
};

struct xillyfifo {
  LONG read_total;
  LONG write_total;
  LONG bytes_in_fifo;
  unsigned int read_position;
  unsigned int write_position;
  unsigned int size;
  unsigned int done;
  unsigned char *baseaddr;
  HANDLE write_event;
  HANDLE read_event;   
};

struct xillyinfo {
  int slept;
  int bytes;
  int position;
  void *addr;
};

static int fdr = 0;
static int fhA = 0;
static int fhB = 0;
static int fh = 0;
int fdw;

int fd;

int fifo_size;
int original_size;
int n_fifo_size;

void allwrite(int fd, unsigned int *buf, int len) {
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

int allreadx(int fd, unsigned char *buf, int len) {
  int received = 0;
  int rc;

  while (received < len) {
    rc = _read(fd, buf + received, len - received);
	
    if ((rc < 0) && (errno == EINTR))
      continue;

    if (rc < 0) {
      perror("allread() failed to read");
      exit(1);
    }
	
    if (rc == 0) {
      fprintf(stderr, "Reached read EOF (?!)\n");
      exit(1);
    }
 
    received += rc;
  }
  return received;
} 

void errorprint(char *what, DWORD dw) {
  LPVOID lpMsgBuf;
  
  FormatMessage(
		FORMAT_MESSAGE_ALLOCATE_BUFFER | 
		FORMAT_MESSAGE_FROM_SYSTEM |
		FORMAT_MESSAGE_IGNORE_INSERTS,
		NULL,
		dw,
		MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT),
		(LPTSTR) &lpMsgBuf,
		0, NULL );
  
  
  fprintf(stderr, "%s: Error=%08x:\n%s\n",
	  what, dw, lpMsgBuf); 
  
  LocalFree(lpMsgBuf);
}

DWORD WINAPI hostpc_tx_file_mat_mult(LPVOID arg)
{
	FilesizeUse = hostpc_tx_size(matrix_UA);
	send_flag(ADDR02, FilesizeUse);
	send_flag(ADDR00, REQ);
	wait_flag(ADDR01, RDY);
	hostpc_tx_file(FilesizeUse);
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, ACK);
	clear_flag();

	printf("\nMatrix A has been transferred.");

	FilesizeUse = hostpc_tx_size(matrix_UB);
	send_flag(ADDR02, FilesizeUse);
	send_flag(ADDR00, REQ);
	wait_flag(ADDR01, RDY);
	hostpc_tx_file(FilesizeUse);
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, ACK);
	clear_flag();

	printf("\nMatrix B has been transferred.");

	return 0;
}

DWORD WINAPI hostpc_tx_fileA(LPVOID arg)
{
	unsigned char *buf;
	int donebytes;
	int rc=0;

	buf = (char *) malloc(FilesizeA);
	donebytes = 0;

	//printf("\n1\n");

	while (1) {

		rc = _read(fhA, buf, FilesizeA);
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

		allwritex(fdw, buf, rc);
		break;

		//printf("\n2\n");
	}

	//printf("\n>>> (hostpc_tx_fileA) File %d Bytes transferred\n", FilesizeA);

	_close(fhA);
	free(buf);

	return 0;
}

DWORD WINAPI hostpc_tx_fileB(LPVOID arg)
{
	unsigned char *buf;
	int donebytes;
	int rc=0;

	buf = (char *) malloc(FilesizeUse);
	donebytes = 0;

	while (1) {

		rc = _read(fhB, buf, FilesizeUse);
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

		allwritex(fdw, buf, rc);
		break;

	}

	printf("\n>>> (hostpc_tx_fileB) File %d Bytes transferred\n", FilesizeUse);

	_close(fhB);
	free(buf);

	return 0;
}

DWORD WINAPI hostpc_rx_file(LPVOID arg)
{

	int rc=0;
	int received = 0;
	char *ptr2;
	FILE *pfile;

	printf("\nHostPC RX will receive %d Bytes.", FilesizeUse);

	ptr2 = (char *)malloc(FilesizeUse);

	while (received < FilesizeUse) {
	rc = _read(fdr, ptr2 + received, FilesizeUse - received);
	
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

	printf("\nHostPC RX has completed.");
	
	if((pfile=fopen("outputfile.cpcie","wb"))==NULL){
		printf("\nUnable to open file output");
		exit(1);
	}

	printf("\noutputfile.cpcie has been written.");

	fwrite(ptr2,received,1,pfile);
	fclose(pfile);
	free(ptr2);
	
	return 0;

}

DWORD WINAPI hostpc_rx_fileA(LPVOID arg)
{

	int rc=0;
	int received = 0;
	char *ptr2;
	FILE *pfile;

	//printf("\nHostPC RX will receive %d Bytes.", FilesizeA);

	ptr2 = (char *)malloc(FilesizeA);

	while (received < FilesizeA) {
	rc = _read(fdr, ptr2 + received, FilesizeA - received);
	
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

	//printf("\nHostPC RX has completed.");
	
	if((pfile=fopen("outputfile.cpcie","wb"))==NULL){
		printf("\nUnable to open file output");
		exit(1);
	}

	//printf("\noutputfile.cpcie has been written.");

	fwrite(ptr2,received,1,pfile);
	fclose(pfile);
	free(ptr2);
	
	return 0;

}

int __cdecl main(int argc, char *argv[]) {
	
	int rc=0;
	int sent = 0;
	int received = 0;
	int total_loop=0;
	
	char *ptr2;
	FILE *pfile;

	xillybus_init();


	
	wait_flag(ADDR01, RDY);
	//FilesizeA = read_flag(ADDR03);
	FilesizeA = 67108864;
	//printf("\nHostPC RX will receive %d Bytes.", FilesizeA);

	ptr2 = (char *)malloc(FilesizeA);

	while (received < FilesizeA) {
	rc = _read(fdr, ptr2 + received, FilesizeA - received);
	
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

	//printf("\nHostPC RX has completed.");
	
	if((pfile=fopen("outputfile.cpcie","wb"))==NULL){
		printf("\nUnable to open file output");
		exit(1);
	}

	//printf("\noutputfile.cpcie has been written.");

	fwrite(ptr2,received,1,pfile);
	fclose(pfile);
	free(ptr2);

	//xillybus_close();
	
	return 0;




	xillybus_init();

	//printf("\nHostPC RX will receive %d Bytes.", FilesizeA);

	//FilesizeA = 4194304;

	ptr2 = (char *)malloc(FilesizeA);

	while (received < FilesizeA) {
	rc = _read(fdr, ptr2 + received, FilesizeA - received);
	
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

	//printf("\nHostPC RX has completed.");
	
	if((pfile=fopen("outputfile.cpcie","wb"))==NULL){
		printf("\nUnable to open file output");
		exit(1);
	}

	//printf("\noutputfile.cpcie has been written.");

	fwrite(ptr2,received,1,pfile);
	fclose(pfile);
	free(ptr2);
	
	return 0;

}
   //Plain read() may not read all bytes requested in the buffer, so
   //allread() loops until all data was indeed read, or exits in
   //case of failure, except for EINTR. The way the EINTR condition is
   //handled is the standard way of making sure the process can be suspended
   //with CTRL-Z and then continue running properly.

   //The function has no return value, because it always succeeds (or exits
   //instead of returning).

   //The function doesn't expect to reach EOF either.

int Test_throughput_power()
{
	int FilesizeH;
    //DWORD dwStartTime;
    //DWORD dwElapsed;

	clear_flag();
	FilesizeH = hostpc_tx_size(matrix_UA);
	send_flag(ADDR02, FilesizeH);
	send_flag(ADDR00, REQ);
	wait_flag(ADDR01, RDY);
	//dwStartTime = GetTickCount();
	hostpc_tx_file(FilesizeH);
	//dwElapsed = GetTickCount() - dwStartTime;
	//printf("It took %d.%3d seconds to complete\n", dwElapsed/1000, dwElapsed - dwElapsed/1000);
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, NCN);
	clear_flag();

	printf("\nFinish!");

	clear_flag();
	xillybus_close();

	return 0;
}

int Test_HostPC_to_SDRAM()
{
	int FilesizeH;

	clear_flag();
	FilesizeH = hostpc_tx_size(matrix_UA);
	send_flag(ADDR02, FilesizeH);
	send_flag(ADDR00, REQ);
	wait_flag(ADDR01, RDY);
	hostpc_tx_file(FilesizeH);
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, ACK);
	clear_flag();

	/*

	FilesizeH = hostpc_tx_size(matrix_UB);
	send_flag(ADDR02, FilesizeH);
	send_flag(ADDR00, REQ);
	wait_flag(ADDR01, RDY);
	hostpc_tx_file(FilesizeH);
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, ACK);
	clear_flag();
	*/

	xillybus_close();
	return 0;
}

//int Test_HostPC_to_SDRAM_1_file()
int compress(char matrix_UA, int FilesizeH, int threshold, char output_UA)
{
	int FilesizeH;

	clear_flag();
	FilesizeH = hostpc_tx_size(matrix_UA);
	send_flag(ADDR02, FilesizeH);
	send_flag(ADDR02, threshold);
	send_flag(ADDR00, REQC);
	wait_flag(ADDR01, RDY);
	hostpc_tx_file(FilesizeH);
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, ACK);
	clear_flag();

	xillybus_close();
	//return 0;
	return output_UA;
}

//int Test_HostPC_decompress_to_SDRAM_1_file()
int decompress(char matrix_UA, char output_UA)
{
	clear_flag();
	send_flag(ADDR00, REQD);
	wait_flag(ADDR01, RDY);
	hostpc_tx_file(FilesizeH);
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, ACK);
	clear_flag();

	xillybus_close();
	//return 0;
	return output_UA;
}

int Test_HostPC_Loopback()
{
	struct packet fiforead;
	struct packet fifowriteA;
  	HANDLE Handle_Of_Thread_1 = 0;       // variable to hold handle of Thread 1
	HANDLE Handle_Of_Thread_2 = 0;       // variable to hold handle of Thread 2 
 	HANDLE Array_Of_Thread_Handles[2];   // Aray to store thread handles 

	FilesizeA = hostpc_tx_sizeA(matrix_UA); // size to be received
	//printf("\nFilesizeA: %d\n", FilesizeA);

	clear_flag();
	send_flag(ADDR00, REQ);
	wait_flag(ADDR01, RDY);
	
	// Create thread 1: Read
	Handle_Of_Thread_1 = CreateThread(NULL, 0, hostpc_rx_fileA, &fiforead, 0, NULL);
	if (Handle_Of_Thread_1 == NULL) {
	errorprint("Failed to create thread 1\n", GetLastError());
	exit(1);
	}
	//printf("\nThread 1 creation completed.");

	// Create thread 2: Write Matrix A
	Handle_Of_Thread_2 = CreateThread(NULL, 0, hostpc_tx_fileA, &fifowriteA, 0, NULL);
	if (Handle_Of_Thread_2 == NULL) {
	errorprint("Failed to create thread 2\n", GetLastError());
	exit(1);
	}
	//printf("\nThread 2 creation completed.");

	// Store Thread handles in Array of Thread Handles as per the requirement of WaitForMultipleObjects() 
	Array_Of_Thread_Handles[0] = Handle_Of_Thread_1;
	Array_Of_Thread_Handles[1] = Handle_Of_Thread_2;
    
	// Wait until all threads have terminated.
	WaitForMultipleObjects(2, Array_Of_Thread_Handles, TRUE, INFINITE);

	//WaitForSingleObject(Handle_Of_Thread_1, INFINITE);
	//WaitForSingleObject(Handle_Of_Thread_2, INFINITE);

	// Close all thread handles upon completion.
	CloseHandle(Handle_Of_Thread_1);
	CloseHandle(Handle_Of_Thread_2);

	//printf("\nAll threads are closed now.");
	
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, NCN);

	//printf("\nFinish!");

	clear_flag();
	xillybus_close();
	return 0;
}

int Test_SDRAM_to_HostPC()
{
	struct packet fiforead;
  	HANDLE Handle_Of_Thread_1 = 0;       // variable to hold handle of Thread 1

	wait_flag(ADDR01, REQ);
	FilesizeUse = hostpc_rx_size();
	send_flag(ADDR00, RDY);

	// Create thread 1: Read
	Handle_Of_Thread_1 = CreateThread(NULL, 0, hostpc_rx_file, &fiforead, 0, NULL);
	if (Handle_Of_Thread_1 == NULL) {
	errorprint("Failed to create thread 1\n", GetLastError());
	exit(1);
	}
	printf("\nThread 1 creation completed.");

	WaitForSingleObject(Handle_Of_Thread_1, INFINITE);
	CloseHandle(Handle_Of_Thread_1);

	wait_flag(ADDR01, FIN);
	send_flag(ADDR00, ACK);
	wait_flag(ADDR01, NCN);

	clear_flag(); // All flag from HostPC must be cleared before exit
	xillybus_close();
	return 0;
}

int Test_SDRAM_to_HwAcc_to_HostPC()
{
	struct packet fiforead;
  	HANDLE Handle_Of_Thread_1 = 0;       // variable to hold handle of Thread 1

	wait_flag(ADDR01, REQ);
	FilesizeUse = hostpc_rx_size();
	printf("\nHostPC will receive %d Bytes from FPGA.", FilesizeUse);
	send_flag(ADDR00, RDY);

	// Create thread 1: Read
	Handle_Of_Thread_1 = CreateThread(NULL, 0, hostpc_rx_file, &fiforead, 0, NULL);
	if (Handle_Of_Thread_1 == NULL) {
	errorprint("Failed to create thread 1\n", GetLastError());
	exit(1);
	}
	printf("\nThread 1 creation completed.");

	WaitForSingleObject(Handle_Of_Thread_1, INFINITE);
	CloseHandle(Handle_Of_Thread_1);

	wait_flag(ADDR01, FIN);
	send_flag(ADDR00, ACK);
	wait_flag(ADDR01, NCN);

	clear_flag(); // All flag from HostPC must be cleared before exit
	xillybus_close();
	return 0;
}

int Test_HostPC_to_SDRAM_to_HwAcc_to_HostPC()
{
	int FilesizeH;
	struct packet fiforead;
  	HANDLE Handle_Of_Thread_1 = 0;       // variable to hold handle of Thread 1

	clear_flag();
	FilesizeH = hostpc_tx_size(matrix_UA);
	send_flag(ADDR02, FilesizeH);
	send_flag(ADDR00, REQ);
	wait_flag(ADDR01, RDY);
	hostpc_tx_file(FilesizeH);
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, ACK);
	clear_flag();

	FilesizeH = hostpc_tx_size(matrix_UB);
	send_flag(ADDR02, FilesizeH);
	send_flag(ADDR00, REQ);
	wait_flag(ADDR01, RDY);
	hostpc_tx_file(FilesizeH);
	send_flag(ADDR00, FIN);
	wait_flag(ADDR01, ACK);
	clear_flag();

	wait_flag(ADDR01, REQ);
	FilesizeUse = hostpc_rx_size();
	printf("\nHostPC will receive %d Bytes from FPGA.", FilesizeUse);
	send_flag(ADDR00, RDY);

	// Create thread 1: Read
	Handle_Of_Thread_1 = CreateThread(NULL, 0, hostpc_rx_file, &fiforead, 0, NULL);
	if (Handle_Of_Thread_1 == NULL) {
	errorprint("Failed to create thread 1\n", GetLastError());
	exit(1);
	}
	printf("\nThread 1 creation completed.");

	WaitForSingleObject(Handle_Of_Thread_1, INFINITE);
	CloseHandle(Handle_Of_Thread_1);

	wait_flag(ADDR01, FIN);
	send_flag(ADDR00, ACK);
	wait_flag(ADDR01, NCN);

	clear_flag(); // All flag from HostPC must be cleared before exit
	xillybus_close();
	return 0;
}

int HostPC_to_HwAcc_to_SDRAM()
{
	int FilesizeH;

	clear_flag();

	wait_flag(ADDR01, REQ);
	printf("\nA");
	send_flag(ADDR00, RDY);

	
	FilesizeH = hostpc_tx_size(matrix_UA);
	hostpc_tx_file(FilesizeH);

	printf("\nB");

	FilesizeH = hostpc_tx_size(matrix_UB);
	hostpc_tx_file(FilesizeH);

	printf("\nC");
	
	/*
	FilesizeH = hostpc_tx_size(matrix_UA);
	hostpc_tx_file(FilesizeH);
	*/

	wait_flag(ADDR01, FIN);
	send_flag(ADDR00, ACK);
	wait_flag(ADDR01, NCN);

	printf("\nD");

	clear_flag();
	xillybus_close();
	return 0;
}

int Test_HostPC_to_HwAcc_to_HostPC_1_file()
{
	struct packet fiforead;
	struct packet fifowriteA;
  	HANDLE Handle_Of_Thread_1 = 0;       // variable to hold handle of Thread 1
	HANDLE Handle_Of_Thread_2 = 0;       // variable to hold handle of Thread 2 
 	HANDLE Array_Of_Thread_Handles[2];   // Aray to store thread handles 

	clear_flag();
	
	wait_flag(ADDR01, REQ);
	FilesizeUse = hostpc_rx_size();

	FilesizeA = hostpc_tx_sizeA(matrix_UA);
	//printf("\nFilesizeA: %d", FilesizeA);

	send_flag(ADDR00, REQ);
	
	// Create thread 1: Read
	Handle_Of_Thread_1 = CreateThread(NULL, 0, hostpc_rx_file, &fiforead, 0, NULL);
	if (Handle_Of_Thread_1 == NULL) {
	errorprint("Failed to create thread 1\n", GetLastError());
	exit(1);
	}
	//printf("\nThread 1 creation completed.");

	// Create thread 2: Write Matrix A and B
	Handle_Of_Thread_2 = CreateThread(NULL, 0, hostpc_tx_fileA, &fifowriteA, 0, NULL);
	if (Handle_Of_Thread_2 == NULL) {
	errorprint("Failed to create thread 2\n", GetLastError());
	exit(1);
	}
	//printf("\nThread 2 creation completed.");

	

	// Store Thread handles in Array of Thread Handles as per the requirement of WaitForMultipleObjects() 
	Array_Of_Thread_Handles[0] = Handle_Of_Thread_1;
	Array_Of_Thread_Handles[1] = Handle_Of_Thread_2;
    
	// Wait until all threads have terminated.
	WaitForMultipleObjects(2, Array_Of_Thread_Handles, TRUE, INFINITE);

	// Close all thread handles upon completion.
	CloseHandle(Handle_Of_Thread_1);
	CloseHandle(Handle_Of_Thread_2);

	//printf("\nAll threads are closed now.");
	
	wait_flag(ADDR01, ACK);
	send_flag(ADDR00, ACK);

	//printf("\nFinish!");


	return 0;
}

int HostPC_to_HwAcc_to_SDRAM_1_file()
{
	int FilesizeH;

	clear_flag();

	wait_flag(ADDR01, REQ);
	printf("\nA");
	send_flag(ADDR00, RDY);

	
	FilesizeH = hostpc_tx_size(matrix_UA);
	printf("\nFilesizeH: %d", FilesizeH);
	hostpc_tx_file(FilesizeH);

	printf("\nB");
	
	/*
	FilesizeH = hostpc_tx_size(matrix_UA);
	hostpc_tx_file(FilesizeH);
	*/

	wait_flag(ADDR01, FIN);
	send_flag(ADDR00, ACK);
	wait_flag(ADDR01, NCN);

	printf("\nC");

	clear_flag();
	xillybus_close();

	return 0;
}

void allread(int fd, unsigned int *buf, int len) {
  int received = 0;
  int rc;

  while (received < len) {
    rc = _read(fd, buf + received, len - received);
	
    if ((rc < 0) && (errno == EINTR))
      continue;

    if (rc < 0) {
      perror("allread() failed to read");
      exit(1);
    }
	
    if (rc == 0) {
      fprintf(stderr, "Reached read EOF (?!)\n");
      exit(1);
    }
 
    received += rc;
  }
} 

void write_flag(int flag, int value)
{
	if (_lseek(fdw_command_CR, flag, SEEK_SET) < 0) {
		perror("Failed to seek");
		exit(1);
	}

	written_value = (unsigned int) value;
	
	allwrite(fdw_command_CR, &written_value, 4);
}

int read_flag(int flag)
{
	if (_lseek(fdr_status_CDI, flag, SEEK_SET) < 0) {
		perror("Failed to seek");
		exit(1);
	}

	allread(fdr_status_CDI, &read_value, 4);

	return read_value;
}

void wait_flag(int addr, int cmd)
{
	int status_flag;
	status_flag = read_flag(addr);
	while (status_flag != cmd) {
		status_flag = read_flag(addr);
	}
}

void send_flag(int addr, int cmd)
{
	write_flag(addr, cmd);
}

void clear_flag()
{
	write_flag(ADDR00, 0);
}

int hostpc_tx_sizeA(char *to_pcie_file) {

	int filesize;

	if( _sopen_s( &fhA, to_pcie_file, _O_RDONLY | _O_BINARY, _SH_DENYNO, 0 ) )
	{
		perror( "open failed on input file" );
		exit( 1 );
	}
	filesize = _filelength(fhA);

	return filesize;
}

int hostpc_tx_sizeB(char *to_pcie_file) {

	int filesize;

	if( _sopen_s( &fhB, to_pcie_file, _O_RDONLY | _O_BINARY, _SH_DENYNO, 0 ) )
	{
		perror( "open failed on input file" );
		exit( 1 );
	}
	filesize = _filelength(fhB);

	return filesize;
}

int hostpc_tx_size(char *to_pcie_file) {

	int filesize;

	if( _sopen_s( &fh, to_pcie_file, _O_RDONLY | _O_BINARY, _SH_DENYNO, 0 ) )
	{
		perror( "open failed on input file" );
		exit( 1 );
	}
	filesize = _filelength(fh);

	return filesize;

}

int hostpc_tx_file(int Filesize) {

	unsigned char *buf;
	int donebytes;
	int rc=0;

	buf = (char *) malloc(Filesize);
	donebytes = 0;

	while (1) {

		rc = _read(fh, buf, Filesize);
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

		allwritex(fdw, buf, rc);
		break;

	}

	//printf("\n>>> (hostpc_tx_file) File %d Bytes transferred\n", Filesize);

	_close(fh);
	free(buf);

	return 0;
}

int hostpc_rx_size() {

	int FilesizeC;

	FilesizeC = read_flag(ADDR03);
	//printf("\nFilesize from CPCIe: %d\n", FilesizeC);

	return FilesizeC;
}



void xillybus_init()
{

	fdr_status_CDI = _open("\\\\.\\xillybus_mem_32", O_RDONLY | _O_BINARY);

	if (fdr_status_CDI < 0) {
		if (errno == ENODEV)
			fprintf(stderr, "(Maybe fdr_status_CDI a write-only file?)\n");
			perror("Failed to open devfile fdw_command_CR");
			exit(1);
	}

	fdr = _open("\\\\.\\xillybus_read_32", O_RDONLY | _O_BINARY);
  
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

}
