#include <stdio.h>
#include <xstatus.h>
#include "leerDatos.h"
#include "xparameters.h"
#include "xil_cache.h"
#include "xbasic_types.h"
#include "xgpio.h"

#define XPAR_RS232_UART_1_BASEADDR 0x84000000

int getNumber ()
{

	Xuint8 byte;
	Xuint8 uartBuffer[16];
	Xboolean validNumber;
	int digitIndex;
	int digit, number, sign;
	int c;	
	
	while(1){
		byte = 0x00;
		digit = 0;
		digitIndex = 0;
		number = 0;
		validNumber = XTRUE;

		//get bytes from uart until RETURN is entered
		while(byte != 0x0d && byte != 0x0A){
			byte = XUartLite_RecvByte(XPAR_RS232_UART_1_BASEADDR);
			uartBuffer[digitIndex] = byte; 
			XUartLite_SendByte(XPAR_RS232_UART_1_BASEADDR,byte);
			digitIndex++;
		}

		//calculate number from string of digits
		for(c = 0; c < (digitIndex - 1); c++){
			if(c == 0){
				//check if first byte is a "-"
				if(uartBuffer[c] == 0x2D){
					sign = -1;
					digit = 0;
				}
				//check if first byte is a digit
				else if((uartBuffer[c] >> 4) == 0x03){
					sign = 1;
					digit = (uartBuffer[c] & 0x0F);
				}
				else	
					validNumber = XFALSE;	
			}
			else{
				//check byte is a digit
				if((uartBuffer[c] >> 4) == 0x03){  
					digit = (uartBuffer[c] & 0x0F);
				}
				else	
					validNumber = XFALSE;				
			}
			number = (number * 10) + digit;	
		}
		number *= sign;
		if(validNumber == XTRUE){
			return number;
		}
		print("This is not a valid number.\n\r");
		return 0;
	}
}

char getChar() {

	Xuint8 byte = 0x00;
	char key;

	// Read first char
	key = XUartLite_RecvByte(XPAR_RS232_UART_1_BASEADDR);
	XUartLite_SendByte(XPAR_RS232_UART_1_BASEADDR, key);

	//get bytes from uart until RETURN is entered
	while(byte != 0x0d && byte != 0x0A){
		byte = XUartLite_RecvByte(XPAR_RS232_UART_1_BASEADDR);
		XUartLite_SendByte(XPAR_RS232_UART_1_BASEADDR,byte);
	}
	return key;
}
