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
// Entity: 			hc_dpram_SDK.c
// Version:			1.0
// Description: 	This file is used for hc dual-port RAM in Xilinx SDK
//
// Additional Comments:
//
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#include <stdio.h>
#include <xil_io.h>
#include "xparameters.h"

/**************************** Type Definitions ********************************/

/*
 * This type is a word address ptr.
 */
typedef volatile u32 *U32Ptr;

#define WR_WORD(ADDR, DATA)	(*(U32Ptr)(ADDR) = (DATA))
#define RD_WORD(ADDR, DATA)	((DATA) = *(U32Ptr)(ADDR))

#define ADDR_OFFSET		0

int main()
{
	u32 MyAdr;
	u32 StartAdr;
	u32 Range;
	u32 DataRead;
	u32 i;

	StartAdr = 0xC0000000;
	Range    = 32*4;

	for (MyAdr = StartAdr; MyAdr < StartAdr + Range; MyAdr += 4) {
		RD_WORD(MyAdr, DataRead);
		xil_printf("%08X: %08X\r\n", MyAdr, DataRead);
	}

	for (MyAdr = StartAdr, i=0; MyAdr < StartAdr + Range; MyAdr += 4, i++) {
		WR_WORD(MyAdr, 0xA0000000+i);
	}

	for (MyAdr = StartAdr; MyAdr < StartAdr + Range; MyAdr += 4) {
		RD_WORD(MyAdr, DataRead);
		xil_printf("%08X: %08X\r\n", MyAdr, DataRead);
	}

    return 0;
}
