;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.9.0 #11195 (MINGW32)
;--------------------------------------------------------
	.module preemptive
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _myTimer0Handler
	.globl _Bootstrap
	.globl _main
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
	.globl _tmp_SP
	.globl _final_id
	.globl _bitmap
	.globl _current_id
	.globl _stackP
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
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
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:42: void Bootstrap(void) {
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:45: TMOD = 0;  // timer 0 mode 0
	mov	_TMOD,#0x00
;	preemptive.c:46: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
	mov	_IE,#0x82
;	preemptive.c:48: TR0 = 1; // set bit TR0 to start running timer 0
;	assignBit
	setb	_TR0
;	preemptive.c:50: bitmap = 0b0000;
	mov	_bitmap,#0x00
;	preemptive.c:51: current_id = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_current_id,dpl
;	preemptive.c:52: RESTORESTATE;
	mov	a,_current_id
	add	a,#_stackP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:54: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp                        Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:57: ThreadID ThreadCreate(FunctionPtr fp) __critical{
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
	setb	c
	jbc	ea,00129$
	clr	c
00129$:
	push	psw
;	preemptive.c:59: tmp_SP = SP;
	mov	_tmp_SP,_SP
;	preemptive.c:62: switch(bitmap){
	mov	r7,_bitmap
	cjne	r7,#0x00,00130$
	sjmp	00101$
00130$:
	cjne	r7,#0x01,00131$
	sjmp	00102$
00131$:
	cjne	r7,#0x03,00132$
	sjmp	00103$
00132$:
	cjne	r7,#0x07,00133$
	sjmp	00104$
00133$:
;	preemptive.c:63: case 0://0000
	cjne	r7,#0x0f,00106$
	sjmp	00105$
00101$:
;	preemptive.c:64: final_id = 0;
	mov	_final_id,#0x00
;	preemptive.c:65: bitmap = 1;
	mov	_bitmap,#0x01
;	preemptive.c:66: SP = 0x3F;
	mov	_SP,#0x3f
;	preemptive.c:67: break;
;	preemptive.c:68: case 1://0001
	sjmp	00106$
00102$:
;	preemptive.c:69: final_id = 1;
	mov	_final_id,#0x01
;	preemptive.c:70: bitmap = 3;
	mov	_bitmap,#0x03
;	preemptive.c:71: SP = 0x4F;
	mov	_SP,#0x4f
;	preemptive.c:72: break;
;	preemptive.c:73: case 3://0011
	sjmp	00106$
00103$:
;	preemptive.c:74: final_id = 2;
	mov	_final_id,#0x02
;	preemptive.c:75: bitmap = 7;
	mov	_bitmap,#0x07
;	preemptive.c:76: SP = 0x5F;
	mov	_SP,#0x5f
;	preemptive.c:77: break;
;	preemptive.c:78: case 7://0111
	sjmp	00106$
00104$:
;	preemptive.c:79: final_id = 3;
	mov	_final_id,#0x03
;	preemptive.c:80: bitmap = 15;
	mov	_bitmap,#0x0f
;	preemptive.c:81: SP = 0x6F;
	mov	_SP,#0x6f
;	preemptive.c:82: break;
;	preemptive.c:83: case 15://1111
	sjmp	00106$
00105$:
;	preemptive.c:84: return -1;
	mov	dpl,#0xff
;	preemptive.c:85: }
	sjmp	00107$
00106$:
;	preemptive.c:89: PSW = final_id << 3;// CY AC F0 RS1 RS0 OV UD P other are 0 except rs1 rs0
	mov	a,_final_id
	mov	r7,a
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_PSW,a
;	preemptive.c:100: __endasm; 
	PUSH	DPL
	PUSH	DPH
	ANL	A,#0
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	ACC
	PUSH	PSW
;	preemptive.c:102: stackP[final_id] = SP;
	mov	a,_final_id
	add	a,#_stackP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:103: SP = tmp_SP;
	mov	_SP,_tmp_SP
;	preemptive.c:105: return final_id;
	mov	dpl,_final_id
00107$:
;	preemptive.c:106: }
	pop	psw
	mov	ea,c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:111: void ThreadYield(void) __critical{
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
	setb	c
	jbc	ea,00148$
	clr	c
00148$:
	push	psw
;	preemptive.c:112: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_current_id
	add	a,#_stackP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:130: __endasm;
	MOV	A, R0
	PUSH	ACC
	MOV	A, R1
	PUSH	ACC
	MOV	A, R2
	PUSH	ACC
	MOV	A, R3
	PUSH	ACC
	MOV	A, R4
	PUSH	ACC
	MOV	A, R5
	PUSH	ACC
	MOV	A, R6
	PUSH	ACC
	MOV	A, R7
	PUSH	ACC
;	preemptive.c:134: if(current_id==3) current_id=0;
	mov	a,#0x03
	cjne	a,_current_id,00102$
	mov	_current_id,#0x00
	sjmp	00103$
00102$:
;	preemptive.c:135: else current_id++;
	mov	a,_current_id
	inc	a
	mov	_current_id,a
00103$:
;	preemptive.c:137: if (bitmap == 1)
	mov	a,#0x01
	cjne	a,_bitmap,00116$
;	preemptive.c:139: if (current_id > 0)
	mov	a,_current_id
	jz	00117$
;	preemptive.c:140: current_id = 0;
	mov	_current_id,#0x00
	sjmp	00117$
00116$:
;	preemptive.c:142: else if (bitmap == 3)
	mov	a,#0x03
	cjne	a,_bitmap,00113$
;	preemptive.c:144: if (current_id > 1)
	mov	a,_current_id
	add	a,#0xff - 0x01
	jnc	00117$
;	preemptive.c:145: current_id = 0;
	mov	_current_id,#0x00
	sjmp	00117$
00113$:
;	preemptive.c:147: else if (bitmap == 7)
	mov	a,#0x07
	cjne	a,_bitmap,00117$
;	preemptive.c:149: if (current_id > 2)
	mov	a,_current_id
	add	a,#0xff - 0x02
	jnc	00117$
;	preemptive.c:150: current_id = 0;
	mov	_current_id,#0x00
00117$:
;	preemptive.c:174: __endasm;
	POP	ACC
	MOV	R7, A
	POP	ACC
	MOV	R6, A
	POP	ACC
	MOV	R5, A
	POP	ACC
	MOV	R4, A
	POP	ACC
	MOV	R3, A
	POP	ACC
	MOV	R2, A
	POP	ACC
	MOV	R1, A
	POP	ACC
	MOV	R0, A
;	preemptive.c:176: RESTORESTATE;
	mov	a,_current_id
	add	a,#_stackP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:177: }
	pop	psw
	mov	ea,c
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:181: void myTimer0Handler(){
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	preemptive.c:182: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:183: SAVESTATE;
	PUSH ACC 
	PUSH B 
	PUSH DPL 
	PUSH DPH 
	PUSH PSW 
	mov	a,_current_id
	add	a,#_stackP
	mov	r0,a
	mov	@r0,_SP
;	preemptive.c:201: __endasm;
	MOV	A, R0
	PUSH	ACC
	MOV	A, R1
	PUSH	ACC
	MOV	A, R2
	PUSH	ACC
	MOV	A, R3
	PUSH	ACC
	MOV	A, R4
	PUSH	ACC
	MOV	A, R5
	PUSH	ACC
	MOV	A, R6
	PUSH	ACC
	MOV	A, R7
	PUSH	ACC
;	preemptive.c:206: if(current_id==3) current_id=0;
	mov	a,#0x03
	cjne	a,_current_id,00102$
	mov	_current_id,#0x00
	sjmp	00103$
00102$:
;	preemptive.c:207: else current_id++;
	mov	a,_current_id
	inc	a
	mov	_current_id,a
00103$:
;	preemptive.c:209: if (bitmap == 1)
	mov	a,#0x01
	cjne	a,_bitmap,00116$
;	preemptive.c:211: if (current_id > 0)
	mov	a,_current_id
	jz	00117$
;	preemptive.c:212: current_id = 0;
	mov	_current_id,#0x00
	sjmp	00117$
00116$:
;	preemptive.c:214: else if (bitmap == 3)
	mov	a,#0x03
	cjne	a,_bitmap,00113$
;	preemptive.c:216: if (current_id > 1)
	mov	a,_current_id
	add	a,#0xff - 0x01
	jnc	00117$
;	preemptive.c:217: current_id = 0;
	mov	_current_id,#0x00
	sjmp	00117$
00113$:
;	preemptive.c:219: else if (bitmap == 7)
	mov	a,#0x07
	cjne	a,_bitmap,00117$
;	preemptive.c:221: if (current_id > 2)
	mov	a,_current_id
	add	a,#0xff - 0x02
	jnc	00117$
;	preemptive.c:222: current_id = 0;
	mov	_current_id,#0x00
00117$:
;	preemptive.c:247: __endasm;
	POP	ACC
	MOV	R7, A
	POP	ACC
	MOV	R6, A
	POP	ACC
	MOV	R5, A
	POP	ACC
	MOV	R4, A
	POP	ACC
	MOV	R3, A
	POP	ACC
	MOV	R2, A
	POP	ACC
	MOV	R1, A
	POP	ACC
	MOV	R0, A
;	preemptive.c:249: RESTORESTATE;
	mov	a,_current_id
	add	a,#_stackP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:251: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:254: __endasm;
	RETI
;	preemptive.c:255: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:259: void ThreadExit(void) __critical{
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
	setb	c
	jbc	ea,00103$
	clr	c
00103$:
	push	psw
;	preemptive.c:261: RESTORESTATE;
	mov	a,_current_id
	add	a,#_stackP
	mov	r1,a
	mov	_SP,@r1
	POP PSW 
	POP DPH 
	POP DPL 
	POP B 
	POP ACC 
;	preemptive.c:262: }
	pop	psw
	mov	ea,c
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
