
#include <8051.h>
#include "cooperative.h"



__data __at (0x20) char buffer;
__data __at (0x21) char full;
__data __at (0x22) char letter;


void Producer(void) {
       

        while (1) {
                

                while (full == 'Y')
                    ThreadYield();
                
                
                buffer = letter;
                full = 'Y';

                
                if (letter >= 'Z'){
                    letter = 'A';
                }
                else
                {
                        letter++;
                }
        }
}


void Consumer(void) {
 
        
        TMOD = 0x20;
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;

        while (1) {
                
                
                while (full == 'N') 
                    ThreadYield();
                
                SBUF = buffer;
                full = 'N';

                while(TI==0) //该位表示发送完成，并在从缓冲区发送字节后置位 while tx not ready yet, wait直到ready
                        ;   
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