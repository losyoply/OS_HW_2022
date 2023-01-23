#include <8051.h>

#include "preemptive.h"


__data __at (0x30) char stackP[MAXTHREADS];
__data __at (0x34) char current_id;
__data __at (0x35) char bitmap;
__data __at (0x36) char final_id;
__data __at (0x37) char tmp_SP;



#define SAVESTATE \
         __asm \
            PUSH ACC\
            PUSH B\
            PUSH DPL\
            PUSH DPH\
            PUSH PSW\
         __endasm; \
        stackP[current_id] = SP;\


#define RESTORESTATE \
        SP = stackP[current_id];\
          __asm \
            POP PSW\
            POP DPH\
            POP DPL\
            POP B\
            POP ACC\
          __endasm; \
         




extern void main(void);


void Bootstrap(void) {


    TMOD = 0;  // timer 0 mode 0
    IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
                // EA  -  ET2  ES  ET1  EX1  ET0  EX0
    TR0 = 1; // set bit TR0 to start running timer 0

    bitmap = 0b0000;
    current_id = ThreadCreate(main);
    RESTORESTATE;

}


ThreadID ThreadCreate(FunctionPtr fp) __critical{
       
        tmp_SP = SP;

        switch(bitmap){
            case 0://0000
                final_id = 0;
                bitmap = 1;
                SP = 0x3F;
                break;
            case 1://0001
                final_id = 1;
                bitmap = 3;
                SP = 0x4F;
                break;
            case 3://0011
                final_id = 2;
                bitmap = 7;
                SP = 0x5F;
                break;
            case 7://0111
                final_id = 3;
                bitmap = 15;
                SP = 0x6F;
                break;
            case 15://1111
                return -1;
        }
        
       
        //PSW = 0;
        PSW = final_id << 3;// CY AC F0 RS1 RS0 OV UD P other are 0 except rs1 rs0

        __asm 
            PUSH DPL
            PUSH DPH
            ANL A,#0          
            PUSH ACC
            PUSH ACC
            PUSH ACC
            PUSH ACC
            PUSH PSW
        __endasm; 

        stackP[final_id] = SP;
        SP = tmp_SP;

        return final_id;
}




void ThreadYield(void) __critical{
       SAVESTATE;
        __asm
            MOV A, R0
            PUSH ACC
            MOV A, R1
            PUSH ACC
            MOV A, R2
            PUSH ACC
            MOV A, R3
            PUSH ACC
            MOV A, R4
            PUSH ACC
            MOV A, R5
            PUSH ACC
            MOV A, R6
            PUSH ACC
            MOV A, R7
            PUSH ACC
        __endasm;

       
                if(current_id==3) current_id=0;
                else current_id++; //下一id, 若有thread就yield 沒有就yield回第一個
                
        
                if (bitmap == 1)//0001 
                {
                    if (current_id > 0) //id是1,2,3
                        current_id = 0;
                }
                else if (bitmap == 3) //0011 //0,1 ok
                {
                    if (current_id > 1) //id是2,3
                        current_id = 0;
                }  
                else if (bitmap == 7) //0111 //0,1,2 ok
                {
                    if (current_id > 2) 
                        current_id = 0;
                }
                
           
            

        __asm
            POP ACC
            MOV R7, A
            POP ACC
            MOV R6, A
            POP ACC
            MOV R5, A
            POP ACC
            MOV R4, A
            POP ACC
            MOV R3, A
            POP ACC
            MOV R2, A
            POP ACC
            MOV R1, A
            POP ACC
            MOV R0, A
        __endasm;

        RESTORESTATE;
}



void myTimer0Handler(){
    EA = 0;
    SAVESTATE;
        __asm
            MOV A, R0
            PUSH ACC
            MOV A, R1
            PUSH ACC
            MOV A, R2
            PUSH ACC
            MOV A, R3
            PUSH ACC
            MOV A, R4
            PUSH ACC
            MOV A, R5
            PUSH ACC
            MOV A, R6
            PUSH ACC
            MOV A, R7
            PUSH ACC
        __endasm;

      
               
            if(current_id==3) current_id=0;
            else current_id++;
    
            if (bitmap == 1)
            {
                if (current_id > 0)
                    current_id = 0;
            }
            else if (bitmap == 3)
            {
                if (current_id > 1)
                    current_id = 0;
            }  
            else if (bitmap == 7)
            {
                if (current_id > 2)
                    current_id = 0;
            }
            
            
            

        __asm
            POP ACC
            MOV R7, A
            POP ACC
            MOV R6, A
            POP ACC
            MOV R5, A
            POP ACC
            MOV R4, A
            POP ACC
            MOV R3, A
            POP ACC
            MOV R2, A
            POP ACC
            MOV R1, A
            POP ACC
            MOV R0, A
        __endasm;

        RESTORESTATE;

        EA = 1;
        __asm
            RETI
        __endasm;
}



void ThreadExit(void) __critical{
       
        RESTORESTATE;
}
