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
// Entity: 			cpcie.h
// Version:			1.0
// Description: 	Header of CPCIe
//
// Additional Comments:
//
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#ifndef __CPCIE_H__
#define __CPCIE_H__

// Memory register in Xillybus
// There are 32 address of 32-bit registers
// 
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
#define ADDR29			ADDR_OFFSET+116
#define ADDR30			ADDR_OFFSET+120
#define ADDR31			ADDR_OFFSET+124

// XCR
#define ADDR_RD0		ADDR00			// File size of reading file
#define ADDR_XCR_STAT	ADDR12

// XCW
#define ADDR_WR0		ADDR00			// File size of writingfile #0
#define ADDR_WR1		ADDR01			// File size of writing file #1
#define ADDR_XCW_TREP	ADDR02
#define ADDR_XCW_STAT	ADDR12

// HLS
#define ADDR_HLS_STAT	ADDR13
#define ADDR_HLS_CMD	ADDR14
#define ADDR_HLS_RESETN	ADDR15

// PROCESSOR DUAL-PORT RAM
#define PROC_STATUS		ADDR03			// Status from processor
#define PROC_C_SIZE		ADDR04			// Compressed size

// Command definition
#define START			1
#define STOP			0
#define INIT			0
#define READY			1
#define DONE			0
#define BUSY			2

#endif // __CPCIE_H__ not defined
