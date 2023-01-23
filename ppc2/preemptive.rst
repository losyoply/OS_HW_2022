                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _myTimer0Handler
                                     12 	.globl _Bootstrap
                                     13 	.globl _main
                                     14 	.globl _CY
                                     15 	.globl _AC
                                     16 	.globl _F0
                                     17 	.globl _RS1
                                     18 	.globl _RS0
                                     19 	.globl _OV
                                     20 	.globl _F1
                                     21 	.globl _P
                                     22 	.globl _PS
                                     23 	.globl _PT1
                                     24 	.globl _PX1
                                     25 	.globl _PT0
                                     26 	.globl _PX0
                                     27 	.globl _RD
                                     28 	.globl _WR
                                     29 	.globl _T1
                                     30 	.globl _T0
                                     31 	.globl _INT1
                                     32 	.globl _INT0
                                     33 	.globl _TXD
                                     34 	.globl _RXD
                                     35 	.globl _P3_7
                                     36 	.globl _P3_6
                                     37 	.globl _P3_5
                                     38 	.globl _P3_4
                                     39 	.globl _P3_3
                                     40 	.globl _P3_2
                                     41 	.globl _P3_1
                                     42 	.globl _P3_0
                                     43 	.globl _EA
                                     44 	.globl _ES
                                     45 	.globl _ET1
                                     46 	.globl _EX1
                                     47 	.globl _ET0
                                     48 	.globl _EX0
                                     49 	.globl _P2_7
                                     50 	.globl _P2_6
                                     51 	.globl _P2_5
                                     52 	.globl _P2_4
                                     53 	.globl _P2_3
                                     54 	.globl _P2_2
                                     55 	.globl _P2_1
                                     56 	.globl _P2_0
                                     57 	.globl _SM0
                                     58 	.globl _SM1
                                     59 	.globl _SM2
                                     60 	.globl _REN
                                     61 	.globl _TB8
                                     62 	.globl _RB8
                                     63 	.globl _TI
                                     64 	.globl _RI
                                     65 	.globl _P1_7
                                     66 	.globl _P1_6
                                     67 	.globl _P1_5
                                     68 	.globl _P1_4
                                     69 	.globl _P1_3
                                     70 	.globl _P1_2
                                     71 	.globl _P1_1
                                     72 	.globl _P1_0
                                     73 	.globl _TF1
                                     74 	.globl _TR1
                                     75 	.globl _TF0
                                     76 	.globl _TR0
                                     77 	.globl _IE1
                                     78 	.globl _IT1
                                     79 	.globl _IE0
                                     80 	.globl _IT0
                                     81 	.globl _P0_7
                                     82 	.globl _P0_6
                                     83 	.globl _P0_5
                                     84 	.globl _P0_4
                                     85 	.globl _P0_3
                                     86 	.globl _P0_2
                                     87 	.globl _P0_1
                                     88 	.globl _P0_0
                                     89 	.globl _B
                                     90 	.globl _ACC
                                     91 	.globl _PSW
                                     92 	.globl _IP
                                     93 	.globl _P3
                                     94 	.globl _IE
                                     95 	.globl _P2
                                     96 	.globl _SBUF
                                     97 	.globl _SCON
                                     98 	.globl _P1
                                     99 	.globl _TH1
                                    100 	.globl _TH0
                                    101 	.globl _TL1
                                    102 	.globl _TL0
                                    103 	.globl _TMOD
                                    104 	.globl _TCON
                                    105 	.globl _PCON
                                    106 	.globl _DPH
                                    107 	.globl _DPL
                                    108 	.globl _SP
                                    109 	.globl _P0
                                    110 	.globl _tmp_SP
                                    111 	.globl _final_id
                                    112 	.globl _bitmap
                                    113 	.globl _current_id
                                    114 	.globl _stackP
                                    115 	.globl _ThreadCreate
                                    116 	.globl _ThreadYield
                                    117 	.globl _ThreadExit
                                    118 ;--------------------------------------------------------
                                    119 ; special function registers
                                    120 ;--------------------------------------------------------
                                    121 	.area RSEG    (ABS,DATA)
      000000                        122 	.org 0x0000
                           000080   123 _P0	=	0x0080
                           000081   124 _SP	=	0x0081
                           000082   125 _DPL	=	0x0082
                           000083   126 _DPH	=	0x0083
                           000087   127 _PCON	=	0x0087
                           000088   128 _TCON	=	0x0088
                           000089   129 _TMOD	=	0x0089
                           00008A   130 _TL0	=	0x008a
                           00008B   131 _TL1	=	0x008b
                           00008C   132 _TH0	=	0x008c
                           00008D   133 _TH1	=	0x008d
                           000090   134 _P1	=	0x0090
                           000098   135 _SCON	=	0x0098
                           000099   136 _SBUF	=	0x0099
                           0000A0   137 _P2	=	0x00a0
                           0000A8   138 _IE	=	0x00a8
                           0000B0   139 _P3	=	0x00b0
                           0000B8   140 _IP	=	0x00b8
                           0000D0   141 _PSW	=	0x00d0
                           0000E0   142 _ACC	=	0x00e0
                           0000F0   143 _B	=	0x00f0
                                    144 ;--------------------------------------------------------
                                    145 ; special function bits
                                    146 ;--------------------------------------------------------
                                    147 	.area RSEG    (ABS,DATA)
      000000                        148 	.org 0x0000
                           000080   149 _P0_0	=	0x0080
                           000081   150 _P0_1	=	0x0081
                           000082   151 _P0_2	=	0x0082
                           000083   152 _P0_3	=	0x0083
                           000084   153 _P0_4	=	0x0084
                           000085   154 _P0_5	=	0x0085
                           000086   155 _P0_6	=	0x0086
                           000087   156 _P0_7	=	0x0087
                           000088   157 _IT0	=	0x0088
                           000089   158 _IE0	=	0x0089
                           00008A   159 _IT1	=	0x008a
                           00008B   160 _IE1	=	0x008b
                           00008C   161 _TR0	=	0x008c
                           00008D   162 _TF0	=	0x008d
                           00008E   163 _TR1	=	0x008e
                           00008F   164 _TF1	=	0x008f
                           000090   165 _P1_0	=	0x0090
                           000091   166 _P1_1	=	0x0091
                           000092   167 _P1_2	=	0x0092
                           000093   168 _P1_3	=	0x0093
                           000094   169 _P1_4	=	0x0094
                           000095   170 _P1_5	=	0x0095
                           000096   171 _P1_6	=	0x0096
                           000097   172 _P1_7	=	0x0097
                           000098   173 _RI	=	0x0098
                           000099   174 _TI	=	0x0099
                           00009A   175 _RB8	=	0x009a
                           00009B   176 _TB8	=	0x009b
                           00009C   177 _REN	=	0x009c
                           00009D   178 _SM2	=	0x009d
                           00009E   179 _SM1	=	0x009e
                           00009F   180 _SM0	=	0x009f
                           0000A0   181 _P2_0	=	0x00a0
                           0000A1   182 _P2_1	=	0x00a1
                           0000A2   183 _P2_2	=	0x00a2
                           0000A3   184 _P2_3	=	0x00a3
                           0000A4   185 _P2_4	=	0x00a4
                           0000A5   186 _P2_5	=	0x00a5
                           0000A6   187 _P2_6	=	0x00a6
                           0000A7   188 _P2_7	=	0x00a7
                           0000A8   189 _EX0	=	0x00a8
                           0000A9   190 _ET0	=	0x00a9
                           0000AA   191 _EX1	=	0x00aa
                           0000AB   192 _ET1	=	0x00ab
                           0000AC   193 _ES	=	0x00ac
                           0000AF   194 _EA	=	0x00af
                           0000B0   195 _P3_0	=	0x00b0
                           0000B1   196 _P3_1	=	0x00b1
                           0000B2   197 _P3_2	=	0x00b2
                           0000B3   198 _P3_3	=	0x00b3
                           0000B4   199 _P3_4	=	0x00b4
                           0000B5   200 _P3_5	=	0x00b5
                           0000B6   201 _P3_6	=	0x00b6
                           0000B7   202 _P3_7	=	0x00b7
                           0000B0   203 _RXD	=	0x00b0
                           0000B1   204 _TXD	=	0x00b1
                           0000B2   205 _INT0	=	0x00b2
                           0000B3   206 _INT1	=	0x00b3
                           0000B4   207 _T0	=	0x00b4
                           0000B5   208 _T1	=	0x00b5
                           0000B6   209 _WR	=	0x00b6
                           0000B7   210 _RD	=	0x00b7
                           0000B8   211 _PX0	=	0x00b8
                           0000B9   212 _PT0	=	0x00b9
                           0000BA   213 _PX1	=	0x00ba
                           0000BB   214 _PT1	=	0x00bb
                           0000BC   215 _PS	=	0x00bc
                           0000D0   216 _P	=	0x00d0
                           0000D1   217 _F1	=	0x00d1
                           0000D2   218 _OV	=	0x00d2
                           0000D3   219 _RS0	=	0x00d3
                           0000D4   220 _RS1	=	0x00d4
                           0000D5   221 _F0	=	0x00d5
                           0000D6   222 _AC	=	0x00d6
                           0000D7   223 _CY	=	0x00d7
                                    224 ;--------------------------------------------------------
                                    225 ; overlayable register banks
                                    226 ;--------------------------------------------------------
                                    227 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        228 	.ds 8
                                    229 ;--------------------------------------------------------
                                    230 ; internal ram data
                                    231 ;--------------------------------------------------------
                                    232 	.area DSEG    (DATA)
                           000030   233 _stackP	=	0x0030
                           000034   234 _current_id	=	0x0034
                           000035   235 _bitmap	=	0x0035
                           000036   236 _final_id	=	0x0036
                           000037   237 _tmp_SP	=	0x0037
                                    238 ;--------------------------------------------------------
                                    239 ; overlayable items in internal ram 
                                    240 ;--------------------------------------------------------
                                    241 	.area	OSEG    (OVR,DATA)
                                    242 ;--------------------------------------------------------
                                    243 ; indirectly addressable internal ram data
                                    244 ;--------------------------------------------------------
                                    245 	.area ISEG    (DATA)
                                    246 ;--------------------------------------------------------
                                    247 ; absolute internal ram data
                                    248 ;--------------------------------------------------------
                                    249 	.area IABS    (ABS,DATA)
                                    250 	.area IABS    (ABS,DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; bit data
                                    253 ;--------------------------------------------------------
                                    254 	.area BSEG    (BIT)
                                    255 ;--------------------------------------------------------
                                    256 ; paged external ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area PSEG    (PAG,XDATA)
                                    259 ;--------------------------------------------------------
                                    260 ; external ram data
                                    261 ;--------------------------------------------------------
                                    262 	.area XSEG    (XDATA)
                                    263 ;--------------------------------------------------------
                                    264 ; absolute external ram data
                                    265 ;--------------------------------------------------------
                                    266 	.area XABS    (ABS,XDATA)
                                    267 ;--------------------------------------------------------
                                    268 ; external initialized ram data
                                    269 ;--------------------------------------------------------
                                    270 	.area XISEG   (XDATA)
                                    271 	.area HOME    (CODE)
                                    272 	.area GSINIT0 (CODE)
                                    273 	.area GSINIT1 (CODE)
                                    274 	.area GSINIT2 (CODE)
                                    275 	.area GSINIT3 (CODE)
                                    276 	.area GSINIT4 (CODE)
                                    277 	.area GSINIT5 (CODE)
                                    278 	.area GSINIT  (CODE)
                                    279 	.area GSFINAL (CODE)
                                    280 	.area CSEG    (CODE)
                                    281 ;--------------------------------------------------------
                                    282 ; global & static initialisations
                                    283 ;--------------------------------------------------------
                                    284 	.area HOME    (CODE)
                                    285 	.area GSINIT  (CODE)
                                    286 	.area GSFINAL (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 ;--------------------------------------------------------
                                    289 ; Home
                                    290 ;--------------------------------------------------------
                                    291 	.area HOME    (CODE)
                                    292 	.area HOME    (CODE)
                                    293 ;--------------------------------------------------------
                                    294 ; code
                                    295 ;--------------------------------------------------------
                                    296 	.area CSEG    (CODE)
                                    297 ;------------------------------------------------------------
                                    298 ;Allocation info for local variables in function 'Bootstrap'
                                    299 ;------------------------------------------------------------
                                    300 ;	preemptive.c:41: void Bootstrap(void) {
                                    301 ;	-----------------------------------------
                                    302 ;	 function Bootstrap
                                    303 ;	-----------------------------------------
      000083                        304 _Bootstrap:
                           000007   305 	ar7 = 0x07
                           000006   306 	ar6 = 0x06
                           000005   307 	ar5 = 0x05
                           000004   308 	ar4 = 0x04
                           000003   309 	ar3 = 0x03
                           000002   310 	ar2 = 0x02
                           000001   311 	ar1 = 0x01
                           000000   312 	ar0 = 0x00
                                    313 ;	preemptive.c:45: TMOD = 0;  // timer 0 mode 0
      000083 75 89 00         [24]  314 	mov	_TMOD,#0x00
                                    315 ;	preemptive.c:46: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      000086 75 A8 82         [24]  316 	mov	_IE,#0x82
                                    317 ;	preemptive.c:48: TR0 = 1; // set bit TR0 to start running timer 0
                                    318 ;	assignBit
      000089 D2 8C            [12]  319 	setb	_TR0
                                    320 ;	preemptive.c:50: bitmap = 0b0000;
      00008B 75 35 00         [24]  321 	mov	_bitmap,#0x00
                                    322 ;	preemptive.c:51: current_id = ThreadCreate(main);
      00008E 90 00 66         [24]  323 	mov	dptr,#_main
      000091 12 00 A9         [24]  324 	lcall	_ThreadCreate
      000094 85 82 34         [24]  325 	mov	_current_id,dpl
                                    326 ;	preemptive.c:52: RESTORESTATE;
      000097 E5 34            [12]  327 	mov	a,_current_id
      000099 24 30            [12]  328 	add	a,#_stackP
      00009B F9               [12]  329 	mov	r1,a
      00009C 87 81            [24]  330 	mov	_SP,@r1
      00009E D0 D0            [24]  331 	POP PSW 
      0000A0 D0 83            [24]  332 	POP DPH 
      0000A2 D0 82            [24]  333 	POP DPL 
      0000A4 D0 F0            [24]  334 	POP B 
      0000A6 D0 E0            [24]  335 	POP ACC 
                                    336 ;	preemptive.c:54: }
      0000A8 22               [24]  337 	ret
                                    338 ;------------------------------------------------------------
                                    339 ;Allocation info for local variables in function 'ThreadCreate'
                                    340 ;------------------------------------------------------------
                                    341 ;fp                        Allocated to registers 
                                    342 ;------------------------------------------------------------
                                    343 ;	preemptive.c:56: ThreadID ThreadCreate(FunctionPtr fp) __critical{
                                    344 ;	-----------------------------------------
                                    345 ;	 function ThreadCreate
                                    346 ;	-----------------------------------------
      0000A9                        347 _ThreadCreate:
      0000A9 D3               [12]  348 	setb	c
      0000AA 10 AF 01         [24]  349 	jbc	ea,00129$
      0000AD C3               [12]  350 	clr	c
      0000AE                        351 00129$:
      0000AE C0 D0            [24]  352 	push	psw
                                    353 ;	preemptive.c:59: tmp_SP = SP;
      0000B0 85 81 37         [24]  354 	mov	_tmp_SP,_SP
                                    355 ;	preemptive.c:62: switch(bitmap){
      0000B3 AF 35            [24]  356 	mov	r7,_bitmap
      0000B5 BF 00 02         [24]  357 	cjne	r7,#0x00,00130$
      0000B8 80 14            [24]  358 	sjmp	00101$
      0000BA                        359 00130$:
      0000BA BF 01 02         [24]  360 	cjne	r7,#0x01,00131$
      0000BD 80 1A            [24]  361 	sjmp	00102$
      0000BF                        362 00131$:
      0000BF BF 03 02         [24]  363 	cjne	r7,#0x03,00132$
      0000C2 80 20            [24]  364 	sjmp	00103$
      0000C4                        365 00132$:
      0000C4 BF 07 02         [24]  366 	cjne	r7,#0x07,00133$
      0000C7 80 26            [24]  367 	sjmp	00104$
      0000C9                        368 00133$:
                                    369 ;	preemptive.c:63: case 0://0000
      0000C9 BF 0F 33         [24]  370 	cjne	r7,#0x0f,00106$
      0000CC 80 2C            [24]  371 	sjmp	00105$
      0000CE                        372 00101$:
                                    373 ;	preemptive.c:64: final_id = 0;
      0000CE 75 36 00         [24]  374 	mov	_final_id,#0x00
                                    375 ;	preemptive.c:65: bitmap = 1;
      0000D1 75 35 01         [24]  376 	mov	_bitmap,#0x01
                                    377 ;	preemptive.c:66: SP = 0x3F;
      0000D4 75 81 3F         [24]  378 	mov	_SP,#0x3f
                                    379 ;	preemptive.c:67: break;
                                    380 ;	preemptive.c:68: case 1://0001
      0000D7 80 26            [24]  381 	sjmp	00106$
      0000D9                        382 00102$:
                                    383 ;	preemptive.c:69: final_id = 1;
      0000D9 75 36 01         [24]  384 	mov	_final_id,#0x01
                                    385 ;	preemptive.c:70: bitmap = 3;
      0000DC 75 35 03         [24]  386 	mov	_bitmap,#0x03
                                    387 ;	preemptive.c:71: SP = 0x4F;
      0000DF 75 81 4F         [24]  388 	mov	_SP,#0x4f
                                    389 ;	preemptive.c:72: break;
                                    390 ;	preemptive.c:73: case 3://0011
      0000E2 80 1B            [24]  391 	sjmp	00106$
      0000E4                        392 00103$:
                                    393 ;	preemptive.c:74: final_id = 2;
      0000E4 75 36 02         [24]  394 	mov	_final_id,#0x02
                                    395 ;	preemptive.c:75: bitmap = 7;
      0000E7 75 35 07         [24]  396 	mov	_bitmap,#0x07
                                    397 ;	preemptive.c:76: SP = 0x5F;
      0000EA 75 81 5F         [24]  398 	mov	_SP,#0x5f
                                    399 ;	preemptive.c:77: break;
                                    400 ;	preemptive.c:78: case 7://0111
      0000ED 80 10            [24]  401 	sjmp	00106$
      0000EF                        402 00104$:
                                    403 ;	preemptive.c:79: final_id = 3;
      0000EF 75 36 03         [24]  404 	mov	_final_id,#0x03
                                    405 ;	preemptive.c:80: bitmap = 15;
      0000F2 75 35 0F         [24]  406 	mov	_bitmap,#0x0f
                                    407 ;	preemptive.c:81: SP = 0x6F;
      0000F5 75 81 6F         [24]  408 	mov	_SP,#0x6f
                                    409 ;	preemptive.c:82: break;
                                    410 ;	preemptive.c:83: case 15://1111
      0000F8 80 05            [24]  411 	sjmp	00106$
      0000FA                        412 00105$:
                                    413 ;	preemptive.c:84: return -1;
      0000FA 75 82 FF         [24]  414 	mov	dpl,#0xff
                                    415 ;	preemptive.c:85: }
      0000FD 80 26            [24]  416 	sjmp	00107$
      0000FF                        417 00106$:
                                    418 ;	preemptive.c:89: PSW = final_id << 3;// CY AC F0 RS1 RS0 OV UD P other are 0 except rs1 rs0
      0000FF E5 36            [12]  419 	mov	a,_final_id
      000101 FF               [12]  420 	mov	r7,a
      000102 C4               [12]  421 	swap	a
      000103 03               [12]  422 	rr	a
      000104 54 F8            [12]  423 	anl	a,#0xf8
      000106 F5 D0            [12]  424 	mov	_PSW,a
                                    425 ;	preemptive.c:100: __endasm; 
      000108 C0 82            [24]  426 	PUSH	DPL
      00010A C0 83            [24]  427 	PUSH	DPH
      00010C 54 00            [12]  428 	ANL	A,#0
      00010E C0 E0            [24]  429 	PUSH	ACC
      000110 C0 E0            [24]  430 	PUSH	ACC
      000112 C0 E0            [24]  431 	PUSH	ACC
      000114 C0 E0            [24]  432 	PUSH	ACC
      000116 C0 D0            [24]  433 	PUSH	PSW
                                    434 ;	preemptive.c:102: stackP[final_id] = SP;
      000118 E5 36            [12]  435 	mov	a,_final_id
      00011A 24 30            [12]  436 	add	a,#_stackP
      00011C F8               [12]  437 	mov	r0,a
      00011D A6 81            [24]  438 	mov	@r0,_SP
                                    439 ;	preemptive.c:103: SP = tmp_SP;
      00011F 85 37 81         [24]  440 	mov	_SP,_tmp_SP
                                    441 ;	preemptive.c:105: return final_id;
      000122 85 36 82         [24]  442 	mov	dpl,_final_id
      000125                        443 00107$:
                                    444 ;	preemptive.c:106: }
      000125 D0 D0            [24]  445 	pop	psw
      000127 92 AF            [24]  446 	mov	ea,c
      000129 22               [24]  447 	ret
                                    448 ;------------------------------------------------------------
                                    449 ;Allocation info for local variables in function 'ThreadYield'
                                    450 ;------------------------------------------------------------
                                    451 ;	preemptive.c:111: void ThreadYield(void) __critical{
                                    452 ;	-----------------------------------------
                                    453 ;	 function ThreadYield
                                    454 ;	-----------------------------------------
      00012A                        455 _ThreadYield:
      00012A D3               [12]  456 	setb	c
      00012B 10 AF 01         [24]  457 	jbc	ea,00148$
      00012E C3               [12]  458 	clr	c
      00012F                        459 00148$:
      00012F C0 D0            [24]  460 	push	psw
                                    461 ;	preemptive.c:112: SAVESTATE;
      000131 C0 E0            [24]  462 	PUSH ACC 
      000133 C0 F0            [24]  463 	PUSH B 
      000135 C0 82            [24]  464 	PUSH DPL 
      000137 C0 83            [24]  465 	PUSH DPH 
      000139 C0 D0            [24]  466 	PUSH PSW 
      00013B E5 34            [12]  467 	mov	a,_current_id
      00013D 24 30            [12]  468 	add	a,#_stackP
      00013F F8               [12]  469 	mov	r0,a
      000140 A6 81            [24]  470 	mov	@r0,_SP
                                    471 ;	preemptive.c:130: __endasm;
      000142 E8               [12]  472 	MOV	A, R0
      000143 C0 E0            [24]  473 	PUSH	ACC
      000145 E9               [12]  474 	MOV	A, R1
      000146 C0 E0            [24]  475 	PUSH	ACC
      000148 EA               [12]  476 	MOV	A, R2
      000149 C0 E0            [24]  477 	PUSH	ACC
      00014B EB               [12]  478 	MOV	A, R3
      00014C C0 E0            [24]  479 	PUSH	ACC
      00014E EC               [12]  480 	MOV	A, R4
      00014F C0 E0            [24]  481 	PUSH	ACC
      000151 ED               [12]  482 	MOV	A, R5
      000152 C0 E0            [24]  483 	PUSH	ACC
      000154 EE               [12]  484 	MOV	A, R6
      000155 C0 E0            [24]  485 	PUSH	ACC
      000157 EF               [12]  486 	MOV	A, R7
      000158 C0 E0            [24]  487 	PUSH	ACC
                                    488 ;	preemptive.c:134: if(current_id==3) current_id=0;
      00015A 74 03            [12]  489 	mov	a,#0x03
      00015C B5 34 05         [24]  490 	cjne	a,_current_id,00102$
      00015F 75 34 00         [24]  491 	mov	_current_id,#0x00
      000162 80 05            [24]  492 	sjmp	00103$
      000164                        493 00102$:
                                    494 ;	preemptive.c:135: else current_id++;
      000164 E5 34            [12]  495 	mov	a,_current_id
      000166 04               [12]  496 	inc	a
      000167 F5 34            [12]  497 	mov	_current_id,a
      000169                        498 00103$:
                                    499 ;	preemptive.c:137: if (bitmap == 1)
      000169 74 01            [12]  500 	mov	a,#0x01
      00016B B5 35 09         [24]  501 	cjne	a,_bitmap,00116$
                                    502 ;	preemptive.c:139: if (current_id > 0)
      00016E E5 34            [12]  503 	mov	a,_current_id
      000170 60 23            [24]  504 	jz	00117$
                                    505 ;	preemptive.c:140: current_id = 0;
      000172 75 34 00         [24]  506 	mov	_current_id,#0x00
      000175 80 1E            [24]  507 	sjmp	00117$
      000177                        508 00116$:
                                    509 ;	preemptive.c:142: else if (bitmap == 3)
      000177 74 03            [12]  510 	mov	a,#0x03
      000179 B5 35 0B         [24]  511 	cjne	a,_bitmap,00113$
                                    512 ;	preemptive.c:144: if (current_id > 1)
      00017C E5 34            [12]  513 	mov	a,_current_id
      00017E 24 FE            [12]  514 	add	a,#0xff - 0x01
      000180 50 13            [24]  515 	jnc	00117$
                                    516 ;	preemptive.c:145: current_id = 0;
      000182 75 34 00         [24]  517 	mov	_current_id,#0x00
      000185 80 0E            [24]  518 	sjmp	00117$
      000187                        519 00113$:
                                    520 ;	preemptive.c:147: else if (bitmap == 7)
      000187 74 07            [12]  521 	mov	a,#0x07
      000189 B5 35 09         [24]  522 	cjne	a,_bitmap,00117$
                                    523 ;	preemptive.c:149: if (current_id > 2)
      00018C E5 34            [12]  524 	mov	a,_current_id
      00018E 24 FD            [12]  525 	add	a,#0xff - 0x02
      000190 50 03            [24]  526 	jnc	00117$
                                    527 ;	preemptive.c:150: current_id = 0;
      000192 75 34 00         [24]  528 	mov	_current_id,#0x00
      000195                        529 00117$:
                                    530 ;	preemptive.c:174: __endasm;
      000195 D0 E0            [24]  531 	POP	ACC
      000197 FF               [12]  532 	MOV	R7, A
      000198 D0 E0            [24]  533 	POP	ACC
      00019A FE               [12]  534 	MOV	R6, A
      00019B D0 E0            [24]  535 	POP	ACC
      00019D FD               [12]  536 	MOV	R5, A
      00019E D0 E0            [24]  537 	POP	ACC
      0001A0 FC               [12]  538 	MOV	R4, A
      0001A1 D0 E0            [24]  539 	POP	ACC
      0001A3 FB               [12]  540 	MOV	R3, A
      0001A4 D0 E0            [24]  541 	POP	ACC
      0001A6 FA               [12]  542 	MOV	R2, A
      0001A7 D0 E0            [24]  543 	POP	ACC
      0001A9 F9               [12]  544 	MOV	R1, A
      0001AA D0 E0            [24]  545 	POP	ACC
      0001AC F8               [12]  546 	MOV	R0, A
                                    547 ;	preemptive.c:176: RESTORESTATE;
      0001AD E5 34            [12]  548 	mov	a,_current_id
      0001AF 24 30            [12]  549 	add	a,#_stackP
      0001B1 F9               [12]  550 	mov	r1,a
      0001B2 87 81            [24]  551 	mov	_SP,@r1
      0001B4 D0 D0            [24]  552 	POP PSW 
      0001B6 D0 83            [24]  553 	POP DPH 
      0001B8 D0 82            [24]  554 	POP DPL 
      0001BA D0 F0            [24]  555 	POP B 
      0001BC D0 E0            [24]  556 	POP ACC 
                                    557 ;	preemptive.c:177: }
      0001BE D0 D0            [24]  558 	pop	psw
      0001C0 92 AF            [24]  559 	mov	ea,c
      0001C2 22               [24]  560 	ret
                                    561 ;------------------------------------------------------------
                                    562 ;Allocation info for local variables in function 'myTimer0Handler'
                                    563 ;------------------------------------------------------------
                                    564 ;	preemptive.c:180: void myTimer0Handler(){
                                    565 ;	-----------------------------------------
                                    566 ;	 function myTimer0Handler
                                    567 ;	-----------------------------------------
      0001C3                        568 _myTimer0Handler:
                                    569 ;	preemptive.c:181: EA = 0;
                                    570 ;	assignBit
      0001C3 C2 AF            [12]  571 	clr	_EA
                                    572 ;	preemptive.c:182: SAVESTATE;
      0001C5 C0 E0            [24]  573 	PUSH ACC 
      0001C7 C0 F0            [24]  574 	PUSH B 
      0001C9 C0 82            [24]  575 	PUSH DPL 
      0001CB C0 83            [24]  576 	PUSH DPH 
      0001CD C0 D0            [24]  577 	PUSH PSW 
      0001CF E5 34            [12]  578 	mov	a,_current_id
      0001D1 24 30            [12]  579 	add	a,#_stackP
      0001D3 F8               [12]  580 	mov	r0,a
      0001D4 A6 81            [24]  581 	mov	@r0,_SP
                                    582 ;	preemptive.c:200: __endasm;
      0001D6 E8               [12]  583 	MOV	A, R0
      0001D7 C0 E0            [24]  584 	PUSH	ACC
      0001D9 E9               [12]  585 	MOV	A, R1
      0001DA C0 E0            [24]  586 	PUSH	ACC
      0001DC EA               [12]  587 	MOV	A, R2
      0001DD C0 E0            [24]  588 	PUSH	ACC
      0001DF EB               [12]  589 	MOV	A, R3
      0001E0 C0 E0            [24]  590 	PUSH	ACC
      0001E2 EC               [12]  591 	MOV	A, R4
      0001E3 C0 E0            [24]  592 	PUSH	ACC
      0001E5 ED               [12]  593 	MOV	A, R5
      0001E6 C0 E0            [24]  594 	PUSH	ACC
      0001E8 EE               [12]  595 	MOV	A, R6
      0001E9 C0 E0            [24]  596 	PUSH	ACC
      0001EB EF               [12]  597 	MOV	A, R7
      0001EC C0 E0            [24]  598 	PUSH	ACC
                                    599 ;	preemptive.c:204: if(current_id==3) current_id=0;
      0001EE 74 03            [12]  600 	mov	a,#0x03
      0001F0 B5 34 05         [24]  601 	cjne	a,_current_id,00102$
      0001F3 75 34 00         [24]  602 	mov	_current_id,#0x00
      0001F6 80 05            [24]  603 	sjmp	00103$
      0001F8                        604 00102$:
                                    605 ;	preemptive.c:205: else current_id++;
      0001F8 E5 34            [12]  606 	mov	a,_current_id
      0001FA 04               [12]  607 	inc	a
      0001FB F5 34            [12]  608 	mov	_current_id,a
      0001FD                        609 00103$:
                                    610 ;	preemptive.c:207: if (bitmap == 1)
      0001FD 74 01            [12]  611 	mov	a,#0x01
      0001FF B5 35 09         [24]  612 	cjne	a,_bitmap,00116$
                                    613 ;	preemptive.c:209: if (current_id > 0)
      000202 E5 34            [12]  614 	mov	a,_current_id
      000204 60 23            [24]  615 	jz	00117$
                                    616 ;	preemptive.c:210: current_id = 0;
      000206 75 34 00         [24]  617 	mov	_current_id,#0x00
      000209 80 1E            [24]  618 	sjmp	00117$
      00020B                        619 00116$:
                                    620 ;	preemptive.c:212: else if (bitmap == 3)
      00020B 74 03            [12]  621 	mov	a,#0x03
      00020D B5 35 0B         [24]  622 	cjne	a,_bitmap,00113$
                                    623 ;	preemptive.c:214: if (current_id > 1)
      000210 E5 34            [12]  624 	mov	a,_current_id
      000212 24 FE            [12]  625 	add	a,#0xff - 0x01
      000214 50 13            [24]  626 	jnc	00117$
                                    627 ;	preemptive.c:215: current_id = 0;
      000216 75 34 00         [24]  628 	mov	_current_id,#0x00
      000219 80 0E            [24]  629 	sjmp	00117$
      00021B                        630 00113$:
                                    631 ;	preemptive.c:217: else if (bitmap == 7)
      00021B 74 07            [12]  632 	mov	a,#0x07
      00021D B5 35 09         [24]  633 	cjne	a,_bitmap,00117$
                                    634 ;	preemptive.c:219: if (current_id > 2)
      000220 E5 34            [12]  635 	mov	a,_current_id
      000222 24 FD            [12]  636 	add	a,#0xff - 0x02
      000224 50 03            [24]  637 	jnc	00117$
                                    638 ;	preemptive.c:220: current_id = 0;
      000226 75 34 00         [24]  639 	mov	_current_id,#0x00
      000229                        640 00117$:
                                    641 ;	preemptive.c:243: __endasm;
      000229 D0 E0            [24]  642 	POP	ACC
      00022B FF               [12]  643 	MOV	R7, A
      00022C D0 E0            [24]  644 	POP	ACC
      00022E FE               [12]  645 	MOV	R6, A
      00022F D0 E0            [24]  646 	POP	ACC
      000231 FD               [12]  647 	MOV	R5, A
      000232 D0 E0            [24]  648 	POP	ACC
      000234 FC               [12]  649 	MOV	R4, A
      000235 D0 E0            [24]  650 	POP	ACC
      000237 FB               [12]  651 	MOV	R3, A
      000238 D0 E0            [24]  652 	POP	ACC
      00023A FA               [12]  653 	MOV	R2, A
      00023B D0 E0            [24]  654 	POP	ACC
      00023D F9               [12]  655 	MOV	R1, A
      00023E D0 E0            [24]  656 	POP	ACC
      000240 F8               [12]  657 	MOV	R0, A
                                    658 ;	preemptive.c:245: RESTORESTATE;
      000241 E5 34            [12]  659 	mov	a,_current_id
      000243 24 30            [12]  660 	add	a,#_stackP
      000245 F9               [12]  661 	mov	r1,a
      000246 87 81            [24]  662 	mov	_SP,@r1
      000248 D0 D0            [24]  663 	POP PSW 
      00024A D0 83            [24]  664 	POP DPH 
      00024C D0 82            [24]  665 	POP DPL 
      00024E D0 F0            [24]  666 	POP B 
      000250 D0 E0            [24]  667 	POP ACC 
                                    668 ;	preemptive.c:247: EA = 1;
                                    669 ;	assignBit
      000252 D2 AF            [12]  670 	setb	_EA
                                    671 ;	preemptive.c:250: __endasm;
      000254 32               [24]  672 	RETI
                                    673 ;	preemptive.c:251: }
      000255 22               [24]  674 	ret
                                    675 ;------------------------------------------------------------
                                    676 ;Allocation info for local variables in function 'ThreadExit'
                                    677 ;------------------------------------------------------------
                                    678 ;	preemptive.c:255: void ThreadExit(void) __critical{
                                    679 ;	-----------------------------------------
                                    680 ;	 function ThreadExit
                                    681 ;	-----------------------------------------
      000256                        682 _ThreadExit:
      000256 D3               [12]  683 	setb	c
      000257 10 AF 01         [24]  684 	jbc	ea,00103$
      00025A C3               [12]  685 	clr	c
      00025B                        686 00103$:
      00025B C0 D0            [24]  687 	push	psw
                                    688 ;	preemptive.c:257: RESTORESTATE;
      00025D E5 34            [12]  689 	mov	a,_current_id
      00025F 24 30            [12]  690 	add	a,#_stackP
      000261 F9               [12]  691 	mov	r1,a
      000262 87 81            [24]  692 	mov	_SP,@r1
      000264 D0 D0            [24]  693 	POP PSW 
      000266 D0 83            [24]  694 	POP DPH 
      000268 D0 82            [24]  695 	POP DPL 
      00026A D0 F0            [24]  696 	POP B 
      00026C D0 E0            [24]  697 	POP ACC 
                                    698 ;	preemptive.c:258: }
      00026E D0 D0            [24]  699 	pop	psw
      000270 92 AF            [24]  700 	mov	ea,c
      000272 22               [24]  701 	ret
                                    702 	.area CSEG    (CODE)
                                    703 	.area CONST   (CODE)
                                    704 	.area XINIT   (CODE)
                                    705 	.area CABS    (ABS,CODE)
