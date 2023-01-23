#include <8051.h>

#include "cooperative.h"



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
     

      bitmap = 0b0000;
      current_id = ThreadCreate(main);
      RESTORESTATE;

}


ThreadID ThreadCreate(FunctionPtr fp) {
        

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



void ThreadYield(void) {
       SAVESTATE;
       
                
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
                
           
            
        RESTORESTATE;
}

void ThreadExit(void) {
        
        RESTORESTATE;
}
