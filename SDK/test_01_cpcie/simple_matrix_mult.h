//*************************************************
// Simple Matrix Mult header file
//
//*************************************************
#ifndef SIMPLE_MM_H
#define SIMPLE_MM_H

#include "xmatrixmul_accel_core.h"

#define DIM    32
#define SIZE  ((DIM)*(DIM))

void matrix_multiply_SW(float a[DIM][DIM], float b[DIM][DIM], float res[DIM][DIM]);
void print_accel_status(void);

#endif
