/*************************************************************** FILE DETAILS **********************************************************/
/* NAME OF THE FILE			:	General.h									                                                           */
/* MODULE	NAME			:	General					                                                                       		   */
/* PURPOSE  				:	General Macros and Definitions for the whole Project                                                   */
/* COPYRIGHTS				:	PRICOL LTD		                                                                                       */
/* TEMPALTE VERSION			:	V1.2 - CREATED AND MAINTAINED BY ANANDKUMAR.P                                                          */
/********************************************************** MODIFICATION HISTORY *******************************************************/
/* INITIAL VERSION			:	V1.0, INITIAL VERSION (Phase 2)		                                                                   */
/* CODE 					:	DEC 2012, PRICOL, ANAND KUMAR.P                                                                        */
/* UPDATE					:						                                                                              	   */
/***************************************************************************************************************************************/

#ifndef _GENERAL_H      	/* pre processor to prevent multiple definitions */
#define _GENERAL_H

//#define EN_CAN_DRIVER 1
#include <QVariant>
//#pragma MESSAGE DISABLE C1106 /* WARNING C1106: Non-standard bitfield type */
/***************************************************************************************************************************************/
/*                                                         INCLUDE DERIVATIVES                                                         */
/***************************************************************************************************************************************/

/***************************************************************************************************************************************/
/*                                                           TYPE DEFINITION                                                           */
/***************************************************************************************************************************************/
typedef unsigned char		U1;
typedef unsigned short  	U2;
typedef unsigned long		U4;
typedef unsigned char		D1;		/* 2 nybble BCD */
typedef unsigned short  	D2; 	/* 4 nybble BCD */
typedef unsigned long		D4; 	/* 8 nybble BCD */
typedef unsigned long		BCD8;
typedef signed char         S1;
typedef signed short		S2;
typedef signed long         S4;

typedef union
{
    U1 ABC;						    	/* byte */
    struct
    {
        U1	flag00 :	1;					/* bit 0 */
        U1	flag01 :	1;					/* bit 1 */
        U1	flag02 :	1;					/* bit 2 */
        U1	flag03 :	1;					/* bit 3 */
        U1	flag04 :	1;					/* bit 4 */
        U1	flag05 :	1;					/* bit 5 */
        U1	flag06 :	1;					/* bit 6 */
        U1	flag07 :	1;					/* bit 7 */
    }bit;
}FLAG;


typedef union
{
    U4 Dword;						    	/* Dword */
    struct
    {
        U2  word1;
        U2  word0;
    }word;
    struct
    {
        U1	Byte03 : 8;					/* Byte 3 */
        U1	Byte02 : 8;					/* Byte 2 */
        U1	Byte01 : 8;					/* Byte 1 */
        U1	Byte00 : 8;					/* Byte 0 */
    }Byte;
    struct
    {
        U1	Nyb06 :	4;					/* Nyb 6 */
        U1	Nyb07 :	4;					/* Nyb 7 */
        U1	Nyb04 :	4;					/* Nyb 4 */
        U1	Nyb05 :	4;					/* Nyb 5 */
        U1	Nyb02 :	4;					/* Nyb 2 */
        U1	Nyb03 :	4;					/* Nyb 3 */
        U1	Nyb00 :	4;					/* Nyb 0 */
        U1	Nyb01 :	4;					/* Nyb 1 */
    }Nibble;

}BCD32;

/***************************************************************************************************************************************/
/*                                                           MACRO DEFINITION                                                          */
/***************************************************************************************************************************************/
/* System states */
#define		U1_SYS_BATON			(U1)1					/* Battery On state				*/
#define		U1_SYS_WKUP				(U1)2					/* Wake Up state				*/
#define		U1_SYS_IGON				(U1)3					/* Ig On state					*/
#define		U1_SYS_SLFCHK			(U1)4					/* Self check state				*/
#define		U1_SYS_NORMAL			(U1)5					/* Normal state					*/
#define		U1_SYS_IGOFF			(U1)6					/* Ig Off state					*/
#define		U1_SYS_SLPWAIT			(U1)7					/* Sleep Wait state				*/
#define		U1_SYS_LVMODE			(U1)8					/* Low voltage state			*/
#define		U1_SYS_LPMODE			(U1)9					/* Low power state				*/
#define		U1_SYS_CONFIG			(U1)10					/* Configuration state			*/
#define		U1_SYS_CALIB			(U1)11					/* Calibration state			*/
#define		U1_SYS_DIAG				(U1)12					/* Diagnostics state			*/
#define		U1_SYS_UNDEF			(U1)0					/* Undefined state				*/
#define		U1_SYS_DEFAULT			(U1)13					/* Default state				*/

/* Multiplying Constant */
#define		U1_MUL_LSFT_2		(U1)1					/* multiply by 2 				*/
#define		U1_MUL_LSFT_4		(U1)2					/* multiply by 4 				*/
#define		U1_MUL_LSFT_8		(U1)3					/* multiply by 8 				*/
#define		U1_MUL_LSFT_16		(U1)4					/* multiply by 16 				*/
#define		U1_MUL_LSFT_32		(U1)5					/* multiply by 32 				*/
#define		U1_MUL_LSFT_64		(U1)6					/* multiply by 64 				*/
#define		U1_MUL_LSFT_128		(U1)7					/* multiply by 128 				*/
#define		U1_MUL_LSFT_256		(U1)8					/* multiply by 256 				*/

/* Dividing Constant */
#define		U1_DIV_RSFT_2		(U1)1					/* divide by 2 					*/
#define		U1_DIV_RSFT_4		(U1)2					/* divide by 4 					*/
#define		U1_DIV_RSFT_8		(U1)3					/* divide by 8 					*/
#define		U1_DIV_RSFT_16		(U1)4					/* divide by 16					*/
#define		U1_DIV_RSFT_32		(U1)5					/* divide by 32					*/
#define		U1_DIV_RSFT_64		(U1)6					/* divide by 64					*/
#define		U1_DIV_RSFT_128		(U1)7					/* divide by 128				*/
#define		U1_DIV_RSFT_256		(U1)8					/* divide by 256				*/

/* Averaging Constant */
#define		U1_AVG_RSFT_2		(U1)1					/* average by 2					*/
#define		U1_AVG_RSFT_4		(U1)2					/* average by 4					*/
#define		U1_AVG_RSFT_8		(U1)3					/* average by 8					*/
#define		U1_AVG_RSFT_16		(U1)4					/* average by 16				*/
#define		U1_AVG_RSFT_32		(U1)5					/* average by 32				*/
#define		U1_AVG_RSFT_64		(U1)6					/* average by 64				*/
#define		U1_AVG_RSFT_128		(U1)7					/* average by 128				*/
#define		U1_AVG_RSFT_256		(U1)8					/* average by 256				*/

/* General Alias */
//#define 	NULL				0

#define 	FAILURE				(U1)0					/* failure 						*/
#define 	SUCCESS				(U1)1					/* success 						*/

#define 	EQUAL				(U1)0					/* equal  						*/
#define 	NOTEQ				(U1)1					/* not equal 					*/
#define 	LARGE				(U1)2					/* large  						*/
#define 	SMALL				(U1)3					/* small  						*/

#define 	ON					(U1)1					/* ON 	 						*/
#define 	OFF					(U1)0					/* OFF	 						*/

#define 	OK					(U1)1					/* OK	 						*/
#define 	NG					(U1)0					/* NG	 						*/

#define 	HI					(U1)1					/* HI	 						*/
#define 	LO					(U1)0					/* LO	 						*/

#define 	TRUE				(U1)1					/* true							*/
#define 	FALSE				(U1)0					/* false						*/

#define 	OVER				(U1)1					/* over							*/
#define 	NOTOVER				(U1)0					/* not over			 			*/

#define 	UP					(U1)1					/* up	 						*/
#define 	DOWN				(U1)0					/* down	 						*/

#define 	PLUS				(U1)0					/* plus							*/
#define 	MINUS				(U1)1					/* minus						*/

/* Minimum and maximum */
#define 	U1_MIN				(U1)0x00				/* Min unsigned char			*/
#define 	U1_MAX				(U1)0xFF				/* Max unsigned char			*/
#define 	U2_MIN				(U2)0x0000				/* Min unsigned int 			*/
#define 	U2_MAX				(U2)0xFFFF				/* Max unsigned int 			*/
#define 	U4_MIN				(U4)0x00000000			/* Min unsigned long			*/
#define 	U4_MAX				(U4)0xFFFFFFFF			/* Max unsigned long			*/

/* Bit Mask Positions */
#define U1MASK0			(U1)0x01
#define U1MASK1			(U1)0x02
#define U1MASK2			(U1)0x04
#define U1MASK3			(U1)0x08
#define U1MASK4			(U1)0x10
#define U1MASK5			(U1)0x20
#define U1MASK6			(U1)0x40
#define U1MASK7			(U1)0x80
#define U1MASK			(U1)0xFF

#define U2MASK0			(U2)0x0001
#define U2MASK1			(U2)0x0002
#define U2MASK2			(U2)0x0004
#define U2MASK3			(U2)0x0008
#define U2MASK4			(U2)0x0010
#define U2MASK5			(U2)0x0020
#define U2MASK6			(U2)0x0040
#define U2MASK7			(U2)0x0080
#define U2MASK8			(U2)0x0100
#define U2MASK9			(U2)0x0200
#define U2MASK10		(U2)0x0400
#define U2MASK11		(U2)0x0800
#define U2MASK12		(U2)0x1000
#define U2MASK13		(U2)0x2000
#define U2MASK14		(U2)0x4000
#define U2MASK15		(U2)0x8000
#define U2MASK			(U2)0xFFFF

#define U4MASK0			(U4)0x00000001
#define U4MASK1			(U4)0x00000002
#define U4MASK2			(U4)0x00000004
#define U4MASK3			(U4)0x00000008
#define U4MASK4			(U4)0x00000010
#define U4MASK5			(U4)0x00000020
#define U4MASK6			(U4)0x00000040
#define U4MASK7			(U4)0x00000080
#define U4MASK8			(U4)0x00000100
#define U4MASK9			(U4)0x00000200
#define U4MASK10		(U4)0x00000400
#define U4MASK11		(U4)0x00000800
#define U4MASK12		(U4)0x00001000
#define U4MASK13		(U4)0x00002000
#define U4MASK14		(U4)0x00004000
#define U4MASK15		(U4)0x00008000
#define U4MASK16		(U4)0x00010000
#define U4MASK17		(U4)0x00020000
#define U4MASK18		(U4)0x00040000
#define U4MASK19		(U4)0x00080000
#define U4MASK20		(U4)0x00100000
#define U4MASK21		(U4)0x00200000
#define U4MASK22		(U4)0x00400000
#define U4MASK23		(U4)0x00800000
#define U4MASK24		(U4)0x01000000
#define U4MASK25		(U4)0x02000000
#define U4MASK26		(U4)0x04000000
#define U4MASK27		(U4)0x08000000
#define U4MASK28		(U4)0x10000000
#define U4MASK29		(U4)0x20000000
#define U4MASK30		(U4)0x40000000
#define U4MASK31		(U4)0x80000000
#define U4MASK			(U4)0xFFFFFFFF

/* Shift Average Divisor */
#define SFT_AVG_DIV(X)          \
(                               \
    (X) == (1)      ? (0)   :   \
    (X) == (2)      ? (1)   :   \
    (X) == (4)      ? (2)   :   \
    (X) == (8)      ? (3)   :   \
    (X) == (16)     ? (4)   :   \
    (X) == (32)     ? (5)   :   \
    (X) == (64)     ? (6)   :   \
    (X) == (128)    ? (7)   :   \
    (X) == (256)    ? (8)   :   \
    (X) == (512)    ? (9)   :   ( -1 ) )

/* general */
#define U2_SECS_PER_HR       	( U2 )3600                       /* number of seconds in an hour */
/* general */
#define U1_SEC_PER_MIN          ( U1 )60            /* Seconds per minute */

/***************************************************************************************************************************************/
/*                                                          FUNCTION PROTOTYPE                                                         */
/***************************************************************************************************************************************/

#endif // GENERAL_H

