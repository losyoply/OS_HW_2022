                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _mutex
                                    117 	.globl _empty
                                    118 	.globl _letter
                                    119 	.globl _full
                                    120 	.globl _buffer
                                    121 ;--------------------------------------------------------
                                    122 ; special function registers
                                    123 ;--------------------------------------------------------
                                    124 	.area RSEG    (ABS,DATA)
      000000                        125 	.org 0x0000
                           000080   126 _P0	=	0x0080
                           000081   127 _SP	=	0x0081
                           000082   128 _DPL	=	0x0082
                           000083   129 _DPH	=	0x0083
                           000087   130 _PCON	=	0x0087
                           000088   131 _TCON	=	0x0088
                           000089   132 _TMOD	=	0x0089
                           00008A   133 _TL0	=	0x008a
                           00008B   134 _TL1	=	0x008b
                           00008C   135 _TH0	=	0x008c
                           00008D   136 _TH1	=	0x008d
                           000090   137 _P1	=	0x0090
                           000098   138 _SCON	=	0x0098
                           000099   139 _SBUF	=	0x0099
                           0000A0   140 _P2	=	0x00a0
                           0000A8   141 _IE	=	0x00a8
                           0000B0   142 _P3	=	0x00b0
                           0000B8   143 _IP	=	0x00b8
                           0000D0   144 _PSW	=	0x00d0
                           0000E0   145 _ACC	=	0x00e0
                           0000F0   146 _B	=	0x00f0
                                    147 ;--------------------------------------------------------
                                    148 ; special function bits
                                    149 ;--------------------------------------------------------
                                    150 	.area RSEG    (ABS,DATA)
      000000                        151 	.org 0x0000
                           000080   152 _P0_0	=	0x0080
                           000081   153 _P0_1	=	0x0081
                           000082   154 _P0_2	=	0x0082
                           000083   155 _P0_3	=	0x0083
                           000084   156 _P0_4	=	0x0084
                           000085   157 _P0_5	=	0x0085
                           000086   158 _P0_6	=	0x0086
                           000087   159 _P0_7	=	0x0087
                           000088   160 _IT0	=	0x0088
                           000089   161 _IE0	=	0x0089
                           00008A   162 _IT1	=	0x008a
                           00008B   163 _IE1	=	0x008b
                           00008C   164 _TR0	=	0x008c
                           00008D   165 _TF0	=	0x008d
                           00008E   166 _TR1	=	0x008e
                           00008F   167 _TF1	=	0x008f
                           000090   168 _P1_0	=	0x0090
                           000091   169 _P1_1	=	0x0091
                           000092   170 _P1_2	=	0x0092
                           000093   171 _P1_3	=	0x0093
                           000094   172 _P1_4	=	0x0094
                           000095   173 _P1_5	=	0x0095
                           000096   174 _P1_6	=	0x0096
                           000097   175 _P1_7	=	0x0097
                           000098   176 _RI	=	0x0098
                           000099   177 _TI	=	0x0099
                           00009A   178 _RB8	=	0x009a
                           00009B   179 _TB8	=	0x009b
                           00009C   180 _REN	=	0x009c
                           00009D   181 _SM2	=	0x009d
                           00009E   182 _SM1	=	0x009e
                           00009F   183 _SM0	=	0x009f
                           0000A0   184 _P2_0	=	0x00a0
                           0000A1   185 _P2_1	=	0x00a1
                           0000A2   186 _P2_2	=	0x00a2
                           0000A3   187 _P2_3	=	0x00a3
                           0000A4   188 _P2_4	=	0x00a4
                           0000A5   189 _P2_5	=	0x00a5
                           0000A6   190 _P2_6	=	0x00a6
                           0000A7   191 _P2_7	=	0x00a7
                           0000A8   192 _EX0	=	0x00a8
                           0000A9   193 _ET0	=	0x00a9
                           0000AA   194 _EX1	=	0x00aa
                           0000AB   195 _ET1	=	0x00ab
                           0000AC   196 _ES	=	0x00ac
                           0000AF   197 _EA	=	0x00af
                           0000B0   198 _P3_0	=	0x00b0
                           0000B1   199 _P3_1	=	0x00b1
                           0000B2   200 _P3_2	=	0x00b2
                           0000B3   201 _P3_3	=	0x00b3
                           0000B4   202 _P3_4	=	0x00b4
                           0000B5   203 _P3_5	=	0x00b5
                           0000B6   204 _P3_6	=	0x00b6
                           0000B7   205 _P3_7	=	0x00b7
                           0000B0   206 _RXD	=	0x00b0
                           0000B1   207 _TXD	=	0x00b1
                           0000B2   208 _INT0	=	0x00b2
                           0000B3   209 _INT1	=	0x00b3
                           0000B4   210 _T0	=	0x00b4
                           0000B5   211 _T1	=	0x00b5
                           0000B6   212 _WR	=	0x00b6
                           0000B7   213 _RD	=	0x00b7
                           0000B8   214 _PX0	=	0x00b8
                           0000B9   215 _PT0	=	0x00b9
                           0000BA   216 _PX1	=	0x00ba
                           0000BB   217 _PT1	=	0x00bb
                           0000BC   218 _PS	=	0x00bc
                           0000D0   219 _P	=	0x00d0
                           0000D1   220 _F1	=	0x00d1
                           0000D2   221 _OV	=	0x00d2
                           0000D3   222 _RS0	=	0x00d3
                           0000D4   223 _RS1	=	0x00d4
                           0000D5   224 _F0	=	0x00d5
                           0000D6   225 _AC	=	0x00d6
                           0000D7   226 _CY	=	0x00d7
                                    227 ;--------------------------------------------------------
                                    228 ; overlayable register banks
                                    229 ;--------------------------------------------------------
                                    230 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        231 	.ds 8
                                    232 ;--------------------------------------------------------
                                    233 ; internal ram data
                                    234 ;--------------------------------------------------------
                                    235 	.area DSEG    (DATA)
                           000020   236 _buffer	=	0x0020
                           000021   237 _full	=	0x0021
                           000022   238 _letter	=	0x0022
                           000023   239 _empty	=	0x0023
                           000024   240 _mutex	=	0x0024
                                    241 ;--------------------------------------------------------
                                    242 ; overlayable items in internal ram 
                                    243 ;--------------------------------------------------------
                                    244 ;--------------------------------------------------------
                                    245 ; Stack segment in internal ram 
                                    246 ;--------------------------------------------------------
                                    247 	.area	SSEG
      000008                        248 __start__stack:
      000008                        249 	.ds	1
                                    250 
                                    251 ;--------------------------------------------------------
                                    252 ; indirectly addressable internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area ISEG    (DATA)
                                    255 ;--------------------------------------------------------
                                    256 ; absolute internal ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area IABS    (ABS,DATA)
                                    259 	.area IABS    (ABS,DATA)
                                    260 ;--------------------------------------------------------
                                    261 ; bit data
                                    262 ;--------------------------------------------------------
                                    263 	.area BSEG    (BIT)
                                    264 ;--------------------------------------------------------
                                    265 ; paged external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area PSEG    (PAG,XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XSEG    (XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; absolute external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XABS    (ABS,XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; external initialized ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XISEG   (XDATA)
                                    280 	.area HOME    (CODE)
                                    281 	.area GSINIT0 (CODE)
                                    282 	.area GSINIT1 (CODE)
                                    283 	.area GSINIT2 (CODE)
                                    284 	.area GSINIT3 (CODE)
                                    285 	.area GSINIT4 (CODE)
                                    286 	.area GSINIT5 (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 	.area GSFINAL (CODE)
                                    289 	.area CSEG    (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; interrupt vector 
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
      000000                        294 __interrupt_vect:
      000000 02 00 8E         [24]  295 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  296 	reti
      000004                        297 	.ds	7
      00000B 02 00 95         [24]  298 	ljmp	_timer0_ISR
                                    299 ;--------------------------------------------------------
                                    300 ; global & static initialisations
                                    301 ;--------------------------------------------------------
                                    302 	.area HOME    (CODE)
                                    303 	.area GSINIT  (CODE)
                                    304 	.area GSFINAL (CODE)
                                    305 	.area GSINIT  (CODE)
                                    306 	.globl __sdcc_gsinit_startup
                                    307 	.globl __sdcc_program_startup
                                    308 	.globl __start__stack
                                    309 	.globl __mcs51_genXINIT
                                    310 	.globl __mcs51_genXRAMCLEAR
                                    311 	.globl __mcs51_genRAMCLEAR
                                    312 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  313 	ljmp	__sdcc_program_startup
                                    314 ;--------------------------------------------------------
                                    315 ; Home
                                    316 ;--------------------------------------------------------
                                    317 	.area HOME    (CODE)
                                    318 	.area HOME    (CODE)
      00000E                        319 __sdcc_program_startup:
      00000E 02 00 76         [24]  320 	ljmp	_main
                                    321 ;	return from main will return to caller
                                    322 ;--------------------------------------------------------
                                    323 ; code
                                    324 ;--------------------------------------------------------
                                    325 	.area CSEG    (CODE)
                                    326 ;------------------------------------------------------------
                                    327 ;Allocation info for local variables in function 'Producer'
                                    328 ;------------------------------------------------------------
                                    329 ;	testpreempt.c:14: void Producer(void) {
                                    330 ;	-----------------------------------------
                                    331 ;	 function Producer
                                    332 ;	-----------------------------------------
      000014                        333 _Producer:
                           000007   334 	ar7 = 0x07
                           000006   335 	ar6 = 0x06
                           000005   336 	ar5 = 0x05
                           000004   337 	ar4 = 0x04
                           000003   338 	ar3 = 0x03
                           000002   339 	ar2 = 0x02
                           000001   340 	ar1 = 0x01
                           000000   341 	ar0 = 0x00
                                    342 ;	testpreempt.c:16: while (1) {
      000014                        343 00105$:
                                    344 ;	testpreempt.c:18: SemaphoreWait(empty); //等到empty=1
      000014                        345 		0$:
      000014 85 23 E0         [24]  346 	MOV ACC, _empty 
      000017 60 FB            [24]  347 	JZ 0$ 
      000019 15 23            [12]  348 	dec _empty 
                                    349 ;	testpreempt.c:19: SemaphoreWait(mutex); 
      00001B                        350 		1$:
      00001B 85 24 E0         [24]  351 	MOV ACC, _mutex 
      00001E 60 FB            [24]  352 	JZ 1$ 
      000020 15 24            [12]  353 	dec _mutex 
                                    354 ;	testpreempt.c:23: }
      000022 7F 01            [12]  355 	mov	r7,#0x01
      000024 10 AF 02         [24]  356 	jbc	ea,00117$
      000027 7F 00            [12]  357 	mov	r7,#0x00
      000029                        358 00117$:
                                    359 ;	testpreempt.c:22: buffer = letter;
      000029 85 22 20         [24]  360 	mov	_buffer,_letter
      00002C EF               [12]  361 	mov	a,r7
      00002D 13               [12]  362 	rrc	a
      00002E 92 AF            [24]  363 	mov	ea,c
                                    364 ;	testpreempt.c:25: if (letter >= 'Z')
      000030 74 A6            [12]  365 	mov	a,#0x100 - 0x5a
      000032 25 22            [12]  366 	add	a,_letter
      000034 50 05            [24]  367 	jnc	00102$
                                    368 ;	testpreempt.c:27: letter = 'A';
      000036 75 22 41         [24]  369 	mov	_letter,#0x41
      000039 80 05            [24]  370 	sjmp	00103$
      00003B                        371 00102$:
                                    372 ;	testpreempt.c:31: letter++;
      00003B E5 22            [12]  373 	mov	a,_letter
      00003D 04               [12]  374 	inc	a
      00003E F5 22            [12]  375 	mov	_letter,a
      000040                        376 00103$:
                                    377 ;	testpreempt.c:34: SemaphoreSignal(mutex);
      000040 05 24            [12]  378 	INC _mutex 
                                    379 ;	testpreempt.c:35: SemaphoreSignal(full);
      000042 05 21            [12]  380 	INC _full 
                                    381 ;	testpreempt.c:37: }
      000044 80 CE            [24]  382 	sjmp	00105$
                                    383 ;------------------------------------------------------------
                                    384 ;Allocation info for local variables in function 'Consumer'
                                    385 ;------------------------------------------------------------
                                    386 ;	testpreempt.c:40: void Consumer(void) {
                                    387 ;	-----------------------------------------
                                    388 ;	 function Consumer
                                    389 ;	-----------------------------------------
      000046                        390 _Consumer:
                                    391 ;	testpreempt.c:42: TMOD |= 0x20;
      000046 43 89 20         [24]  392 	orl	_TMOD,#0x20
                                    393 ;	testpreempt.c:43: TH1 = -6;
      000049 75 8D FA         [24]  394 	mov	_TH1,#0xfa
                                    395 ;	testpreempt.c:44: SCON = 0x50;
      00004C 75 98 50         [24]  396 	mov	_SCON,#0x50
                                    397 ;	testpreempt.c:45: TR1 = 1;
                                    398 ;	assignBit
      00004F D2 8E            [12]  399 	setb	_TR1
                                    400 ;	testpreempt.c:47: while (1) {
      000051                        401 00105$:
                                    402 ;	testpreempt.c:49: SemaphoreWait(full);
      000051                        403 		2$:
      000051 85 21 E0         [24]  404 	MOV ACC, _full 
      000054 60 FB            [24]  405 	JZ 2$ 
      000056 15 21            [12]  406 	dec _full 
                                    407 ;	testpreempt.c:50: SemaphoreWait(mutex);
      000058                        408 		3$:
      000058 85 24 E0         [24]  409 	MOV ACC, _mutex 
      00005B 60 FB            [24]  410 	JZ 3$ 
      00005D 15 24            [12]  411 	dec _mutex 
                                    412 ;	testpreempt.c:54: }
      00005F 7F 01            [12]  413 	mov	r7,#0x01
      000061 10 AF 02         [24]  414 	jbc	ea,00121$
      000064 7F 00            [12]  415 	mov	r7,#0x00
      000066                        416 00121$:
                                    417 ;	testpreempt.c:53: SBUF = buffer;
      000066 85 20 99         [24]  418 	mov	_SBUF,_buffer
      000069 EF               [12]  419 	mov	a,r7
      00006A 13               [12]  420 	rrc	a
      00006B 92 AF            [24]  421 	mov	ea,c
                                    422 ;	testpreempt.c:56: SemaphoreSignal(mutex); //mutex=1
      00006D 05 24            [12]  423 	INC _mutex 
                                    424 ;	testpreempt.c:57: SemaphoreSignal(empty); //empty=1
      00006F 05 23            [12]  425 	INC _empty 
                                    426 ;	testpreempt.c:59: while(TI==0){;}
      000071                        427 00101$:
                                    428 ;	testpreempt.c:60: TI = 0;
                                    429 ;	assignBit
      000071 10 99 DD         [24]  430 	jbc	_TI,00105$
                                    431 ;	testpreempt.c:63: }
      000074 80 FB            [24]  432 	sjmp	00101$
                                    433 ;------------------------------------------------------------
                                    434 ;Allocation info for local variables in function 'main'
                                    435 ;------------------------------------------------------------
                                    436 ;	testpreempt.c:66: void main(void) {
                                    437 ;	-----------------------------------------
                                    438 ;	 function main
                                    439 ;	-----------------------------------------
      000076                        440 _main:
                                    441 ;	testpreempt.c:69: buffer = 'A'; //buffer=' '
      000076 75 20 41         [24]  442 	mov	_buffer,#0x41
                                    443 ;	testpreempt.c:70: letter = 'A';
      000079 75 22 41         [24]  444 	mov	_letter,#0x41
                                    445 ;	testpreempt.c:72: SemaphoreCreate(full, 0);
      00007C 75 21 00         [24]  446 	mov	_full,#0x00
                                    447 ;	testpreempt.c:73: SemaphoreCreate(empty, 1);
      00007F 75 23 01         [24]  448 	mov	_empty,#0x01
                                    449 ;	testpreempt.c:74: SemaphoreCreate(mutex, 1);
      000082 75 24 01         [24]  450 	mov	_mutex,#0x01
                                    451 ;	testpreempt.c:76: ThreadCreate(Producer);
      000085 90 00 14         [24]  452 	mov	dptr,#_Producer
      000088 12 00 BF         [24]  453 	lcall	_ThreadCreate
                                    454 ;	testpreempt.c:77: Consumer();
                                    455 ;	testpreempt.c:81: }
      00008B 02 00 46         [24]  456 	ljmp	_Consumer
                                    457 ;------------------------------------------------------------
                                    458 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    459 ;------------------------------------------------------------
                                    460 ;	testpreempt.c:83: void _sdcc_gsinit_startup(void) {
                                    461 ;	-----------------------------------------
                                    462 ;	 function _sdcc_gsinit_startup
                                    463 ;	-----------------------------------------
      00008E                        464 __sdcc_gsinit_startup:
                                    465 ;	testpreempt.c:86: __endasm;
      00008E 02 00 99         [24]  466 	ljmp	_Bootstrap
                                    467 ;	testpreempt.c:87: }
      000091 22               [24]  468 	ret
                                    469 ;------------------------------------------------------------
                                    470 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    471 ;------------------------------------------------------------
                                    472 ;	testpreempt.c:89: void _mcs51_genRAMCLEAR(void) {}
                                    473 ;	-----------------------------------------
                                    474 ;	 function _mcs51_genRAMCLEAR
                                    475 ;	-----------------------------------------
      000092                        476 __mcs51_genRAMCLEAR:
      000092 22               [24]  477 	ret
                                    478 ;------------------------------------------------------------
                                    479 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    480 ;------------------------------------------------------------
                                    481 ;	testpreempt.c:90: void _mcs51_genXINIT(void) {}
                                    482 ;	-----------------------------------------
                                    483 ;	 function _mcs51_genXINIT
                                    484 ;	-----------------------------------------
      000093                        485 __mcs51_genXINIT:
      000093 22               [24]  486 	ret
                                    487 ;------------------------------------------------------------
                                    488 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    489 ;------------------------------------------------------------
                                    490 ;	testpreempt.c:91: void _mcs51_genXRAMCLEAR(void) {}
                                    491 ;	-----------------------------------------
                                    492 ;	 function _mcs51_genXRAMCLEAR
                                    493 ;	-----------------------------------------
      000094                        494 __mcs51_genXRAMCLEAR:
      000094 22               [24]  495 	ret
                                    496 ;------------------------------------------------------------
                                    497 ;Allocation info for local variables in function 'timer0_ISR'
                                    498 ;------------------------------------------------------------
                                    499 ;	testpreempt.c:93: void timer0_ISR(void) __interrupt(1) {
                                    500 ;	-----------------------------------------
                                    501 ;	 function timer0_ISR
                                    502 ;	-----------------------------------------
      000095                        503 _timer0_ISR:
                                    504 ;	testpreempt.c:96: __endasm;
      000095 02 01 D9         [24]  505 	ljmp	_myTimer0Handler
                                    506 ;	testpreempt.c:97: }
      000098 32               [24]  507 	reti
                                    508 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    509 ;	eliminated unneeded push/pop psw
                                    510 ;	eliminated unneeded push/pop dpl
                                    511 ;	eliminated unneeded push/pop dph
                                    512 ;	eliminated unneeded push/pop b
                                    513 ;	eliminated unneeded push/pop acc
                                    514 	.area CSEG    (CODE)
                                    515 	.area CONST   (CODE)
                                    516 	.area XINIT   (CODE)
                                    517 	.area CABS    (ABS,CODE)
