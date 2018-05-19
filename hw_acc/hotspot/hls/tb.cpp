#include <iostream>
#include "main.h"

void check_result( result_t hw_res[MAT_DIM][MAT_DIM], result_t sw_res[MAT_DIM][MAT_DIM], int &err_cnt);

using namespace std;

//----------------------------------------------------
// Test the streaming interface.
int test_core()
{
   mat_a_t in_mat_a[MAT_DIM][MAT_DIM];
   mat_b_t in_mat_b[MAT_DIM][MAT_DIM];
   result_t hw_result[MAT_DIM][MAT_DIM], sw_result[MAT_DIM][MAT_DIM];
   int i, j, err_cnt = 0;
   hls::stream<AXI_VALUE> in_stream_0;
   hls::stream<AXI_VALUE> in_stream_1;
   hls::stream<AXI_VALUE> out_stream;
   AXI_VALUE aValue, bValue, cValue;

   float tmp;
   FILE *fpIn0, *fpIn1, *fpOut;

	// Load input data from files
   fpIn0=fopen("temp_32.txt","r");
	for (i=0; i<(MAT_DIM*MAT_DIM); i++){
		fscanf(fpIn0, "%6f", &tmp);
		union {	unsigned int oval; mat_a_t ival; } converterA;
		converterA.ival = tmp;
		aValue.data = converterA.oval;
		in_stream_0.write(aValue);
	}
	fclose(fpIn0);

	// Load input data from files
   fpIn1=fopen("power_32.txt","r");
	for (i=0; i<(MAT_DIM*MAT_DIM); i++){
		fscanf(fpIn1, "%6f", &tmp);
		union {	unsigned int oval; mat_a_t ival; } converterB;
		converterB.ival = tmp;
		bValue.data = converterB.oval;
		in_stream_1.write(bValue);
	}
	fclose(fpIn1);

   // Run the Vivado-HLS
	hls_hotspot(in_stream_0, in_stream_1, out_stream);

	// Save the results to a file
	fpOut=fopen("result.txt","w");
	for(i = 0; i < MAT_DIM; i++) {
		for(j = 0; j < MAT_DIM; j++) {
			out_stream.read(cValue); //convert  output stream in matrix
			union {	unsigned int ival; result_t oval; } converter;
			converter.ival = cValue.data;
			hw_result[i][j] = converter.oval;
			if (hw_result[i][j] > 999.99) {
				fprintf(fpOut, "%.3f\n", hw_result[i][j]);
			}
			else if (hw_result[i][j] > 99.99) {
				fprintf(fpOut, "%.4f\n", hw_result[i][j]);
			}
			else {
				fprintf(fpOut, "%.5f\n", hw_result[i][j]);
			}
		}
	}
	fclose(fpOut);

	// These functions work well, just turned off because not use it
   //cout << "Result by HW" << endl;
   //check_result(hw_result, sw_result, err_cnt);

   // assume no error
   return 0;
}

//----------------------------------------------------
void check_result(
    result_t hw_res[MAT_DIM][MAT_DIM],
    result_t sw_res[MAT_DIM][MAT_DIM],
    int &err_cnt)
{
// Print result matrix
cout << "{" << endl;
for (int i = 0; i < MAT_DIM; i++) {
   cout << "{";
   for (int j = 0; j < MAT_DIM; j++) {
      cout << hw_res[i][j];
      if (j == MAT_DIM - 1)
         cout << "}" << endl;
      else
         cout << ",";
   }
}
cout << "}" << endl;
}

//----------------------------------------------------
int main(int argc, char **argv)
{
	int err_cnt;

    err_cnt = test_core();

	return err_cnt;
}
