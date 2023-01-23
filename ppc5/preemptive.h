#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4 
typedef char ThreadID;
typedef void (*FunctionPtr)(void);

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);

#define CNAME(s) _ ## s
#define L(x) LABEL(x)
#define LABEL(x) x ## $

// create a counting semaphore s that is initialized to n
#define SemaphoreCreate(s, n)  \
    s = n\

// do (busy-)wait() on semaphore s  //create獨特的x$ label
#define SemaphoreWait(s) \
    SemaphoreWaitBody(s, L(__COUNTER__)) \

//inc ++ dec-- JZ jmp if a= 0 //先檢查_s中是否為0,0跳,非0--
#define SemaphoreWaitBody(s, label) \ 
    { __asm \
        label: \
        MOV ACC, CNAME(s) \
        JZ label \
        dec  CNAME(s) \
      __endasm; }

// signal() semaphore s
#define SemaphoreSignal(s)  \
    __asm \
        INC CNAME(s) \
    __endasm;\
    

__data __at (0x30) char stackP[MAXTHREADS];
__data __at (0x34) char current_id;
__data __at (0x35) char bitmap;
__data __at (0x36) char final_id;
__data __at (0x37) char tmp_SP;

__data __at (0x38) char time_unit;
__data __at (0x39) char time;
__data __at (0x3A) char car_time[4];


#define delay(n)\
        car_time[current_id] = time + n;\
        while( car_time[current_id] != time ){;}\


unsigned char now(void);

#endif // __PREEMPTIVE_H__
