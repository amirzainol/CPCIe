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

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "xil_io.h"
#include "xaxidma.h"
#include "xparameters.h"
#include "platform.h"

#define DMA_DEV_ID		XPAR_AXIDMA_0_DEVICE_ID

#define MEM_BASE_ADDR		(XPAR_MIG_7SERIES_0_BASEADDR + 0x10000000)

#define TX_BUFFER_BASE		(MEM_BASE_ADDR + 0x00100000)
#define RX_BUFFER_BASE		(MEM_BASE_ADDR + 0x02100000) // max 8 MB axi dma

void dataset_FFFFFFFF();
int init_dma();
void clear_data();

XAxiDma AxiDma;
u32 file_size = 9216; // in 9 KB

int main()
{

	int Status;
	int i;
	u32 *TxBufferPtr;
	u32 *RxBufferPtr;
	int stat_done;

	init_platform();

	TxBufferPtr = (u32 *)TX_BUFFER_BASE;
	RxBufferPtr = (u32 *)RX_BUFFER_BASE;

    	xil_printf("Hello World\r\n");

	Status = init_dma();
	if(Status != XST_SUCCESS){
		return XST_FAILURE;
	}

	Xil_Out32(0x44A00004, (u32) 0x80000000); // write command (reset all) to mCompressor
	Xil_Out32(0x44A00004, (u32) 0x00000000); // write command (null) to mCompressor

	Xil_Out32(0x44A00008, (u32) file_size); // write command (file size) to mCompressor

	Xil_Out32(0x44A00004, (u32) 0x41000802); // write command (compress with blocksize 1 KB) to mCompressor
	//Xil_Out32(0x44A00004, (u32) 0x41000804); // write command (compress with blocksize 2 KB) to mCompressor
	//Xil_Out32(0x44A00004, (u32) 0x41000808); // write command (compress with blocksize 4 KB) to mCompressor

	clear_data();
	Xil_DCacheFlushRange((u32)RxBufferPtr, (u32) file_size);

	dataset_FFFFFFFF();
	Xil_DCacheFlushRange((u32)TxBufferPtr, (u32) file_size);

	Status = XAxiDma_SimpleTransfer(&AxiDma,(u32) TxBufferPtr,
			(u32) file_size, XAXIDMA_DMA_TO_DEVICE);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	xil_printf("\r\ncompressed size %d\r\n", Xil_In32(0x44A0000C));

	stat_done = Xil_In8(0x44A00000);
	while(!stat_done) {
		stat_done = Xil_In8(0x44A00000);
		for (i=0; i<10000; i++);
	}

	xil_printf("\r\ncompressed size %d\r\n", Xil_In32(0x44A0000C));

	Status = XAxiDma_SimpleTransfer(&AxiDma,(u32) RxBufferPtr,
			(u32) 72, XAXIDMA_DEVICE_TO_DMA);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Xil_DCacheFlushRange((u32)RxBufferPtr, (u32) file_size);
	for(i = 0; i < 32; i++) {
		xil_printf("\r\n%d\t %08X", i, (unsigned int)RxBufferPtr[i]);
	}

	xil_printf("\r\n");

	cleanup_platform();

    return 0;
}

void clear_data()
{
	// Everything in here is fine

	u32 *RxBufferPtr;
	u32 i=0;

	RxBufferPtr = (u32 *)RX_BUFFER_BASE;

	for (i=0; i<file_size/4; i++) {
		RxBufferPtr[i] = 0;
	}
}

void dataset_FFFFFFFF()
{

	// Everything in here is fine

	u32 *TxBufferPtr;
	u32 i=0;

	TxBufferPtr = (u32 *)TX_BUFFER_BASE;

	for (i=0; i<file_size/4; i++) {
		TxBufferPtr[i] = 0xFFFFFFFF;
	}
}

int init_dma() {

	XAxiDma_Config *CfgPtr;
	int status;

	CfgPtr = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
	if(!CfgPtr){
		//print("Error looking for AXI DMA config\n\r");
		return XST_FAILURE;
	}
	status = XAxiDma_CfgInitialize(&AxiDma,CfgPtr);
	if(status != XST_SUCCESS){
		//print("Error initializing DMA\n\r");
		return XST_FAILURE;
	}
	//check for scatter gather mode
	if(XAxiDma_HasSg(&AxiDma)){
		//print("Error DMA configured in SG mode\n\r");
		return XST_FAILURE;
	}
	/* Disable interrupts, we use polling mode */
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma, XAXIDMA_IRQ_ALL_MASK,XAXIDMA_DMA_TO_DEVICE);

	return XST_SUCCESS;
}
