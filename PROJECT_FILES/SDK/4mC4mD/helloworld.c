/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* XILINX CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

#include <stdio.h>
#include "xil_io.h"
#include "xparameters.h"

#define ADDR_OFFSET		0
#define ADDR03			ADDR_OFFSET+12
#define ADDR04			ADDR_OFFSET+16
#define ADDR05			ADDR_OFFSET+20
#define ADDR06			ADDR_OFFSET+24
#define PROC_STATUS		ADDR03			// Status of processor
#define PROC_C_SIZE		ADDR04			// Compressed size
#define W_FILESIZE		ADDR05			// Write Filesize
#define W_BLOCKSIZE		ADDR06			// Write Blocksize

// This type is a word address ptr.
typedef volatile u32 *U32Ptr;

/*
 * Macros to read and write words directly to memory.
 */
#define WR_WORD(ADDR, DATA) (*(U32Ptr)(ADDR) = (DATA))
#define RD_WORD(ADDR, DATA) ((DATA) = *(U32Ptr)(ADDR))

u32 ADDR_MC = (u32) XPAR_MCOMPRESSOR_0_S00_AXI_BASEADDR;
u32 ADDR_MD = (u32) XPAR_MDECOMPRESSOR_0_S00_AXI_BASEADDR;
u32 SHARED_RAM = (u32) XPAR_AXI_BRAM_CTRL_0_S_AXI_BASEADDR;

int main()
{
	u8 stat_done;
	u32 file_size = 0; // in Bytes
	u32 block_size = 0;
	u8 bs = 0;

    WR_WORD(SHARED_RAM+PROC_STATUS, 0);
    WR_WORD(SHARED_RAM+W_FILESIZE, 0);
    RD_WORD(SHARED_RAM+W_FILESIZE, file_size);

	Xil_Out32(ADDR_MD+4, (u32) 0x80000000); // write command (reset all) to mCompressor
	Xil_Out32(ADDR_MD+4, (u32) 0x21000800+2); // write command (compress with blocksize 1 KB) to mCompressor

	/*
	while (!block_size) {
		RD_WORD(SHARED_RAM+W_BLOCKSIZE, block_size);
	}
	WR_WORD(SHARED_RAM+W_BLOCKSIZE, block_size);

	switch (block_size) {
	case 512:	bs = 1;	  break;
	case 1024:	bs = 2;	  break;
	case 2048:	bs = 4;	  break;
	case 4096:	bs = 8;	  break;
	default:			  break;
	}
	*/

	while (!file_size) {
		RD_WORD(SHARED_RAM+W_FILESIZE, file_size);
	}
	WR_WORD(SHARED_RAM+W_FILESIZE, file_size);

	xil_printf("\r\nfilesize %d\r\n", file_size);

    Xil_Out32(ADDR_MC+8, (u32) file_size); // write command (file size) to mCompressor
	Xil_Out32(ADDR_MC+4, (u32) 0x80000000); // write command (reset all) to mCompressor
	Xil_Out32(ADDR_MC+4, (u32) 0x41000800+2); // write command (compress with blocksize, bs) to mCompressor

	stat_done = Xil_In8(ADDR_MC+0);
	while(!stat_done) {
		stat_done = Xil_In8(ADDR_MC+0);
	}

	WR_WORD(SHARED_RAM+PROC_STATUS, 1);
	WR_WORD(SHARED_RAM+PROC_C_SIZE, Xil_In32(ADDR_MC+12));

	xil_printf("\r\nok\r\n");

	while(1);

    return 0;
}


