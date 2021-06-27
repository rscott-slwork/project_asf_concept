#ifndef ASF_H
#define ASF_H

// From module: Common SAM compiler driver
#include <compiler.h>

// TODO
/** Board oscillator settings */
#define BOARD_FREQ_SLCK_XTAL        (32768U)
#define BOARD_FREQ_SLCK_BYPASS      (32768U)
#define BOARD_FREQ_MAINCK_XTAL      (12000000U)
#define BOARD_FREQ_MAINCK_BYPASS    (12000000U)

/** Master clock frequency */
#define BOARD_MCK                   CHIP_FREQ_CPU_MAX

/** board main clock xtal startup time */
#define BOARD_OSC_STARTUP_US        15625

//#include <adc.h>

// From module: Delay routines
//#include <delay.h>

// From module: FLASHCALW Controller Software Driver
//#include <flashcalw.h>

// From module: GPIO - General-Purpose Input/Output
//#include <gpio.h>

// From module: Generic board support
#include <board.h>

// From module: IOPORT - General purpose I/O service
//#include <ioport.h>

// From module: Interrupt management - SAM implementation
//#include <interrupt.h>

// From module: PDCA - Peripheral DMA Controller
//#include <pdca.h>

// From module: PEVC - Peripheral Event Controller Driver for SAM
//#include <events.h>

// From module: Part identification macros
//#include <parts.h>

// From module: Power Management
//#include <bpm.h>

// From module: Standard serial I/O (stdio) - SAM implementation
//#include <stdio_serial.h>

// From module: System Clock Control - SAM4L implementation
#include <sysclk.h>

// From module: USART - Serial interface- SAM implementation for devices with only USART
//#include <serial.h>

// From module: USART - Univ. Syn Async Rec/Trans
// #include <usart.h>

// From module: WDT - Watchdog Timer
//#include <wdt_sam4l.h>

// From module: PIO
#include <pio.h>
#include <sam3s4c.h>

#endif // ASF_H
