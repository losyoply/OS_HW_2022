
#include <8051.h>
#include "preemptive.h"



__data __at (0x20) char buffer;
__data __at (0x21) char full;
__data __at (0x22) char letter;
__data __at (0x23) char empty;
__data __at (0x24) char mutex;


void Producer(void) {

        while (1) {
        
                SemaphoreWait(empty); //等到empty=1
                SemaphoreWait(mutex); 
                
                __critical{
                        buffer = letter;
                }

                if (letter >= 'Z')
                {
                        letter = 'A';
                }
                else
                {
                        letter++;
                }

                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
        }
}


void Consumer(void) {
        /* @@@ [2 pt] initialize Tx for polling */
        TMOD |= 0x20;
        TH1 = -6;
        SCON = 0x50;
        TR1 = 1;
        
        while (1) {
   
                SemaphoreWait(full);
                SemaphoreWait(mutex);
                
                __critical{
                        SBUF = buffer;
                }

                SemaphoreSignal(mutex); //mutex=1
                SemaphoreSignal(empty); //empty=1

                while(TI==0){;}
                TI = 0;
                 
        }
}


void main(void) {
         

        buffer = 'A'; //buffer=' '
        letter = 'A';

        SemaphoreCreate(full, 0);
        SemaphoreCreate(empty, 1);
        SemaphoreCreate(mutex, 1);

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
