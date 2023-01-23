                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module test3threads
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
                                     18 	.globl _Producer2
                                     19 	.globl _Producer1
                                     20 	.globl _ThreadCreate
                                     21 	.globl _CY
                                     22 	.globl _AC
                                     23 	.globl _F0
                                     24 	.globl _RS1
                                     25 	.globl _RS0
                                     26 	.globl _OV
                                     27 	.globl _F1
                                     28 	.globl _P
                                     29 	.globl _PS
                                     30 	.globl _PT1
                                     31 	.globl _PX1
                                     32 	.globl _PT0
                                     33 	.globl _PX0
                                     34 	.globl _RD
                                     35 	.globl _WR
                                     36 	.globl _T1
                                     37 	.globl _T0
                                     38 	.globl _INT1
                                     39 	.globl _INT0
                                     40 	.globl _TXD
                                     41 	.globl _RXD
                                     42 	.globl _P3_7
                                     43 	.globl _P3_6
                                     44 	.globl _P3_5
                                     45 	.globl _P3_4
                                     46 	.globl _P3_3
                                     47 	.globl _P3_2
                                     48 	.globl _P3_1
                                     49 	.globl _P3_0
                                     50 	.globl _EA
                                     51 	.globl _ES
                                     52 	.globl _ET1
                                     53 	.globl _EX1
                                     54 	.globl _ET0
                                     55 	.globl _EX0
                                     56 	.globl _P2_7
                                     57 	.globl _P2_6
                                     58 	.globl _P2_5
                                     59 	.globl _P2_4
                                     60 	.globl _P2_3
                                     61 	.globl _P2_2
                                     62 	.globl _P2_1
                                     63 	.globl _P2_0
                                     64 	.globl _SM0
                                     65 	.globl _SM1
                                     66 	.globl _SM2
                                     67 	.globl _REN
                                     68 	.globl _TB8
                                     69 	.globl _RB8
                                     70 	.globl _TI
                                     71 	.globl _RI
                                     72 	.globl _P1_7
                                     73 	.globl _P1_6
                                     74 	.globl _P1_5
                                     75 	.globl _P1_4
                                     76 	.globl _P1_3
                                     77 	.globl _P1_2
                                     78 	.globl _P1_1
                                     79 	.globl _P1_0
                                     80 	.globl _TF1
                                     81 	.globl _TR1
                                     82 	.globl _TF0
                                     83 	.globl _TR0
                                     84 	.globl _IE1
                                     85 	.globl _IT1
                                     86 	.globl _IE0
                                     87 	.globl _IT0
                                     88 	.globl _P0_7
                                     89 	.globl _P0_6
                                     90 	.globl _P0_5
                                     91 	.globl _P0_4
                                     92 	.globl _P0_3
                                     93 	.globl _P0_2
                                     94 	.globl _P0_1
                                     95 	.globl _P0_0
                                     96 	.globl _B
                                     97 	.globl _ACC
                                     98 	.globl _PSW
                                     99 	.globl _IP
                                    100 	.globl _P3
                                    101 	.globl _IE
                                    102 	.globl _P2
                                    103 	.globl _SBUF
                                    104 	.globl _SCON
                                    105 	.globl _P1
                                    106 	.globl _TH1
                                    107 	.globl _TH0
                                    108 	.globl _TL1
                                    109 	.globl _TL0
                                    110 	.globl _TMOD
                                    111 	.globl _TCON
                                    112 	.globl _PCON
                                    113 	.globl _DPH
                                    114 	.globl _DPL
                                    115 	.globl _SP
                                    116 	.globl _P0
                                    117 	.globl _p2
                                    118 	.globl _p1
                                    119 	.globl _num
                                    120 	.globl _mutex
                                    121 	.globl _empty
                                    122 	.globl _letter
                                    123 	.globl _full
                                    124 	.globl _buffer
                                    125 ;--------------------------------------------------------
                                    126 ; special function registers
                                    127 ;--------------------------------------------------------
                                    128 	.area RSEG    (ABS,DATA)
      000000                        129 	.org 0x0000
                           000080   130 _P0	=	0x0080
                           000081   131 _SP	=	0x0081
                           000082   132 _DPL	=	0x0082
                           000083   133 _DPH	=	0x0083
                           000087   134 _PCON	=	0x0087
                           000088   135 _TCON	=	0x0088
                           000089   136 _TMOD	=	0x0089
                           00008A   137 _TL0	=	0x008a
                           00008B   138 _TL1	=	0x008b
                           00008C   139 _TH0	=	0x008c
                           00008D   140 _TH1	=	0x008d
                           000090   141 _P1	=	0x0090
                           000098   142 _SCON	=	0x0098
                           000099   143 _SBUF	=	0x0099
                           0000A0   144 _P2	=	0x00a0
                           0000A8   145 _IE	=	0x00a8
                           0000B0   146 _P3	=	0x00b0
                           0000B8   147 _IP	=	0x00b8
                           0000D0   148 _PSW	=	0x00d0
                           0000E0   149 _ACC	=	0x00e0
                           0000F0   150 _B	=	0x00f0
                                    151 ;--------------------------------------------------------
                                    152 ; special function bits
                                    153 ;--------------------------------------------------------
                                    154 	.area RSEG    (ABS,DATA)
      000000                        155 	.org 0x0000
                           000080   156 _P0_0	=	0x0080
                           000081   157 _P0_1	=	0x0081
                           000082   158 _P0_2	=	0x0082
                           000083   159 _P0_3	=	0x0083
                           000084   160 _P0_4	=	0x0084
                           000085   161 _P0_5	=	0x0085
                           000086   162 _P0_6	=	0x0086
                           000087   163 _P0_7	=	0x0087
                           000088   164 _IT0	=	0x0088
                           000089   165 _IE0	=	0x0089
                           00008A   166 _IT1	=	0x008a
                           00008B   167 _IE1	=	0x008b
                           00008C   168 _TR0	=	0x008c
                           00008D   169 _TF0	=	0x008d
                           00008E   170 _TR1	=	0x008e
                           00008F   171 _TF1	=	0x008f
                           000090   172 _P1_0	=	0x0090
                           000091   173 _P1_1	=	0x0091
                           000092   174 _P1_2	=	0x0092
                           000093   175 _P1_3	=	0x0093
                           000094   176 _P1_4	=	0x0094
                           000095   177 _P1_5	=	0x0095
                           000096   178 _P1_6	=	0x0096
                           000097   179 _P1_7	=	0x0097
                           000098   180 _RI	=	0x0098
                           000099   181 _TI	=	0x0099
                           00009A   182 _RB8	=	0x009a
                           00009B   183 _TB8	=	0x009b
                           00009C   184 _REN	=	0x009c
                           00009D   185 _SM2	=	0x009d
                           00009E   186 _SM1	=	0x009e
                           00009F   187 _SM0	=	0x009f
                           0000A0   188 _P2_0	=	0x00a0
                           0000A1   189 _P2_1	=	0x00a1
                           0000A2   190 _P2_2	=	0x00a2
                           0000A3   191 _P2_3	=	0x00a3
                           0000A4   192 _P2_4	=	0x00a4
                           0000A5   193 _P2_5	=	0x00a5
                           0000A6   194 _P2_6	=	0x00a6
                           0000A7   195 _P2_7	=	0x00a7
                           0000A8   196 _EX0	=	0x00a8
                           0000A9   197 _ET0	=	0x00a9
                           0000AA   198 _EX1	=	0x00aa
                           0000AB   199 _ET1	=	0x00ab
                           0000AC   200 _ES	=	0x00ac
                           0000AF   201 _EA	=	0x00af
                           0000B0   202 _P3_0	=	0x00b0
                           0000B1   203 _P3_1	=	0x00b1
                           0000B2   204 _P3_2	=	0x00b2
                           0000B3   205 _P3_3	=	0x00b3
                           0000B4   206 _P3_4	=	0x00b4
                           0000B5   207 _P3_5	=	0x00b5
                           0000B6   208 _P3_6	=	0x00b6
                           0000B7   209 _P3_7	=	0x00b7
                           0000B0   210 _RXD	=	0x00b0
                           0000B1   211 _TXD	=	0x00b1
                           0000B2   212 _INT0	=	0x00b2
                           0000B3   213 _INT1	=	0x00b3
                           0000B4   214 _T0	=	0x00b4
                           0000B5   215 _T1	=	0x00b5
                           0000B6   216 _WR	=	0x00b6
                           0000B7   217 _RD	=	0x00b7
                           0000B8   218 _PX0	=	0x00b8
                           0000B9   219 _PT0	=	0x00b9
                           0000BA   220 _PX1	=	0x00ba
                           0000BB   221 _PT1	=	0x00bb
                           0000BC   222 _PS	=	0x00bc
                           0000D0   223 _P	=	0x00d0
                           0000D1   224 _F1	=	0x00d1
                           0000D2   225 _OV	=	0x00d2
                           0000D3   226 _RS0	=	0x00d3
                           0000D4   227 _RS1	=	0x00d4
                           0000D5   228 _F0	=	0x00d5
                           0000D6   229 _AC	=	0x00d6
                           0000D7   230 _CY	=	0x00d7
                                    231 ;--------------------------------------------------------
                                    232 ; overlayable register banks
                                    233 ;--------------------------------------------------------
                                    234 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        235 	.ds 8
                                    236 ;--------------------------------------------------------
                                    237 ; internal ram data
                                    238 ;--------------------------------------------------------
                                    239 	.area DSEG    (DATA)
                           000020   240 _buffer	=	0x0020
                           000023   241 _full	=	0x0023
                           000024   242 _letter	=	0x0024
                           000025   243 _empty	=	0x0025
                           000026   244 _mutex	=	0x0026
                           000027   245 _num	=	0x0027
                           000028   246 _p1	=	0x0028
                           000029   247 _p2	=	0x0029
                                    248 ;--------------------------------------------------------
                                    249 ; overlayable items in internal ram 
                                    250 ;--------------------------------------------------------
                                    251 ;--------------------------------------------------------
                                    252 ; Stack segment in internal ram 
                                    253 ;--------------------------------------------------------
                                    254 	.area	SSEG
      000008                        255 __start__stack:
      000008                        256 	.ds	1
                                    257 
                                    258 ;--------------------------------------------------------
                                    259 ; indirectly addressable internal ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area ISEG    (DATA)
                                    262 ;--------------------------------------------------------
                                    263 ; absolute internal ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area IABS    (ABS,DATA)
                                    266 	.area IABS    (ABS,DATA)
                                    267 ;--------------------------------------------------------
                                    268 ; bit data
                                    269 ;--------------------------------------------------------
                                    270 	.area BSEG    (BIT)
                                    271 ;--------------------------------------------------------
                                    272 ; paged external ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area PSEG    (PAG,XDATA)
                                    275 ;--------------------------------------------------------
                                    276 ; external ram data
                                    277 ;--------------------------------------------------------
                                    278 	.area XSEG    (XDATA)
                                    279 ;--------------------------------------------------------
                                    280 ; absolute external ram data
                                    281 ;--------------------------------------------------------
                                    282 	.area XABS    (ABS,XDATA)
                                    283 ;--------------------------------------------------------
                                    284 ; external initialized ram data
                                    285 ;--------------------------------------------------------
                                    286 	.area XISEG   (XDATA)
                                    287 	.area HOME    (CODE)
                                    288 	.area GSINIT0 (CODE)
                                    289 	.area GSINIT1 (CODE)
                                    290 	.area GSINIT2 (CODE)
                                    291 	.area GSINIT3 (CODE)
                                    292 	.area GSINIT4 (CODE)
                                    293 	.area GSINIT5 (CODE)
                                    294 	.area GSINIT  (CODE)
                                    295 	.area GSFINAL (CODE)
                                    296 	.area CSEG    (CODE)
                                    297 ;--------------------------------------------------------
                                    298 ; interrupt vector 
                                    299 ;--------------------------------------------------------
                                    300 	.area HOME    (CODE)
      000000                        301 __interrupt_vect:
      000000 02 00 EE         [24]  302 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  303 	reti
      000004                        304 	.ds	7
      00000B 02 00 F5         [24]  305 	ljmp	_timer0_ISR
                                    306 ;--------------------------------------------------------
                                    307 ; global & static initialisations
                                    308 ;--------------------------------------------------------
                                    309 	.area HOME    (CODE)
                                    310 	.area GSINIT  (CODE)
                                    311 	.area GSFINAL (CODE)
                                    312 	.area GSINIT  (CODE)
                                    313 	.globl __sdcc_gsinit_startup
                                    314 	.globl __sdcc_program_startup
                                    315 	.globl __start__stack
                                    316 	.globl __mcs51_genXINIT
                                    317 	.globl __mcs51_genXRAMCLEAR
                                    318 	.globl __mcs51_genRAMCLEAR
                                    319 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  320 	ljmp	__sdcc_program_startup
                                    321 ;--------------------------------------------------------
                                    322 ; Home
                                    323 ;--------------------------------------------------------
                                    324 	.area HOME    (CODE)
                                    325 	.area HOME    (CODE)
      00000E                        326 __sdcc_program_startup:
      00000E 02 00 CA         [24]  327 	ljmp	_main
                                    328 ;	return from main will return to caller
                                    329 ;--------------------------------------------------------
                                    330 ; code
                                    331 ;--------------------------------------------------------
                                    332 	.area CSEG    (CODE)
                                    333 ;------------------------------------------------------------
                                    334 ;Allocation info for local variables in function 'Producer1'
                                    335 ;------------------------------------------------------------
                                    336 ;	test3threads.c:19: void Producer1(void) {
                                    337 ;	-----------------------------------------
                                    338 ;	 function Producer1
                                    339 ;	-----------------------------------------
      000014                        340 _Producer1:
                           000007   341 	ar7 = 0x07
                           000006   342 	ar6 = 0x06
                           000005   343 	ar5 = 0x05
                           000004   344 	ar4 = 0x04
                           000003   345 	ar3 = 0x03
                           000002   346 	ar2 = 0x02
                           000001   347 	ar1 = 0x01
                           000000   348 	ar0 = 0x00
                                    349 ;	test3threads.c:22: while (1) {
      000014                        350 00105$:
                                    351 ;	test3threads.c:24: SemaphoreWait(p2);
      000014                        352 		0$:
      000014 85 29 E0         [24]  353 	MOV ACC, _p2 
      000017 60 FB            [24]  354 	JZ 0$ 
      000019 15 29            [12]  355 	dec _p2 
                                    356 ;	test3threads.c:25: SemaphoreWait(empty);
      00001B                        357 		1$:
      00001B 85 25 E0         [24]  358 	MOV ACC, _empty 
      00001E 60 FB            [24]  359 	JZ 1$ 
      000020 15 25            [12]  360 	dec _empty 
                                    361 ;	test3threads.c:26: SemaphoreWait(mutex);
      000022                        362 		2$:
      000022 85 26 E0         [24]  363 	MOV ACC, _mutex 
      000025 60 FB            [24]  364 	JZ 2$ 
      000027 15 26            [12]  365 	dec _mutex 
                                    366 ;	test3threads.c:30: }
      000029 7F 01            [12]  367 	mov	r7,#0x01
      00002B 10 AF 02         [24]  368 	jbc	ea,00117$
      00002E 7F 00            [12]  369 	mov	r7,#0x00
      000030                        370 00117$:
                                    371 ;	test3threads.c:29: buffer[full] = letter;
      000030 E5 23            [12]  372 	mov	a,_full
      000032 24 20            [12]  373 	add	a,#_buffer
      000034 F8               [12]  374 	mov	r0,a
      000035 A6 24            [24]  375 	mov	@r0,_letter
      000037 EF               [12]  376 	mov	a,r7
      000038 13               [12]  377 	rrc	a
      000039 92 AF            [24]  378 	mov	ea,c
                                    379 ;	test3threads.c:32: if (letter >= 'Z')
      00003B 74 A6            [12]  380 	mov	a,#0x100 - 0x5a
      00003D 25 24            [12]  381 	add	a,_letter
      00003F 50 05            [24]  382 	jnc	00102$
                                    383 ;	test3threads.c:34: letter = 'A';
      000041 75 24 41         [24]  384 	mov	_letter,#0x41
      000044 80 05            [24]  385 	sjmp	00103$
      000046                        386 00102$:
                                    387 ;	test3threads.c:38: letter++;
      000046 E5 24            [12]  388 	mov	a,_letter
      000048 04               [12]  389 	inc	a
      000049 F5 24            [12]  390 	mov	_letter,a
      00004B                        391 00103$:
                                    392 ;	test3threads.c:41: SemaphoreSignal(mutex);
      00004B 05 26            [12]  393 	INC _mutex 
                                    394 ;	test3threads.c:42: SemaphoreSignal(full);
      00004D 05 23            [12]  395 	INC _full 
                                    396 ;	test3threads.c:43: SemaphoreSignal(p1);
      00004F 05 28            [12]  397 	INC _p1 
                                    398 ;	test3threads.c:45: }
      000051 80 C1            [24]  399 	sjmp	00105$
                                    400 ;------------------------------------------------------------
                                    401 ;Allocation info for local variables in function 'Producer2'
                                    402 ;------------------------------------------------------------
                                    403 ;	test3threads.c:47: void Producer2(void) {
                                    404 ;	-----------------------------------------
                                    405 ;	 function Producer2
                                    406 ;	-----------------------------------------
      000053                        407 _Producer2:
                                    408 ;	test3threads.c:50: while (1) {
      000053                        409 00105$:
                                    410 ;	test3threads.c:52: SemaphoreWait(p1);
      000053                        411 		3$:
      000053 85 28 E0         [24]  412 	MOV ACC, _p1 
      000056 60 FB            [24]  413 	JZ 3$ 
      000058 15 28            [12]  414 	dec _p1 
                                    415 ;	test3threads.c:53: SemaphoreWait(empty);
      00005A                        416 		4$:
      00005A 85 25 E0         [24]  417 	MOV ACC, _empty 
      00005D 60 FB            [24]  418 	JZ 4$ 
      00005F 15 25            [12]  419 	dec _empty 
                                    420 ;	test3threads.c:54: SemaphoreWait(mutex);
      000061                        421 		5$:
      000061 85 26 E0         [24]  422 	MOV ACC, _mutex 
      000064 60 FB            [24]  423 	JZ 5$ 
      000066 15 26            [12]  424 	dec _mutex 
                                    425 ;	test3threads.c:59: }
      000068 7F 01            [12]  426 	mov	r7,#0x01
      00006A 10 AF 02         [24]  427 	jbc	ea,00117$
      00006D 7F 00            [12]  428 	mov	r7,#0x00
      00006F                        429 00117$:
                                    430 ;	test3threads.c:58: buffer[full] = num;
      00006F E5 23            [12]  431 	mov	a,_full
      000071 24 20            [12]  432 	add	a,#_buffer
      000073 F8               [12]  433 	mov	r0,a
      000074 A6 27            [24]  434 	mov	@r0,_num
      000076 EF               [12]  435 	mov	a,r7
      000077 13               [12]  436 	rrc	a
      000078 92 AF            [24]  437 	mov	ea,c
                                    438 ;	test3threads.c:61: if (num >= '9')
      00007A 74 C7            [12]  439 	mov	a,#0x100 - 0x39
      00007C 25 27            [12]  440 	add	a,_num
      00007E 50 05            [24]  441 	jnc	00102$
                                    442 ;	test3threads.c:63: num = '0';
      000080 75 27 30         [24]  443 	mov	_num,#0x30
      000083 80 05            [24]  444 	sjmp	00103$
      000085                        445 00102$:
                                    446 ;	test3threads.c:67: num++;
      000085 E5 27            [12]  447 	mov	a,_num
      000087 04               [12]  448 	inc	a
      000088 F5 27            [12]  449 	mov	_num,a
      00008A                        450 00103$:
                                    451 ;	test3threads.c:70: SemaphoreSignal(mutex);
      00008A 05 26            [12]  452 	INC _mutex 
                                    453 ;	test3threads.c:71: SemaphoreSignal(full);
      00008C 05 23            [12]  454 	INC _full 
                                    455 ;	test3threads.c:72: SemaphoreSignal(p2);
      00008E 05 29            [12]  456 	INC _p2 
                                    457 ;	test3threads.c:74: }
      000090 80 C1            [24]  458 	sjmp	00105$
                                    459 ;------------------------------------------------------------
                                    460 ;Allocation info for local variables in function 'Consumer'
                                    461 ;------------------------------------------------------------
                                    462 ;	test3threads.c:76: void Consumer(void) {
                                    463 ;	-----------------------------------------
                                    464 ;	 function Consumer
                                    465 ;	-----------------------------------------
      000092                        466 _Consumer:
                                    467 ;	test3threads.c:78: TMOD |= 0x20;
      000092 43 89 20         [24]  468 	orl	_TMOD,#0x20
                                    469 ;	test3threads.c:79: TH1 = -6;
      000095 75 8D FA         [24]  470 	mov	_TH1,#0xfa
                                    471 ;	test3threads.c:80: SCON = 0x50;
      000098 75 98 50         [24]  472 	mov	_SCON,#0x50
                                    473 ;	test3threads.c:81: TR1 = 1;
                                    474 ;	assignBit
      00009B D2 8E            [12]  475 	setb	_TR1
                                    476 ;	test3threads.c:83: while (1) {
      00009D                        477 00105$:
                                    478 ;	test3threads.c:85: SemaphoreWait(full);
      00009D                        479 		6$:
      00009D 85 23 E0         [24]  480 	MOV ACC, _full 
      0000A0 60 FB            [24]  481 	JZ 6$ 
      0000A2 15 23            [12]  482 	dec _full 
                                    483 ;	test3threads.c:86: SemaphoreWait(mutex);
      0000A4                        484 		7$:
      0000A4 85 26 E0         [24]  485 	MOV ACC, _mutex 
      0000A7 60 FB            [24]  486 	JZ 7$ 
      0000A9 15 26            [12]  487 	dec _mutex 
                                    488 ;	test3threads.c:92: }
      0000AB 7F 01            [12]  489 	mov	r7,#0x01
      0000AD 10 AF 02         [24]  490 	jbc	ea,00121$
      0000B0 7F 00            [12]  491 	mov	r7,#0x00
      0000B2                        492 00121$:
                                    493 ;	test3threads.c:89: SBUF = buffer[0];
      0000B2 85 20 99         [24]  494 	mov	_SBUF,_buffer
                                    495 ;	test3threads.c:90: buffer[0] = buffer[1];
      0000B5 AE 21            [24]  496 	mov	r6,(_buffer + 0x0001)
      0000B7 8E 20            [24]  497 	mov	_buffer,r6
                                    498 ;	test3threads.c:91: buffer[1] = buffer[2];
      0000B9 AE 22            [24]  499 	mov	r6,(_buffer + 0x0002)
      0000BB 8E 21            [24]  500 	mov	(_buffer + 0x0001),r6
      0000BD EF               [12]  501 	mov	a,r7
      0000BE 13               [12]  502 	rrc	a
      0000BF 92 AF            [24]  503 	mov	ea,c
                                    504 ;	test3threads.c:94: SemaphoreSignal(mutex);
      0000C1 05 26            [12]  505 	INC _mutex 
                                    506 ;	test3threads.c:95: SemaphoreSignal(empty);
      0000C3 05 25            [12]  507 	INC _empty 
                                    508 ;	test3threads.c:97: while(TI==0){;}
      0000C5                        509 00101$:
                                    510 ;	test3threads.c:98: TI = 0;
                                    511 ;	assignBit
      0000C5 10 99 D5         [24]  512 	jbc	_TI,00105$
                                    513 ;	test3threads.c:101: }
      0000C8 80 FB            [24]  514 	sjmp	00101$
                                    515 ;------------------------------------------------------------
                                    516 ;Allocation info for local variables in function 'main'
                                    517 ;------------------------------------------------------------
                                    518 ;	test3threads.c:104: void main(void) {
                                    519 ;	-----------------------------------------
                                    520 ;	 function main
                                    521 ;	-----------------------------------------
      0000CA                        522 _main:
                                    523 ;	test3threads.c:107: letter = 'A';
      0000CA 75 24 41         [24]  524 	mov	_letter,#0x41
                                    525 ;	test3threads.c:108: num = '0';
      0000CD 75 27 30         [24]  526 	mov	_num,#0x30
                                    527 ;	test3threads.c:110: SemaphoreCreate(full, 0);
      0000D0 75 23 00         [24]  528 	mov	_full,#0x00
                                    529 ;	test3threads.c:111: SemaphoreCreate(empty, 3);
      0000D3 75 25 03         [24]  530 	mov	_empty,#0x03
                                    531 ;	test3threads.c:112: SemaphoreCreate(mutex, 1);
      0000D6 75 26 01         [24]  532 	mov	_mutex,#0x01
                                    533 ;	test3threads.c:113: SemaphoreCreate(p1, 0); //伊人依次p1先 不然p1會先灌爆buffer，輪到p2時就近不去了
      0000D9 75 28 00         [24]  534 	mov	_p1,#0x00
                                    535 ;	test3threads.c:114: SemaphoreCreate(p2, 1);
      0000DC 75 29 01         [24]  536 	mov	_p2,#0x01
                                    537 ;	test3threads.c:116: ThreadCreate(Producer1);
      0000DF 90 00 14         [24]  538 	mov	dptr,#_Producer1
      0000E2 12 01 1F         [24]  539 	lcall	_ThreadCreate
                                    540 ;	test3threads.c:117: ThreadCreate(Producer2);
      0000E5 90 00 53         [24]  541 	mov	dptr,#_Producer2
      0000E8 12 01 1F         [24]  542 	lcall	_ThreadCreate
                                    543 ;	test3threads.c:118: Consumer();
                                    544 ;	test3threads.c:122: }
      0000EB 02 00 92         [24]  545 	ljmp	_Consumer
                                    546 ;------------------------------------------------------------
                                    547 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    548 ;------------------------------------------------------------
                                    549 ;	test3threads.c:124: void _sdcc_gsinit_startup(void) {
                                    550 ;	-----------------------------------------
                                    551 ;	 function _sdcc_gsinit_startup
                                    552 ;	-----------------------------------------
      0000EE                        553 __sdcc_gsinit_startup:
                                    554 ;	test3threads.c:127: __endasm;
      0000EE 02 00 F9         [24]  555 	ljmp	_Bootstrap
                                    556 ;	test3threads.c:128: }
      0000F1 22               [24]  557 	ret
                                    558 ;------------------------------------------------------------
                                    559 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    560 ;------------------------------------------------------------
                                    561 ;	test3threads.c:130: void _mcs51_genRAMCLEAR(void) {}
                                    562 ;	-----------------------------------------
                                    563 ;	 function _mcs51_genRAMCLEAR
                                    564 ;	-----------------------------------------
      0000F2                        565 __mcs51_genRAMCLEAR:
      0000F2 22               [24]  566 	ret
                                    567 ;------------------------------------------------------------
                                    568 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    569 ;------------------------------------------------------------
                                    570 ;	test3threads.c:131: void _mcs51_genXINIT(void) {}
                                    571 ;	-----------------------------------------
                                    572 ;	 function _mcs51_genXINIT
                                    573 ;	-----------------------------------------
      0000F3                        574 __mcs51_genXINIT:
      0000F3 22               [24]  575 	ret
                                    576 ;------------------------------------------------------------
                                    577 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    578 ;------------------------------------------------------------
                                    579 ;	test3threads.c:132: void _mcs51_genXRAMCLEAR(void) {}
                                    580 ;	-----------------------------------------
                                    581 ;	 function _mcs51_genXRAMCLEAR
                                    582 ;	-----------------------------------------
      0000F4                        583 __mcs51_genXRAMCLEAR:
      0000F4 22               [24]  584 	ret
                                    585 ;------------------------------------------------------------
                                    586 ;Allocation info for local variables in function 'timer0_ISR'
                                    587 ;------------------------------------------------------------
                                    588 ;	test3threads.c:134: void timer0_ISR(void) __interrupt(1) {
                                    589 ;	-----------------------------------------
                                    590 ;	 function timer0_ISR
                                    591 ;	-----------------------------------------
      0000F5                        592 _timer0_ISR:
                                    593 ;	test3threads.c:137: __endasm;
      0000F5 02 02 39         [24]  594 	ljmp	_myTimer0Handler
                                    595 ;	test3threads.c:138: }
      0000F8 32               [24]  596 	reti
                                    597 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    598 ;	eliminated unneeded push/pop psw
                                    599 ;	eliminated unneeded push/pop dpl
                                    600 ;	eliminated unneeded push/pop dph
                                    601 ;	eliminated unneeded push/pop b
                                    602 ;	eliminated unneeded push/pop acc
                                    603 	.area CSEG    (CODE)
                                    604 	.area CONST   (CODE)
                                    605 	.area XINIT   (CODE)
                                    606 	.area CABS    (ABS,CODE)
