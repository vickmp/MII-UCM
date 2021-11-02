/*
 *
 * Xilinx, Inc.
 * XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" AS A 
 * COURTESY TO YOU.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION AS
 * ONE POSSIBLE   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR 
 * STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION 
 * IS FREE FROM ANY CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE 
 * FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION
 * XILINX EXPRESSLY DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO 
 * THE ADEQUACY OF THE IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO 
 * ANY WARRANTIES OR REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE 
 * FROM CLAIMS OF INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY 
 * AND FITNESS FOR A PARTICULAR PURPOSE.
 */

/*
 * 
 *
 * This file is a generated sample test application.
 *
 * This application is intended to test and/or illustrate some 
 * functionality of your system.  The contents of this file may
 * vary depending on the IP in your system and may use existing
 * IP driver functions.  These drivers will be generated in your
 * SDK application project when you run the "Generate Libraries" menu item.
 *
 */

#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xbasic_types.h"
#include "xgpio.h"
#include "leerDatos.h"

#define XPAR_RS232_UART_1_BASEADDR 0x84000000


int main()
{
	XGpio GpioOutput;

	int num1 = 0, num2 = 0, sum = 0;
	int end = 0;
	char key;

	// Loop program
	while(end == 0){

		xil_printf("Selecciona una opcion: \n\r");
		xil_printf("a.- Introducir primer numero. \n\r");
		xil_printf("b.- Introducir segundo numero. \n\r");
		xil_printf("c.-  Sumar y visualizar el resultado. \n\r");
		xil_printf("d.-  Leer switches. \n\r");
		xil_printf("s.-  Salir \n\r");

		// Read selected item
		key = getChar();
		print("\r\n");

		XGpio_Initialize(&GpioOutput, XPAR_XPS_GPIO_LEDS_DEVICE_ID);
		XGpio_SetDataDirection(&GpioOutput, 1, 0x0);

		// Number 1
		if (key == 'a') {
			// Read input
			xil_printf("Introduce un numero\n\r");
			num1 = getNumber();
			print("\r\n");

			XGpio_DiscreteWrite(&GpioOutput, 1, num1);
		// Number 2
		} else if (key == 'b') {
			xil_printf("Introduce un numero\n\r");
			num2 = getNumber();
			print("\r\n");

			XGpio_DiscreteWrite(&GpioOutput, 1, num2);
		// Sum
		} else if (key == 'c') {
			xil_printf("Resultado\n\r");
			sum = num1 + num2;
			xil_printf("El resultado es: %d\n\r", sum);

			XGpio_DiscreteWrite(&GpioOutput, 1, sum);
		// Read data from switches
		} else if (key == 'd'){
			XGpio Gpioinput;

			XGpio_Initialize(&Gpioinput, XPAR_XPS_GPIO_SWITCHES_DEVICE_ID);
			XGpio_SetDataDirection(&Gpioinput, 1, 0xFF);

			u32 sData = XGpio_DiscreteRead(&Gpioinput, 1);
			XGpio_DiscreteWrite(&GpioOutput, 1, sData);
			xil_printf("Valor en los switches: %d\n\r", sData);
			print("\r\n");
		// Exit program
		} else if (key == 's') {
			xil_printf("Saliendo del programa...\n\r");
			end = 1;
		} else {
		   xil_printf("Dato incorrecto, intentalo de nuevo. \n\r");
		}
	}
	print("-- Exiting main() --\r\n");
	return 0;
}





