#include "main.h"

const float amb_temp_cpu = 80.0;
const float Rx_1 = 0.1;
const float Ry_1 = 0.1;
const float Rz_1 = 0.000049;
const float Cap_1 = 0.001365;

float kernel[(MAT_DIM+2)*(MAT_DIM+2)] = {
		0, 1, 0,
		1, 1, 1,
		0, 1, 0,
};

#define HORIZONTAL_PIXEL_WIDTH MAT_DIM
// 3x3 kernel
#define KERNEL_DIM 3

using namespace hls;

float func1Window(	hls::Window<KERNEL_DIM,KERNEL_DIM,float> *temp,
					hls::Window<KERNEL_DIM,KERNEL_DIM,float> *power);

void func_hls(
		stream<AXI_VALUE> &in_stream_0,
		stream<AXI_VALUE> &in_stream_1,
		stream<AXI_VALUE> &out_stream
) {

#pragma HLS INLINE off
#pragma HLS pipeline II=1 enable_flush

	AXI_VALUE aValue_in, aValue_out, bValue_in, bValue_out;
	int i,j;

	float y_buf[2][HORIZONTAL_PIXEL_WIDTH+2];
#pragma HLS array_partition variable=y_buf block factor=2 dim=1
#pragma HLS resource variable=y_buf core=RAM_2P

	// Defining the line buffer and setting the inter dependency to false through pragmas
	hls::LineBuffer<KERNEL_DIM,MAT_DIM+2,float> lineBuff;
	hls::LineBuffer<KERNEL_DIM,MAT_DIM+2,float> lineBuff_power;
	hls::Window<KERNEL_DIM,KERNEL_DIM,float> windowTemp;
	hls::Window<KERNEL_DIM,KERNEL_DIM,float> windowPower;
	// Index used to keep track of row,col
	int idxCol = 0;
	int idxRow = 0;
	int pixConvolved = 0;
	int pixConvolved_Power = 0;
	// Calculate delay to fix line-buffer offset
	int waitTicks = ((MAT_DIM+2)*(KERNEL_DIM-1)+KERNEL_DIM)/2;
	int countWait = 0;
	int sentPixels = 0;
	int operation = 0;

	Row: for(i = 0; i < MAT_DIM+2; i++) {
		Col: for(j = 0; j < MAT_DIM+2; j++) {

#pragma HLS PIPELINE // the HLS PIPELINE improves our latency

			union {	unsigned int ival; float oval; } converterA, converterB;

			if(i==0 || i==(MAT_DIM+1) || j==0 || j==(MAT_DIM+1))
			{
				converterA.ival = 0;
				converterB.ival = 0;
			}
			else
			{
				in_stream_0.read(aValue_in);
				converterA.ival = aValue_in.data;
				in_stream_1.read(bValue_in);
				converterB.ival = bValue_in.data;
			}

			// Put data on the LineBuffer
			lineBuff.shift_up(idxCol);
			lineBuff.insert_top(converterA.oval,idxCol); // Will put in val[2] of line buffer (Check Debug)

			lineBuff_power.shift_up(idxCol);
			lineBuff_power.insert_top(converterB.oval,idxCol);

			// Put data on the window and multiply with the kernel
			for (int idxWinRow = 0; idxWinRow < KERNEL_DIM; idxWinRow++)
			{
				for (int idxWinCol = 0; idxWinCol < KERNEL_DIM; idxWinCol++)
				{
					// idxWinCol + pixConvolved, will slide the window
					float val = (float)lineBuff.getval(idxWinRow,idxWinCol+pixConvolved);
					// Multiply kernel by the sampling window
					val = (float)kernel[(idxWinRow*KERNEL_DIM) + idxWinCol ] * val;
					windowTemp.insert(val,idxWinRow,idxWinCol);
				}
			}

			// Put data on the window and multiply with the kernel
			for (int idxWinRow = 0; idxWinRow < KERNEL_DIM; idxWinRow++)
			{
				for (int idxWinCol = 0; idxWinCol < KERNEL_DIM; idxWinCol++)
				{
					// idxWinCol + pixConvolved_Power, will slide the window
					float val = (float)lineBuff_power.getval(idxWinRow,idxWinCol+pixConvolved_Power);
					// Multiply kernel by the sampling window
					val = (float)kernel[(idxWinRow*KERNEL_DIM) + idxWinCol ] * val;
					windowPower.insert(val,idxWinRow,idxWinCol);
				}
			}

			// Avoid calculate out of the image boundaries
			float valOutput = 1;
			if ((idxRow >= KERNEL_DIM-1) && (idxCol >= KERNEL_DIM-1))
			{
				valOutput = func1Window(&windowTemp, &windowPower);
				pixConvolved++;
				pixConvolved_Power++;
			}

			countWait++;

			if (countWait > waitTicks)
			{
				if ((idxRow >= KERNEL_DIM-1) && (idxCol >= KERNEL_DIM-1))
				{
				//bValue.data = valOutput;
				union {	unsigned int oval; result_t ival; } converter;
				converter.ival = valOutput;
				aValue_out.data = converter.oval;
				aValue_out.keep = 15;
				aValue_out.strb = -1;
				aValue_out.user = 0;
				aValue_out.last = ((i==MAT_DIM+1)&&(j==MAT_DIM+1))? 1 : 0;
				aValue_out.id = 0;
				aValue_out.dest = 0;
				out_stream.write(aValue_out);
				sentPixels++;
				}
			}

			// Calculate row and col index
			if (idxCol < (MAT_DIM+2)-1)
			{
				idxCol++;
			}
			else
			{
				// New line
				idxCol = 0;
				idxRow++;
				pixConvolved = 0;
				pixConvolved_Power = 0;
			}
		} // end of for j
	} // end of for i
} // end of function

// Process the value inside window (Already multiplied by the kernel)
float func1Window(	hls::Window<KERNEL_DIM,KERNEL_DIM,float> *temp,
					hls::Window<KERNEL_DIM,KERNEL_DIM,float> *power)
{
	float result = 0;

	result = ((float)temp->getval(1,1)) +
		(Cap_1 * ( ((float)power->getval(1,1)) +
		(((float)temp->getval(2,1) + (float)temp->getval(0,1) - (2.0 * (float)temp->getval(1,1))) * Ry_1) +
		(((float)temp->getval(1,2) + (float)temp->getval(1,0) - (2.0 * (float)temp->getval(1,1))) * Rx_1) +
		((amb_temp_cpu - (float)temp->getval(1,1)) * Rz_1)));

	return result;
}

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
// main accelerator function, interfaces with AXI-S channels
void hls_hotspot (
	stream<AXI_VALUE> &in_stream_0,
	stream<AXI_VALUE> &in_stream_1,
	stream<AXI_VALUE> &out_stream)
{

	// Map HLS ports to AXI interfaces
#pragma HLS RESOURCE variable=in_stream_0 core=AXIS metadata="-bus_bundle INPUT_STREAM_0"
#pragma HLS RESOURCE variable=in_stream_1 core=AXIS metadata="-bus_bundle INPUT_STREAM_1"
#pragma HLS RESOURCE variable=out_stream core=AXIS metadata="-bus_bundle OUTPUT_STREAM"
//#pragma HLS RESOURCE variable=return core=AXI4LiteS metadata="-bus_bundle CONTROL_BUS"

	// Perform the accelerator
	func_hls(in_stream_0, in_stream_1, out_stream);

}

