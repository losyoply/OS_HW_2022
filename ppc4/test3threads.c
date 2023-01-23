
#include <8051.h>
#include "preemptive.h"



__data __at (0x20) char buffer[3];
__data __at (0x23) char full;
__data __at (0x24) char letter;
__data __at (0x25) char empty;
__data __at (0x26) char mutex;

__data __at (0x27) char num;
__data __at (0x28) char p1;
__data __at (0x29) char p2;



void Producer1(void) {


        while (1) {
       
                SemaphoreWait(p2);
                SemaphoreWait(empty);
                SemaphoreWait(mutex);
                
                __critical{
                        buffer[full] = letter;
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
                SemaphoreSignal(p1);
        }
}

void Producer2(void) {


        while (1) {

                SemaphoreWait(p1);
                SemaphoreWait(empty);
                SemaphoreWait(mutex);
                
                
                __critical{
                        buffer[full] = num;
                }

                if (num >= '9')
                {
                        num = '0';
                }
                else
                {
                        num++;
                }

                SemaphoreSignal(mutex);
                SemaphoreSignal(full);
                SemaphoreSignal(p2);
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
                        SBUF = buffer[0];
                        buffer[0] = buffer[1];
                        buffer[1] = buffer[2];
                }

                SemaphoreSignal(mutex);
                SemaphoreSignal(empty);

                while(TI==0){;}
                TI = 0;
                 
        }
}


void main(void) {

        //buffer = 'A'; //buffer=' '
        letter = 'A';
        num = '0';

        SemaphoreCreate(full, 0);
        SemaphoreCreate(empty, 3);
        SemaphoreCreate(mutex, 1);
        SemaphoreCreate(p1, 0); //伊人依次p1先 不然p1會先灌爆buffer，輪到p2時就近不去了
        SemaphoreCreate(p2, 1);

        ThreadCreate(Producer1);
        ThreadCreate(Producer2);
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
