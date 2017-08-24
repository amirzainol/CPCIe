// README!

// Change the heap and stack size (in Generate Linker Script) to 16384 Bytes each

#include <stdio.h>
#include "platform.h"
#include "xaxidma.h"
#include "xparameters.h"
#include "xil_io.h"
#include <stdlib.h>

#define DMA_DEV_ID_FIFO2SDRAM	XPAR_AXI_DMA_FIFO2SDRAM_DEVICE_ID
#define DMA_DEV_ID_SDRAM2FIFO	XPAR_AXI_DMA_SDRAM2FIFO_DEVICE_ID

#define MEM_BASE_ADDR			(XPAR_MIG_7SERIES_0_BASEADDR + 0x10000000)

#define TX_BUFFER_BASE			(MEM_BASE_ADDR + 0x00100000)
#define RX_BUFFER_BASE			(MEM_BASE_ADDR + 0x02100000) // max 8 MB axi dma

#define MAX_PKT_LEN_WORDS	256
#define MAX_PKT_LEN		MAX_PKT_LEN_WORDS*4

/************************** Function Prototypes ******************************/

int XAxiDma_SimplePollExample();
static int CheckData(void);

/************************** Variable Definitions *****************************/
/*
 * Device instance definitions
 */

XAxiDma AxiDma_SDRAM2FIFO;
XAxiDma AxiDma_FIFO2SDRAM;

int main()
{
	int Status;

    init_platform();

	/* Run the poll example for simple transfer */
	Status = XAxiDma_SimplePollExample();

	if (Status != XST_SUCCESS) {

		xil_printf("XAxiDma_SimplePollExample: Failed\r\n");
		return XST_FAILURE;
	}

	xil_printf("XAxiDma_SimplePollExample: Passed\r\n");

	return XST_SUCCESS;
}

/*****************************************************************************/
/**
* The example to do the simple transfer through polling. The constant
* NUMBER_OF_TRANSFERS defines how many times a simple transfer is repeated.
*
* @param	DeviceId is the Device Id of the XAxiDma instance
*
* @return
*		- XST_SUCCESS if example finishes successfully
*		- XST_FAILURE if error occurs
*
* @note		None
*
*
******************************************************************************/
int XAxiDma_SimplePollExample()
{
	XAxiDma_Config *CfgPtr;
	int Status;
	u32 Index;
	u32 *TxBufferPtr;
	u32 *RxBufferPtr;
	u32 Value;

	TxBufferPtr = (u32 *)TX_BUFFER_BASE;
	RxBufferPtr = (u32 *)RX_BUFFER_BASE;

	Xil_Out32(0x44A00000, 0x80000000);
	Xil_Out32(0x44A00004, 0x00004000);
	Xil_Out32(0x44A00000, 0x21000802);

	/* Initialize the XAxiDma device.
	 */
	CfgPtr = XAxiDma_LookupConfig(DMA_DEV_ID_SDRAM2FIFO);
	if (!CfgPtr) {
		xil_printf("No config found for %d\r\n", DMA_DEV_ID_SDRAM2FIFO);
		return XST_FAILURE;
	}

	Status = XAxiDma_CfgInitialize(&AxiDma_SDRAM2FIFO, CfgPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}

	if(XAxiDma_HasSg(&AxiDma_SDRAM2FIFO)){
		xil_printf("Device configured as SG mode \r\n");
		return XST_FAILURE;
	}

	CfgPtr = XAxiDma_LookupConfig(DMA_DEV_ID_FIFO2SDRAM);
	if (!CfgPtr) {
		xil_printf("No config found for %d\r\n", DMA_DEV_ID_FIFO2SDRAM);
		return XST_FAILURE;
	}

	Status = XAxiDma_CfgInitialize(&AxiDma_FIFO2SDRAM, CfgPtr);
	if (Status != XST_SUCCESS) {
		xil_printf("Initialization failed %d\r\n", Status);
		return XST_FAILURE;
	}

	if(XAxiDma_HasSg(&AxiDma_FIFO2SDRAM)){
		xil_printf("Device configured as SG mode \r\n");
		return XST_FAILURE;
	}

	/* Disable interrupts, we use polling mode
	 */
	XAxiDma_IntrDisable(&AxiDma_SDRAM2FIFO, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma_SDRAM2FIFO, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DMA_TO_DEVICE);

	XAxiDma_IntrDisable(&AxiDma_FIFO2SDRAM, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&AxiDma_FIFO2SDRAM, XAXIDMA_IRQ_ALL_MASK,
						XAXIDMA_DMA_TO_DEVICE);

	Value = 0;

	for(Index = 0; Index < MAX_PKT_LEN_WORDS*16; Index++) {
			TxBufferPtr[Index] = 0x00000000 + Value;
			Value++;
	}

	// CRC Value after compression

	// 1D6D5420
	// 5854330F
	// 971F9A7E
	// D226FD51

	// 0D49D52B
	// 4870B204
	// 873B1B75
	// C2027C5A

	// 3D245636
	// 781D3119
	// B7569868
	// F26FFF47

	// 2D00D73D
	// 6839B012
	// A7721963
	// E24B7E4C

	Status = XAxiDma_SimpleTransfer(&AxiDma_FIFO2SDRAM,(u32) RxBufferPtr,
			8316, XAXIDMA_DEVICE_TO_DMA);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Xil_DCacheFlushRange((u32)TxBufferPtr, 16384);

		Status = XAxiDma_SimpleTransfer(&AxiDma_SDRAM2FIFO,(u32) TxBufferPtr,
					16384+64, XAXIDMA_DMA_TO_DEVICE);

		if (Status != XST_SUCCESS) {
			return XST_FAILURE;
		}

		//while(Xil_In32(0x43C00008)){}

		//while (XAxiDma_Busy(&AxiDma_SDRAM2FIFO,XAXIDMA_DMA_TO_DEVICE)) {}

		//while (XAxiDma_Busy(&AxiDma_FIFO2SDRAM,XAXIDMA_DEVICE_TO_DMA)) {}

		CheckData();

	/* Test finishes successfully
	 */
	return XST_SUCCESS;
}

static int CheckData(void)
{
	u32 *RxPacket;
	u32 Index = 0;

	RxPacket = (u32 *) RX_BUFFER_BASE;

	Xil_DCacheInvalidateRange((u32)RxPacket, 8316);
	for(Index = 0; Index < 2079; Index++) {
		xil_printf("%08X\r\n", (unsigned int)RxPacket[Index]);
	}
	xil_printf("\r\n");

	return XST_SUCCESS;
}
