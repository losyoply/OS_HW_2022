                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module testparking
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _log_PARM_3
                                     12 	.globl _log_PARM_2
                                     13 	.globl _timer0_ISR
                                     14 	.globl __mcs51_genXRAMCLEAR
                                     15 	.globl __mcs51_genXINIT
                                     16 	.globl __mcs51_genRAMCLEAR
                                     17 	.globl __sdcc_gsinit_startup
                                     18 	.globl _main
                                     19 	.globl _Producer
                                     20 	.globl _log
                                     21 	.globl _ThreadExit
                                     22 	.globl _ThreadCreate
                                     23 	.globl _CY
                                     24 	.globl _AC
                                     25 	.globl _F0
                                     26 	.globl _RS1
                                     27 	.globl _RS0
                                     28 	.globl _OV
                                     29 	.globl _F1
                                     30 	.globl _P
                                     31 	.globl _PS
                                     32 	.globl _PT1
                                     33 	.globl _PX1
                                     34 	.globl _PT0
                                     35 	.globl _PX0
                                     36 	.globl _RD
                                     37 	.globl _WR
                                     38 	.globl _T1
                                     39 	.globl _T0
                                     40 	.globl _INT1
                                     41 	.globl _INT0
                                     42 	.globl _TXD
                                     43 	.globl _RXD
                                     44 	.globl _P3_7
                                     45 	.globl _P3_6
                                     46 	.globl _P3_5
                                     47 	.globl _P3_4
                                     48 	.globl _P3_3
                                     49 	.globl _P3_2
                                     50 	.globl _P3_1
                                     51 	.globl _P3_0
                                     52 	.globl _EA
                                     53 	.globl _ES
                                     54 	.globl _ET1
                                     55 	.globl _EX1
                                     56 	.globl _ET0
                                     57 	.globl _EX0
                                     58 	.globl _P2_7
                                     59 	.globl _P2_6
                                     60 	.globl _P2_5
                                     61 	.globl _P2_4
                                     62 	.globl _P2_3
                                     63 	.globl _P2_2
                                     64 	.globl _P2_1
                                     65 	.globl _P2_0
                                     66 	.globl _SM0
                                     67 	.globl _SM1
                                     68 	.globl _SM2
                                     69 	.globl _REN
                                     70 	.globl _TB8
                                     71 	.globl _RB8
                                     72 	.globl _TI
                                     73 	.globl _RI
                                     74 	.globl _P1_7
                                     75 	.globl _P1_6
                                     76 	.globl _P1_5
                                     77 	.globl _P1_4
                                     78 	.globl _P1_3
                                     79 	.globl _P1_2
                                     80 	.globl _P1_1
                                     81 	.globl _P1_0
                                     82 	.globl _TF1
                                     83 	.globl _TR1
                                     84 	.globl _TF0
                                     85 	.globl _TR0
                                     86 	.globl _IE1
                                     87 	.globl _IT1
                                     88 	.globl _IE0
                                     89 	.globl _IT0
                                     90 	.globl _P0_7
                                     91 	.globl _P0_6
                                     92 	.globl _P0_5
                                     93 	.globl _P0_4
                                     94 	.globl _P0_3
                                     95 	.globl _P0_2
                                     96 	.globl _P0_1
                                     97 	.globl _P0_0
                                     98 	.globl _B
                                     99 	.globl _ACC
                                    100 	.globl _PSW
                                    101 	.globl _IP
                                    102 	.globl _P3
                                    103 	.globl _IE
                                    104 	.globl _P2
                                    105 	.globl _SBUF
                                    106 	.globl _SCON
                                    107 	.globl _P1
                                    108 	.globl _TH1
                                    109 	.globl _TH0
                                    110 	.globl _TL1
                                    111 	.globl _TL0
                                    112 	.globl _TMOD
                                    113 	.globl _TCON
                                    114 	.globl _PCON
                                    115 	.globl _DPH
                                    116 	.globl _DPL
                                    117 	.globl _SP
                                    118 	.globl _P0
                                    119 	.globl _car_name
                                    120 	.globl _i
                                    121 	.globl _car_thread
                                    122 	.globl _car
                                    123 	.globl _space2
                                    124 	.globl _space1
                                    125 	.globl _empty_thread
                                    126 	.globl _mutex
                                    127 	.globl _empty
                                    128 	.globl _first
                                    129 	.globl _car_time
                                    130 	.globl _time
                                    131 	.globl _time_unit
                                    132 	.globl _tmp_SP
                                    133 	.globl _final_id
                                    134 	.globl _bitmap
                                    135 	.globl _current_id
                                    136 	.globl _stackP
                                    137 ;--------------------------------------------------------
                                    138 ; special function registers
                                    139 ;--------------------------------------------------------
                                    140 	.area RSEG    (ABS,DATA)
      000000                        141 	.org 0x0000
                           000080   142 _P0	=	0x0080
                           000081   143 _SP	=	0x0081
                           000082   144 _DPL	=	0x0082
                           000083   145 _DPH	=	0x0083
                           000087   146 _PCON	=	0x0087
                           000088   147 _TCON	=	0x0088
                           000089   148 _TMOD	=	0x0089
                           00008A   149 _TL0	=	0x008a
                           00008B   150 _TL1	=	0x008b
                           00008C   151 _TH0	=	0x008c
                           00008D   152 _TH1	=	0x008d
                           000090   153 _P1	=	0x0090
                           000098   154 _SCON	=	0x0098
                           000099   155 _SBUF	=	0x0099
                           0000A0   156 _P2	=	0x00a0
                           0000A8   157 _IE	=	0x00a8
                           0000B0   158 _P3	=	0x00b0
                           0000B8   159 _IP	=	0x00b8
                           0000D0   160 _PSW	=	0x00d0
                           0000E0   161 _ACC	=	0x00e0
                           0000F0   162 _B	=	0x00f0
                                    163 ;--------------------------------------------------------
                                    164 ; special function bits
                                    165 ;--------------------------------------------------------
                                    166 	.area RSEG    (ABS,DATA)
      000000                        167 	.org 0x0000
                           000080   168 _P0_0	=	0x0080
                           000081   169 _P0_1	=	0x0081
                           000082   170 _P0_2	=	0x0082
                           000083   171 _P0_3	=	0x0083
                           000084   172 _P0_4	=	0x0084
                           000085   173 _P0_5	=	0x0085
                           000086   174 _P0_6	=	0x0086
                           000087   175 _P0_7	=	0x0087
                           000088   176 _IT0	=	0x0088
                           000089   177 _IE0	=	0x0089
                           00008A   178 _IT1	=	0x008a
                           00008B   179 _IE1	=	0x008b
                           00008C   180 _TR0	=	0x008c
                           00008D   181 _TF0	=	0x008d
                           00008E   182 _TR1	=	0x008e
                           00008F   183 _TF1	=	0x008f
                           000090   184 _P1_0	=	0x0090
                           000091   185 _P1_1	=	0x0091
                           000092   186 _P1_2	=	0x0092
                           000093   187 _P1_3	=	0x0093
                           000094   188 _P1_4	=	0x0094
                           000095   189 _P1_5	=	0x0095
                           000096   190 _P1_6	=	0x0096
                           000097   191 _P1_7	=	0x0097
                           000098   192 _RI	=	0x0098
                           000099   193 _TI	=	0x0099
                           00009A   194 _RB8	=	0x009a
                           00009B   195 _TB8	=	0x009b
                           00009C   196 _REN	=	0x009c
                           00009D   197 _SM2	=	0x009d
                           00009E   198 _SM1	=	0x009e
                           00009F   199 _SM0	=	0x009f
                           0000A0   200 _P2_0	=	0x00a0
                           0000A1   201 _P2_1	=	0x00a1
                           0000A2   202 _P2_2	=	0x00a2
                           0000A3   203 _P2_3	=	0x00a3
                           0000A4   204 _P2_4	=	0x00a4
                           0000A5   205 _P2_5	=	0x00a5
                           0000A6   206 _P2_6	=	0x00a6
                           0000A7   207 _P2_7	=	0x00a7
                           0000A8   208 _EX0	=	0x00a8
                           0000A9   209 _ET0	=	0x00a9
                           0000AA   210 _EX1	=	0x00aa
                           0000AB   211 _ET1	=	0x00ab
                           0000AC   212 _ES	=	0x00ac
                           0000AF   213 _EA	=	0x00af
                           0000B0   214 _P3_0	=	0x00b0
                           0000B1   215 _P3_1	=	0x00b1
                           0000B2   216 _P3_2	=	0x00b2
                           0000B3   217 _P3_3	=	0x00b3
                           0000B4   218 _P3_4	=	0x00b4
                           0000B5   219 _P3_5	=	0x00b5
                           0000B6   220 _P3_6	=	0x00b6
                           0000B7   221 _P3_7	=	0x00b7
                           0000B0   222 _RXD	=	0x00b0
                           0000B1   223 _TXD	=	0x00b1
                           0000B2   224 _INT0	=	0x00b2
                           0000B3   225 _INT1	=	0x00b3
                           0000B4   226 _T0	=	0x00b4
                           0000B5   227 _T1	=	0x00b5
                           0000B6   228 _WR	=	0x00b6
                           0000B7   229 _RD	=	0x00b7
                           0000B8   230 _PX0	=	0x00b8
                           0000B9   231 _PT0	=	0x00b9
                           0000BA   232 _PX1	=	0x00ba
                           0000BB   233 _PT1	=	0x00bb
                           0000BC   234 _PS	=	0x00bc
                           0000D0   235 _P	=	0x00d0
                           0000D1   236 _F1	=	0x00d1
                           0000D2   237 _OV	=	0x00d2
                           0000D3   238 _RS0	=	0x00d3
                           0000D4   239 _RS1	=	0x00d4
                           0000D5   240 _F0	=	0x00d5
                           0000D6   241 _AC	=	0x00d6
                           0000D7   242 _CY	=	0x00d7
                                    243 ;--------------------------------------------------------
                                    244 ; overlayable register banks
                                    245 ;--------------------------------------------------------
                                    246 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        247 	.ds 8
                                    248 ;--------------------------------------------------------
                                    249 ; internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area DSEG    (DATA)
                           000030   252 _stackP	=	0x0030
                           000034   253 _current_id	=	0x0034
                           000035   254 _bitmap	=	0x0035
                           000036   255 _final_id	=	0x0036
                           000037   256 _tmp_SP	=	0x0037
                           000038   257 _time_unit	=	0x0038
                           000039   258 _time	=	0x0039
                           00003A   259 _car_time	=	0x003a
                           000020   260 _first	=	0x0020
                           000021   261 _empty	=	0x0021
                           000022   262 _mutex	=	0x0022
                           000023   263 _empty_thread	=	0x0023
                           000024   264 _space1	=	0x0024
                           000025   265 _space2	=	0x0025
                           000026   266 _car	=	0x0026
                           000027   267 _car_thread	=	0x0027
                           000028   268 _i	=	0x0028
                           00002A   269 _car_name	=	0x002a
                                    270 ;--------------------------------------------------------
                                    271 ; overlayable items in internal ram 
                                    272 ;--------------------------------------------------------
                                    273 	.area	OSEG    (OVR,DATA)
      000008                        274 _log_PARM_2:
      000008                        275 	.ds 1
      000009                        276 _log_PARM_3:
      000009                        277 	.ds 1
                                    278 ;--------------------------------------------------------
                                    279 ; Stack segment in internal ram 
                                    280 ;--------------------------------------------------------
                                    281 	.area	SSEG
      00000A                        282 __start__stack:
      00000A                        283 	.ds	1
                                    284 
                                    285 ;--------------------------------------------------------
                                    286 ; indirectly addressable internal ram data
                                    287 ;--------------------------------------------------------
                                    288 	.area ISEG    (DATA)
                                    289 ;--------------------------------------------------------
                                    290 ; absolute internal ram data
                                    291 ;--------------------------------------------------------
                                    292 	.area IABS    (ABS,DATA)
                                    293 	.area IABS    (ABS,DATA)
                                    294 ;--------------------------------------------------------
                                    295 ; bit data
                                    296 ;--------------------------------------------------------
                                    297 	.area BSEG    (BIT)
                                    298 ;--------------------------------------------------------
                                    299 ; paged external ram data
                                    300 ;--------------------------------------------------------
                                    301 	.area PSEG    (PAG,XDATA)
                                    302 ;--------------------------------------------------------
                                    303 ; external ram data
                                    304 ;--------------------------------------------------------
                                    305 	.area XSEG    (XDATA)
                                    306 ;--------------------------------------------------------
                                    307 ; absolute external ram data
                                    308 ;--------------------------------------------------------
                                    309 	.area XABS    (ABS,XDATA)
                                    310 ;--------------------------------------------------------
                                    311 ; external initialized ram data
                                    312 ;--------------------------------------------------------
                                    313 	.area XISEG   (XDATA)
                                    314 	.area HOME    (CODE)
                                    315 	.area GSINIT0 (CODE)
                                    316 	.area GSINIT1 (CODE)
                                    317 	.area GSINIT2 (CODE)
                                    318 	.area GSINIT3 (CODE)
                                    319 	.area GSINIT4 (CODE)
                                    320 	.area GSINIT5 (CODE)
                                    321 	.area GSINIT  (CODE)
                                    322 	.area GSFINAL (CODE)
                                    323 	.area CSEG    (CODE)
                                    324 ;--------------------------------------------------------
                                    325 ; interrupt vector 
                                    326 ;--------------------------------------------------------
                                    327 	.area HOME    (CODE)
      000000                        328 __interrupt_vect:
      000000 02 01 51         [24]  329 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  330 	reti
      000004                        331 	.ds	7
      00000B 02 01 58         [24]  332 	ljmp	_timer0_ISR
                                    333 ;--------------------------------------------------------
                                    334 ; global & static initialisations
                                    335 ;--------------------------------------------------------
                                    336 	.area HOME    (CODE)
                                    337 	.area GSINIT  (CODE)
                                    338 	.area GSFINAL (CODE)
                                    339 	.area GSINIT  (CODE)
                                    340 	.globl __sdcc_gsinit_startup
                                    341 	.globl __sdcc_program_startup
                                    342 	.globl __start__stack
                                    343 	.globl __mcs51_genXINIT
                                    344 	.globl __mcs51_genXRAMCLEAR
                                    345 	.globl __mcs51_genRAMCLEAR
                                    346 	.area GSFINAL (CODE)
      000011 02 00 0E         [24]  347 	ljmp	__sdcc_program_startup
                                    348 ;--------------------------------------------------------
                                    349 ; Home
                                    350 ;--------------------------------------------------------
                                    351 	.area HOME    (CODE)
                                    352 	.area HOME    (CODE)
      00000E                        353 __sdcc_program_startup:
      00000E 02 01 12         [24]  354 	ljmp	_main
                                    355 ;	return from main will return to caller
                                    356 ;--------------------------------------------------------
                                    357 ; code
                                    358 ;--------------------------------------------------------
                                    359 	.area CSEG    (CODE)
                                    360 ;------------------------------------------------------------
                                    361 ;Allocation info for local variables in function 'log'
                                    362 ;------------------------------------------------------------
                                    363 ;b                         Allocated with name '_log_PARM_2'
                                    364 ;c                         Allocated with name '_log_PARM_3'
                                    365 ;a                         Allocated to registers r7 
                                    366 ;------------------------------------------------------------
                                    367 ;	testparking.c:31: void log(char a, char b, char c){ //a=car b==in or out c==第幾個space
                                    368 ;	-----------------------------------------
                                    369 ;	 function log
                                    370 ;	-----------------------------------------
      000014                        371 _log:
                           000007   372 	ar7 = 0x07
                           000006   373 	ar6 = 0x06
                           000005   374 	ar5 = 0x05
                           000004   375 	ar4 = 0x04
                           000003   376 	ar3 = 0x03
                           000002   377 	ar2 = 0x02
                           000001   378 	ar1 = 0x01
                           000000   379 	ar0 = 0x00
      000014 AF 82            [24]  380 	mov	r7,dpl
                                    381 ;	testparking.c:32: TMOD |= 0x20;
      000016 43 89 20         [24]  382 	orl	_TMOD,#0x20
                                    383 ;	testparking.c:33: TH1 = -6;
      000019 75 8D FA         [24]  384 	mov	_TH1,#0xfa
                                    385 ;	testparking.c:34: SCON = 0x50;
      00001C 75 98 50         [24]  386 	mov	_SCON,#0x50
                                    387 ;	testparking.c:35: TR1 = 1;
                                    388 ;	assignBit
      00001F D2 8E            [12]  389 	setb	_TR1
                                    390 ;	testparking.c:37: for(i = 0; i < 5 ; i++)
      000021 75 28 00         [24]  391 	mov	_i,#0x00
      000024                        392 00120$:
      000024 74 FB            [12]  393 	mov	a,#0x100 - 0x05
      000026 25 28            [12]  394 	add	a,_i
      000028 40 40            [24]  395 	jc	00122$
                                    396 ;	testparking.c:39: if( i==0 ) 
      00002A E5 28            [12]  397 	mov	a,_i
      00002C 70 0B            [24]  398 	jnz	00113$
                                    399 ;	testparking.c:40: SBUF = (time&7) + '0';
      00002E AE 39            [24]  400 	mov	r6,_time
      000030 74 07            [12]  401 	mov	a,#0x07
      000032 5E               [12]  402 	anl	a,r6
      000033 24 30            [12]  403 	add	a,#0x30
      000035 F5 99            [12]  404 	mov	_SBUF,a
      000037 80 25            [24]  405 	sjmp	00115$
      000039                        406 00113$:
                                    407 ;	testparking.c:41: else if( i == 1 ) 
      000039 74 01            [12]  408 	mov	a,#0x01
      00003B B5 28 04         [24]  409 	cjne	a,_i,00110$
                                    410 ;	testparking.c:42: SBUF = a;
      00003E 8F 99            [24]  411 	mov	_SBUF,r7
      000040 80 1C            [24]  412 	sjmp	00115$
      000042                        413 00110$:
                                    414 ;	testparking.c:43: else if( i == 2 ) 
      000042 74 02            [12]  415 	mov	a,#0x02
      000044 B5 28 05         [24]  416 	cjne	a,_i,00107$
                                    417 ;	testparking.c:44: SBUF = b;
      000047 85 08 99         [24]  418 	mov	_SBUF,_log_PARM_2
      00004A 80 12            [24]  419 	sjmp	00115$
      00004C                        420 00107$:
                                    421 ;	testparking.c:45: else if( i == 3 ) 
      00004C 74 03            [12]  422 	mov	a,#0x03
      00004E B5 28 05         [24]  423 	cjne	a,_i,00104$
                                    424 ;	testparking.c:46: SBUF = c;
      000051 85 09 99         [24]  425 	mov	_SBUF,_log_PARM_3
      000054 80 08            [24]  426 	sjmp	00115$
      000056                        427 00104$:
                                    428 ;	testparking.c:47: else if( i == 4 ) 
      000056 74 04            [12]  429 	mov	a,#0x04
      000058 B5 28 03         [24]  430 	cjne	a,_i,00115$
                                    431 ;	testparking.c:48: SBUF = '\n';
      00005B 75 99 0A         [24]  432 	mov	_SBUF,#0x0a
                                    433 ;	testparking.c:50: while( !TI ){;} //TI==0
      00005E                        434 00115$:
                                    435 ;	testparking.c:51: TI = 0;
                                    436 ;	assignBit
      00005E 10 99 02         [24]  437 	jbc	_TI,00170$
      000061 80 FB            [24]  438 	sjmp	00115$
      000063                        439 00170$:
                                    440 ;	testparking.c:37: for(i = 0; i < 5 ; i++)
      000063 E5 28            [12]  441 	mov	a,_i
      000065 04               [12]  442 	inc	a
      000066 F5 28            [12]  443 	mov	_i,a
      000068 80 BA            [24]  444 	sjmp	00120$
      00006A                        445 00122$:
                                    446 ;	testparking.c:54: }
      00006A 22               [24]  447 	ret
                                    448 ;------------------------------------------------------------
                                    449 ;Allocation info for local variables in function 'Producer'
                                    450 ;------------------------------------------------------------
                                    451 ;	testparking.c:62: void Producer(void) {
                                    452 ;	-----------------------------------------
                                    453 ;	 function Producer
                                    454 ;	-----------------------------------------
      00006B                        455 _Producer:
                                    456 ;	testparking.c:63: SemaphoreWait(empty); //確認empty>0, --
      00006B                        457 		0$:
      00006B 85 21 E0         [24]  458 	MOV ACC, _empty 
      00006E 60 FB            [24]  459 	JZ 0$ 
      000070 15 21            [12]  460 	dec _empty 
                                    461 ;	testparking.c:64: SemaphoreWait(mutex); //no many car
      000072                        462 		1$:
      000072 85 22 E0         [24]  463 	MOV ACC, _mutex 
      000075 60 FB            [24]  464 	JZ 1$ 
      000077 15 22            [12]  465 	dec _mutex 
                                    466 ;	testparking.c:66: EA = 0;
                                    467 ;	assignBit
      000079 C2 AF            [12]  468 	clr	_EA
                                    469 ;	testparking.c:67: if (space1 == '0'){
      00007B 74 30            [12]  470 	mov	a,#0x30
      00007D B5 24 19         [24]  471 	cjne	a,_space1,00104$
                                    472 ;	testparking.c:69: space1 = car_name[current_id]; //哪台車停
      000080 E5 34            [12]  473 	mov	a,_current_id
      000082 24 2A            [12]  474 	add	a,#_car_name
      000084 F9               [12]  475 	mov	r1,a
      000085 87 24            [24]  476 	mov	_space1,@r1
                                    477 ;	testparking.c:70: log(car_name[current_id], 'i', '1');
      000087 E5 34            [12]  478 	mov	a,_current_id
      000089 24 2A            [12]  479 	add	a,#_car_name
      00008B F9               [12]  480 	mov	r1,a
      00008C 87 82            [24]  481 	mov	dpl,@r1
      00008E 75 08 69         [24]  482 	mov	_log_PARM_2,#0x69
      000091 75 09 31         [24]  483 	mov	_log_PARM_3,#0x31
      000094 12 00 14         [24]  484 	lcall	_log
      000097 80 1C            [24]  485 	sjmp	00105$
      000099                        486 00104$:
                                    487 ;	testparking.c:73: else if (space2 == '0'){
      000099 74 30            [12]  488 	mov	a,#0x30
      00009B B5 25 17         [24]  489 	cjne	a,_space2,00105$
                                    490 ;	testparking.c:75: space2 = car_name[current_id];
      00009E E5 34            [12]  491 	mov	a,_current_id
      0000A0 24 2A            [12]  492 	add	a,#_car_name
      0000A2 F9               [12]  493 	mov	r1,a
      0000A3 87 25            [24]  494 	mov	_space2,@r1
                                    495 ;	testparking.c:76: log(car_name[current_id], 'i', '2');
      0000A5 E5 34            [12]  496 	mov	a,_current_id
      0000A7 24 2A            [12]  497 	add	a,#_car_name
      0000A9 F9               [12]  498 	mov	r1,a
      0000AA 87 82            [24]  499 	mov	dpl,@r1
      0000AC 75 08 69         [24]  500 	mov	_log_PARM_2,#0x69
      0000AF 75 09 32         [24]  501 	mov	_log_PARM_3,#0x32
      0000B2 12 00 14         [24]  502 	lcall	_log
      0000B5                        503 00105$:
                                    504 ;	testparking.c:78: EA = 1;
                                    505 ;	assignBit
      0000B5 D2 AF            [12]  506 	setb	_EA
                                    507 ;	testparking.c:80: SemaphoreSignal(mutex);
      0000B7 05 22            [12]  508 	INC _mutex 
                                    509 ;	testparking.c:82: delay(1);
      0000B9 E5 34            [12]  510 	mov	a,_current_id
      0000BB 24 3A            [12]  511 	add	a,#_car_time
      0000BD F9               [12]  512 	mov	r1,a
      0000BE E5 39            [12]  513 	mov	a,_time
      0000C0 FF               [12]  514 	mov	r7,a
      0000C1 04               [12]  515 	inc	a
      0000C2 F7               [12]  516 	mov	@r1,a
      0000C3                        517 00106$:
      0000C3 E5 34            [12]  518 	mov	a,_current_id
      0000C5 24 3A            [12]  519 	add	a,#_car_time
      0000C7 F9               [12]  520 	mov	r1,a
      0000C8 E7               [12]  521 	mov	a,@r1
      0000C9 B5 39 F7         [24]  522 	cjne	a,_time,00106$
                                    523 ;	testparking.c:84: EA = 0;
                                    524 ;	assignBit
      0000CC C2 AF            [12]  525 	clr	_EA
                                    526 ;	testparking.c:85: if (space1 == car_name[current_id]){
      0000CE E5 34            [12]  527 	mov	a,_current_id
      0000D0 24 2A            [12]  528 	add	a,#_car_name
      0000D2 F9               [12]  529 	mov	r1,a
      0000D3 E7               [12]  530 	mov	a,@r1
      0000D4 B5 24 15         [24]  531 	cjne	a,_space1,00112$
                                    532 ;	testparking.c:86: space1 = '0';
      0000D7 75 24 30         [24]  533 	mov	_space1,#0x30
                                    534 ;	testparking.c:87: log(car_name[current_id], 'o', '1');
      0000DA E5 34            [12]  535 	mov	a,_current_id
      0000DC 24 2A            [12]  536 	add	a,#_car_name
      0000DE F9               [12]  537 	mov	r1,a
      0000DF 87 82            [24]  538 	mov	dpl,@r1
      0000E1 75 08 6F         [24]  539 	mov	_log_PARM_2,#0x6f
      0000E4 75 09 31         [24]  540 	mov	_log_PARM_3,#0x31
      0000E7 12 00 14         [24]  541 	lcall	_log
      0000EA 80 1D            [24]  542 	sjmp	00113$
      0000EC                        543 00112$:
                                    544 ;	testparking.c:89: else if (space2 == car_name[current_id]){
      0000EC E5 34            [12]  545 	mov	a,_current_id
      0000EE 24 2A            [12]  546 	add	a,#_car_name
      0000F0 F9               [12]  547 	mov	r1,a
      0000F1 E7               [12]  548 	mov	a,@r1
      0000F2 FF               [12]  549 	mov	r7,a
      0000F3 B5 25 13         [24]  550 	cjne	a,_space2,00113$
                                    551 ;	testparking.c:90: space2 = '0';
      0000F6 75 25 30         [24]  552 	mov	_space2,#0x30
                                    553 ;	testparking.c:91: log(car_name[current_id], 'o', '2');
      0000F9 E5 34            [12]  554 	mov	a,_current_id
      0000FB 24 2A            [12]  555 	add	a,#_car_name
      0000FD F9               [12]  556 	mov	r1,a
      0000FE 87 82            [24]  557 	mov	dpl,@r1
      000100 75 08 6F         [24]  558 	mov	_log_PARM_2,#0x6f
      000103 75 09 32         [24]  559 	mov	_log_PARM_3,#0x32
      000106 12 00 14         [24]  560 	lcall	_log
      000109                        561 00113$:
                                    562 ;	testparking.c:94: EA = 1;
                                    563 ;	assignBit
      000109 D2 AF            [12]  564 	setb	_EA
                                    565 ;	testparking.c:95: SemaphoreSignal(empty);
      00010B 05 21            [12]  566 	INC _empty 
                                    567 ;	testparking.c:96: SemaphoreSignal(empty_thread);
      00010D 05 23            [12]  568 	INC _empty_thread 
                                    569 ;	testparking.c:97: ThreadExit();
                                    570 ;	testparking.c:99: }
      00010F 02 02 03         [24]  571 	ljmp	_ThreadExit
                                    572 ;------------------------------------------------------------
                                    573 ;Allocation info for local variables in function 'main'
                                    574 ;------------------------------------------------------------
                                    575 ;	testparking.c:102: void main(void) {
                                    576 ;	-----------------------------------------
                                    577 ;	 function main
                                    578 ;	-----------------------------------------
      000112                        579 _main:
                                    580 ;	testparking.c:104: SemaphoreCreate(mutex, 1);
      000112 75 22 01         [24]  581 	mov	_mutex,#0x01
                                    582 ;	testparking.c:105: SemaphoreCreate(empty, 2); 
      000115 75 21 02         [24]  583 	mov	_empty,#0x02
                                    584 ;	testparking.c:106: SemaphoreCreate(empty_thread, 3);//one thread for main
      000118 75 23 03         [24]  585 	mov	_empty_thread,#0x03
                                    586 ;	testparking.c:108: EA = 1;
                                    587 ;	assignBit
      00011B D2 AF            [12]  588 	setb	_EA
                                    589 ;	testparking.c:110: car = '1';
      00011D 75 26 31         [24]  590 	mov	_car,#0x31
                                    591 ;	testparking.c:111: space1 = '0';
      000120 75 24 30         [24]  592 	mov	_space1,#0x30
                                    593 ;	testparking.c:112: space2 = '0';
      000123 75 25 30         [24]  594 	mov	_space2,#0x30
                                    595 ;	testparking.c:113: time='0';
      000126 75 39 30         [24]  596 	mov	_time,#0x30
                                    597 ;	testparking.c:114: while(1){
      000129                        598 00105$:
                                    599 ;	testparking.c:116: SemaphoreWait(empty_thread);
      000129                        600 		2$:
      000129 85 23 E0         [24]  601 	MOV ACC, _empty_thread 
      00012C 60 FB            [24]  602 	JZ 2$ 
      00012E 15 23            [12]  603 	dec _empty_thread 
                                    604 ;	testparking.c:117: car_thread = ThreadCreate(Producer);
      000130 90 00 6B         [24]  605 	mov	dptr,#_Producer
      000133 12 01 82         [24]  606 	lcall	_ThreadCreate
      000136 85 82 27         [24]  607 	mov	_car_thread,dpl
                                    608 ;	testparking.c:118: car_name[car_thread] = car; //第x thread是哪個car
      000139 E5 27            [12]  609 	mov	a,_car_thread
      00013B 24 2A            [12]  610 	add	a,#_car_name
      00013D F8               [12]  611 	mov	r0,a
      00013E A6 26            [24]  612 	mov	@r0,_car
                                    613 ;	testparking.c:120: if(car=='5')
      000140 74 35            [12]  614 	mov	a,#0x35
      000142 B5 26 05         [24]  615 	cjne	a,_car,00102$
                                    616 ;	testparking.c:122: car='1';
      000145 75 26 31         [24]  617 	mov	_car,#0x31
      000148 80 DF            [24]  618 	sjmp	00105$
      00014A                        619 00102$:
                                    620 ;	testparking.c:126: car++;
      00014A E5 26            [12]  621 	mov	a,_car
      00014C 04               [12]  622 	inc	a
      00014D F5 26            [12]  623 	mov	_car,a
                                    624 ;	testparking.c:131: ThreadExit();
                                    625 ;	testparking.c:133: }
      00014F 80 D8            [24]  626 	sjmp	00105$
                                    627 ;------------------------------------------------------------
                                    628 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    629 ;------------------------------------------------------------
                                    630 ;	testparking.c:135: void _sdcc_gsinit_startup(void) {
                                    631 ;	-----------------------------------------
                                    632 ;	 function _sdcc_gsinit_startup
                                    633 ;	-----------------------------------------
      000151                        634 __sdcc_gsinit_startup:
                                    635 ;	testparking.c:138: __endasm;
      000151 02 01 5C         [24]  636 	ljmp	_Bootstrap
                                    637 ;	testparking.c:139: }
      000154 22               [24]  638 	ret
                                    639 ;------------------------------------------------------------
                                    640 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    641 ;------------------------------------------------------------
                                    642 ;	testparking.c:141: void _mcs51_genRAMCLEAR(void) {}
                                    643 ;	-----------------------------------------
                                    644 ;	 function _mcs51_genRAMCLEAR
                                    645 ;	-----------------------------------------
      000155                        646 __mcs51_genRAMCLEAR:
      000155 22               [24]  647 	ret
                                    648 ;------------------------------------------------------------
                                    649 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    650 ;------------------------------------------------------------
                                    651 ;	testparking.c:142: void _mcs51_genXINIT(void) {}
                                    652 ;	-----------------------------------------
                                    653 ;	 function _mcs51_genXINIT
                                    654 ;	-----------------------------------------
      000156                        655 __mcs51_genXINIT:
      000156 22               [24]  656 	ret
                                    657 ;------------------------------------------------------------
                                    658 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    659 ;------------------------------------------------------------
                                    660 ;	testparking.c:143: void _mcs51_genXRAMCLEAR(void) {}
                                    661 ;	-----------------------------------------
                                    662 ;	 function _mcs51_genXRAMCLEAR
                                    663 ;	-----------------------------------------
      000157                        664 __mcs51_genXRAMCLEAR:
      000157 22               [24]  665 	ret
                                    666 ;------------------------------------------------------------
                                    667 ;Allocation info for local variables in function 'timer0_ISR'
                                    668 ;------------------------------------------------------------
                                    669 ;	testparking.c:145: void timer0_ISR(void) __interrupt(1) {
                                    670 ;	-----------------------------------------
                                    671 ;	 function timer0_ISR
                                    672 ;	-----------------------------------------
      000158                        673 _timer0_ISR:
                                    674 ;	testparking.c:148: __endasm;
      000158 02 02 EC         [24]  675 	ljmp	_myTimer0Handler
                                    676 ;	testparking.c:149: }
      00015B 32               [24]  677 	reti
                                    678 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    679 ;	eliminated unneeded push/pop psw
                                    680 ;	eliminated unneeded push/pop dpl
                                    681 ;	eliminated unneeded push/pop dph
                                    682 ;	eliminated unneeded push/pop b
                                    683 ;	eliminated unneeded push/pop acc
                                    684 	.area CSEG    (CODE)
                                    685 	.area CONST   (CODE)
                                    686 	.area XINIT   (CODE)
                                    687 	.area CABS    (ABS,CODE)
