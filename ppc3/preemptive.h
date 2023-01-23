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

// do (busy-)wait() on semaphore s
#define SemaphoreWait(s) \
    SemaphoreWaitBody(s, L(__COUNTER__)) \

//inc ++ dec-- JZ jmp if a= 0
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

#endif // __PREEMPTIVE_H__
