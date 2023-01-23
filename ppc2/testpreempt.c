
#include <8051.h>
#include "preemptive.h"


__data __at (0x20) char buffer;
__data __at (0x21) char full;
__data __at (0x22) char letter;


void Producer(void) {
       
        while (1) {
                

                while (full == 'Y'){;}
                
                __critical{
                        buffer = letter;
                        full = 'Y';

                        
                        if (letter >= 'Z')
                        {
                                letter = 'A';
                        }
                        else
                        {
                                letter++;
                        }
        
                }
                
        }
}


void Consumer(void) {
        /* @@@ [2 pt] initialize Tx for polling */
        
        //TMOD = 0x20;
        TMOD |= 0x20;
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;

        while (1) {
                
                
                while (full == 'N'){;}
                
                __critical{
                        SBUF = buffer;
                        full = 'N';
                }
                
                while(TI==0){;}
                TI = 0;
                

        }
}


void main(void) {
          

        buffer = ' '; 
        full = 'N';
        letter = 'A';

        ThreadCreate(Producer);
        Consumer();

}

void _sdcc_gsinit_startup(void) {
        __asm
                ljmp  _Bootstrap
        __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

void timer0_ISR(void) __interrupt(1) {
        __asm
                ljmp _myTimer0Handler
        __endasm;
}
