;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW32)
;--------------------------------------------------------
	.module testparking
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _log_PARM_3
	.globl _log_PARM_2
	.globl _timer0_ISR
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genXINIT
	.globl __mcs51_genRAMCLEAR
	.globl __sdcc_gsinit_startup
	.globl _main
	.globl _Producer
	.globl _log
	.globl _ThreadExit
	.globl _ThreadCreate
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _car_name
	.globl _i
	.globl _car_thread
	.globl _car
	.globl _space2
	.globl _space1
	.globl _empty_thread
	.globl _mutex
	.globl _empty
	.globl _first
	.globl _car_time
	.globl _time
	.globl _time_unit
	.globl _tmp_SP
	.globl _final_id
	.globl _bitmap
	.globl _current_id
	.globl _stackP
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_stackP	=	0x0030
_current_id	=	0x0034
_bitmap	=	0x0035
_final_id	=	0x0036
_tmp_SP	=	0x0037
_time_unit	=	0x0038
_time	=	0x0039
_car_time	=	0x003a
_first	=	0x0020
_empty	=	0x0021
_mutex	=	0x0022
_empty_thread	=	0x0023
_space1	=	0x0024
_space2	=	0x0025
_car	=	0x0026
_car_thread	=	0x0027
_i	=	0x0028
_car_name	=	0x002a
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
_log_PARM_2:
	.ds 1
_log_PARM_3:
	.ds 1
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
	reti
	.ds	7
	ljmp	_timer0_ISR
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'log'
;------------------------------------------------------------
;b                         Allocated with name '_log_PARM_2'
;c                         Allocated with name '_log_PARM_3'
;a                         Allocated to registers r7 
;------------------------------------------------------------
;	testparking.c:31: void log(char a, char b, char c){ //a=car b==in or out c==第幾個space
;	-----------------------------------------
;	 function log
;	-----------------------------------------
_log:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
	mov	r7,dpl
;	testparking.c:32: TMOD |= 0x20;
	orl	_TMOD,#0x20
;	testparking.c:33: TH1 = -6;
	mov	_TH1,#0xfa
;	testparking.c:34: SCON = 0x50;
	mov	_SCON,#0x50
;	testparking.c:35: TR1 = 1;
;	assignBit
	setb	_TR1
;	testparking.c:37: for(i = 0; i < 5 ; i++)
	mov	_i,#0x00
00120$:
	mov	a,#0x100 - 0x05
	add	a,_i
	jc	00122$
;	testparking.c:39: if( i==0 ) 
	mov	a,_i
	jnz	00113$
;	testparking.c:40: SBUF = (time&7) + '0';
	mov	r6,_time
	mov	a,#0x07
	anl	a,r6
	add	a,#0x30
	mov	_SBUF,a
	sjmp	00115$
00113$:
;	testparking.c:41: else if( i == 1 ) 
	mov	a,#0x01
	cjne	a,_i,00110$
;	testparking.c:42: SBUF = a;
	mov	_SBUF,r7
	sjmp	00115$
00110$:
;	testparking.c:43: else if( i == 2 ) 
	mov	a,#0x02
	cjne	a,_i,00107$
;	testparking.c:44: SBUF = b;
	mov	_SBUF,_log_PARM_2
	sjmp	00115$
00107$:
;	testparking.c:45: else if( i == 3 ) 
	mov	a,#0x03
	cjne	a,_i,00104$
;	testparking.c:46: SBUF = c;
	mov	_SBUF,_log_PARM_3
	sjmp	00115$
00104$:
;	testparking.c:47: else if( i == 4 ) 
	mov	a,#0x04
	cjne	a,_i,00115$
;	testparking.c:48: SBUF = '\n';
	mov	_SBUF,#0x0a
;	testparking.c:50: while( !TI ){;} //TI==0
00115$:
;	testparking.c:51: TI = 0;
;	assignBit
	jbc	_TI,00170$
	sjmp	00115$
00170$:
;	testparking.c:37: for(i = 0; i < 5 ; i++)
	mov	a,_i
	inc	a
	mov	_i,a
	sjmp	00120$
00122$:
;	testparking.c:54: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'Producer'
;------------------------------------------------------------
;	testparking.c:62: void Producer(void) {
;	-----------------------------------------
;	 function Producer
;	-----------------------------------------
_Producer:
;	testparking.c:63: SemaphoreWait(empty); //確認empty>0, --
		0$:
	MOV ACC, _empty 
	JZ 0$ 
	dec _empty 
;	testparking.c:64: SemaphoreWait(mutex); //no many car
		1$:
	MOV ACC, _mutex 
	JZ 1$ 
	dec _mutex 
;	testparking.c:66: EA = 0;
;	assignBit
	clr	_EA
;	testparking.c:67: if (space1 == '0'){
	mov	a,#0x30
	cjne	a,_space1,00104$
;	testparking.c:69: space1 = car_name[current_id]; //哪台車停
	mov	a,_current_id
	add	a,#_car_name
	mov	r1,a
	mov	_space1,@r1
;	testparking.c:70: log(car_name[current_id], 'i', '1');
	mov	a,_current_id
	add	a,#_car_name
	mov	r1,a
	mov	dpl,@r1
	mov	_log_PARM_2,#0x69
	mov	_log_PARM_3,#0x31
	lcall	_log
	sjmp	00105$
00104$:
;	testparking.c:73: else if (space2 == '0'){
	mov	a,#0x30
	cjne	a,_space2,00105$
;	testparking.c:75: space2 = car_name[current_id];
	mov	a,_current_id
	add	a,#_car_name
	mov	r1,a
	mov	_space2,@r1
;	testparking.c:76: log(car_name[current_id], 'i', '2');
	mov	a,_current_id
	add	a,#_car_name
	mov	r1,a
	mov	dpl,@r1
	mov	_log_PARM_2,#0x69
	mov	_log_PARM_3,#0x32
	lcall	_log
00105$:
;	testparking.c:78: EA = 1;
;	assignBit
	setb	_EA
;	testparking.c:80: SemaphoreSignal(mutex);
	INC _mutex 
;	testparking.c:82: delay(1);
	mov	a,_current_id
	add	a,#_car_time
	mov	r1,a
	mov	a,_time
	mov	r7,a
	inc	a
	mov	@r1,a
00106$:
	mov	a,_current_id
	add	a,#_car_time
	mov	r1,a
	mov	a,@r1
	cjne	a,_time,00106$
;	testparking.c:84: EA = 0;
;	assignBit
	clr	_EA
;	testparking.c:85: if (space1 == car_name[current_id]){
	mov	a,_current_id
	add	a,#_car_name
	mov	r1,a
	mov	a,@r1
	cjne	a,_space1,00112$
;	testparking.c:86: space1 = '0';
	mov	_space1,#0x30
;	testparking.c:87: log(car_name[current_id], 'o', '1');
	mov	a,_current_id
	add	a,#_car_name
	mov	r1,a
	mov	dpl,@r1
	mov	_log_PARM_2,#0x6f
	mov	_log_PARM_3,#0x31
	lcall	_log
	sjmp	00113$
00112$:
;	testparking.c:89: else if (space2 == car_name[current_id]){
	mov	a,_current_id
	add	a,#_car_name
	mov	r1,a
	mov	a,@r1
	mov	r7,a
	cjne	a,_space2,00113$
;	testparking.c:90: space2 = '0';
	mov	_space2,#0x30
;	testparking.c:91: log(car_name[current_id], 'o', '2');
	mov	a,_current_id
	add	a,#_car_name
	mov	r1,a
	mov	dpl,@r1
	mov	_log_PARM_2,#0x6f
	mov	_log_PARM_3,#0x32
	lcall	_log
00113$:
;	testparking.c:94: EA = 1;
;	assignBit
	setb	_EA
;	testparking.c:95: SemaphoreSignal(empty);
	INC _empty 
;	testparking.c:96: SemaphoreSignal(empty_thread);
	INC _empty_thread 
;	testparking.c:97: ThreadExit();
;	testparking.c:99: }
	ljmp	_ThreadExit
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;	testparking.c:102: void main(void) {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	testparking.c:104: SemaphoreCreate(mutex, 1);
	mov	_mutex,#0x01
;	testparking.c:105: SemaphoreCreate(empty, 2); 
	mov	_empty,#0x02
;	testparking.c:106: SemaphoreCreate(empty_thread, 3);//one thread for main
	mov	_empty_thread,#0x03
;	testparking.c:108: EA = 1;
;	assignBit
	setb	_EA
;	testparking.c:110: car = '1';
	mov	_car,#0x31
;	testparking.c:111: space1 = '0';
	mov	_space1,#0x30
;	testparking.c:112: space2 = '0';
	mov	_space2,#0x30
;	testparking.c:113: time='0';
	mov	_time,#0x30
;	testparking.c:114: while(1){
00105$:
;	testparking.c:116: SemaphoreWait(empty_thread);
		2$:
	MOV ACC, _empty_thread 
	JZ 2$ 
	dec _empty_thread 
;	testparking.c:117: car_thread = ThreadCreate(Producer);
	mov	dptr,#_Producer
	lcall	_ThreadCreate
	mov	_car_thread,dpl
;	testparking.c:118: car_name[car_thread] = car; //第x thread是哪個car
	mov	a,_car_thread
	add	a,#_car_name
	mov	r0,a
	mov	@r0,_car
;	testparking.c:120: if(car=='5')
	mov	a,#0x35
	cjne	a,_car,00102$
;	testparking.c:122: car='1';
	mov	_car,#0x31
	sjmp	00105$
00102$:
;	testparking.c:126: car++;
	mov	a,_car
	inc	a
	mov	_car,a
;	testparking.c:131: ThreadExit();
;	testparking.c:133: }
	sjmp	00105$
;------------------------------------------------------------
;Allocation info for local variables in function '_sdcc_gsinit_startup'
;------------------------------------------------------------
;	testparking.c:135: void _sdcc_gsinit_startup(void) {
;	-----------------------------------------
;	 function _sdcc_gsinit_startup
;	-----------------------------------------
__sdcc_gsinit_startup:
;	testparking.c:138: __endasm;
	ljmp	_Bootstrap
;	testparking.c:139: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:141: void _mcs51_genRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genRAMCLEAR
;	-----------------------------------------
__mcs51_genRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXINIT'
;------------------------------------------------------------
;	testparking.c:142: void _mcs51_genXINIT(void) {}
;	-----------------------------------------
;	 function _mcs51_genXINIT
;	-----------------------------------------
__mcs51_genXINIT:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
;------------------------------------------------------------
;	testparking.c:143: void _mcs51_genXRAMCLEAR(void) {}
;	-----------------------------------------
;	 function _mcs51_genXRAMCLEAR
;	-----------------------------------------
__mcs51_genXRAMCLEAR:
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'timer0_ISR'
;------------------------------------------------------------
;	testparking.c:145: void timer0_ISR(void) __interrupt(1) {
;	-----------------------------------------
;	 function timer0_ISR
;	-----------------------------------------
_timer0_ISR:
;	testparking.c:148: __endasm;
	ljmp	_myTimer0Handler
;	testparking.c:149: }
	reti
;	eliminated unneeded mov psw,# (no regs used in bank)
;	eliminated unneeded push/pop psw
;	eliminated unneeded push/pop dpl
;	eliminated unneeded push/pop dph
;	eliminated unneeded push/pop b
;	eliminated unneeded push/pop acc
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
