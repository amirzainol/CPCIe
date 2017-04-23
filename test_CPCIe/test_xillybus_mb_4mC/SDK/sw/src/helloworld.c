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
#define PROC_STATUS		ADDR03			// Status of processor
#define PROC_C_SIZE		ADDR04			// Compressed size

u32 file_size = 1024; // in Bytes

// This type is a word address ptr.
typedef volatile u32 *U32Ptr;
#define WR_WORD(ADDR, DATA)	(*(U32Ptr)(ADDR) = (DATA))

int main()
{
	u8 stat_done;
	u32 MyAdr;

	MyAdr = 0xC0000000;

    WR_WORD(MyAdr+PROC_STATUS, 0);

    Xil_Out32(0x44A00008, (u32) file_size); // write command (file size) to mCompressor
	Xil_Out32(0x44A00004, (u32) 0x80000000); // write command (reset all) to mCompressor
	Xil_Out32(0x44A00004, (u32) 0x41000802); // write command (compress with blocksize 1 KB) to mCompressor
	//Xil_Out32(0x44A00004, (u32) 0x41000804); // write command (compress with blocksize 2 KB) to mCompressor
	//Xil_Out32(0x44A00004, (u32) 0x41000808); // write command (compress with blocksize 4 KB) to mCompressor

	stat_done = Xil_In8(0x44A00000);
	while(!stat_done) {
		stat_done = Xil_In8(0x44A00000);
	}

	WR_WORD(MyAdr+PROC_STATUS, 1);
	WR_WORD(MyAdr+PROC_C_SIZE, Xil_In32(0x44A0000C));

	//xil_printf("\r\ncompressed size %d\r\n", Xil_In32(0x44A0000C));

    return 0;
}


