#ifndef __MAIN_H__
#define __MAIN_H__

#include <cmath>
#include <ap_axi_sdata.h>
#include <hls_stream.h>
#include "hls_video.h"

using namespace std;

#define MAT_DIM 1024

typedef float mat_a_t;
typedef float mat_b_t;
typedef float result_t;

typedef ap_axiu<32,4,5,5> AXI_VALUE;

// Prototype of top level function for C-synthesis
void func_hls(
      mat_a_t a[MAT_DIM][MAT_DIM],
      mat_b_t b[MAT_DIM][MAT_DIM],
      result_t res[MAT_DIM][MAT_DIM]);

void hls_hotspot (
	hls::stream<AXI_VALUE> &in_stream_0,
	hls::stream<AXI_VALUE> &in_stream_1,
	hls::stream<AXI_VALUE> &out_stream);

#endif // __MAIN_H__ not defined
