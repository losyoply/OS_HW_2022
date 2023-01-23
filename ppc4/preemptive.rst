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
                                    300 ;	preemptive.c:42: void Bootstrap(void) {
                                    301 ;	-----------------------------------------
                                    302 ;	 function Bootstrap
                                    303 ;	-----------------------------------------
      0000F9                        304 _Bootstrap:
                           000007   305 	ar7 = 0x07
                           000006   306 	ar6 = 0x06
                           000005   307 	ar5 = 0x05
                           000004   308 	ar4 = 0x04
                           000003   309 	ar3 = 0x03
                           000002   310 	ar2 = 0x02
                           000001   311 	ar1 = 0x01
                           000000   312 	ar0 = 0x00
                                    313 ;	preemptive.c:45: TMOD = 0;  // timer 0 mode 0
      0000F9 75 89 00         [24]  314 	mov	_TMOD,#0x00
                                    315 ;	preemptive.c:46: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      0000FC 75 A8 82         [24]  316 	mov	_IE,#0x82
                                    317 ;	preemptive.c:48: TR0 = 1; // set bit TR0 to start running timer 0
                                    318 ;	assignBit
      0000FF D2 8C            [12]  319 	setb	_TR0
                                    320 ;	preemptive.c:50: bitmap = 0b0000;
      000101 75 35 00         [24]  321 	mov	_bitmap,#0x00
                                    322 ;	preemptive.c:51: current_id = ThreadCreate(main);
      000104 90 00 CA         [24]  323 	mov	dptr,#_main
      000107 12 01 1F         [24]  324 	lcall	_ThreadCreate
      00010A 85 82 34         [24]  325 	mov	_current_id,dpl
                                    326 ;	preemptive.c:52: RESTORESTATE;
      00010D E5 34            [12]  327 	mov	a,_current_id
      00010F 24 30            [12]  328 	add	a,#_stackP
      000111 F9               [12]  329 	mov	r1,a
      000112 87 81            [24]  330 	mov	_SP,@r1
      000114 D0 D0            [24]  331 	POP PSW 
      000116 D0 83            [24]  332 	POP DPH 
      000118 D0 82            [24]  333 	POP DPL 
      00011A D0 F0            [24]  334 	POP B 
      00011C D0 E0            [24]  335 	POP ACC 
                                    336 ;	preemptive.c:54: }
      00011E 22               [24]  337 	ret
                                    338 ;------------------------------------------------------------
                                    339 ;Allocation info for local variables in function 'ThreadCreate'
                                    340 ;------------------------------------------------------------
                                    341 ;fp                        Allocated to registers 
                                    342 ;------------------------------------------------------------
                                    343 ;	preemptive.c:57: ThreadID ThreadCreate(FunctionPtr fp) __critical{
                                    344 ;	-----------------------------------------
                                    345 ;	 function ThreadCreate
                                    346 ;	-----------------------------------------
      00011F                        347 _ThreadCreate:
      00011F D3               [12]  348 	setb	c
      000120 10 AF 01         [24]  349 	jbc	ea,00129$
      000123 C3               [12]  350 	clr	c
      000124                        351 00129$:
      000124 C0 D0            [24]  352 	push	psw
                                    353 ;	preemptive.c:59: tmp_SP = SP;
      000126 85 81 37         [24]  354 	mov	_tmp_SP,_SP
                                    355 ;	preemptive.c:61: switch(bitmap){
      000129 AF 35            [24]  356 	mov	r7,_bitmap
      00012B BF 00 02         [24]  357 	cjne	r7,#0x00,00130$
      00012E 80 14            [24]  358 	sjmp	00101$
      000130                        359 00130$:
      000130 BF 01 02         [24]  360 	cjne	r7,#0x01,00131$
      000133 80 1A            [24]  361 	sjmp	00102$
      000135                        362 00131$:
      000135 BF 03 02         [24]  363 	cjne	r7,#0x03,00132$
      000138 80 20            [24]  364 	sjmp	00103$
      00013A                        365 00132$:
      00013A BF 07 02         [24]  366 	cjne	r7,#0x07,00133$
      00013D 80 26            [24]  367 	sjmp	00104$
      00013F                        368 00133$:
                                    369 ;	preemptive.c:62: case 0://0000
      00013F BF 0F 33         [24]  370 	cjne	r7,#0x0f,00106$
      000142 80 2C            [24]  371 	sjmp	00105$
      000144                        372 00101$:
                                    373 ;	preemptive.c:63: final_id = 0;
      000144 75 36 00         [24]  374 	mov	_final_id,#0x00
                                    375 ;	preemptive.c:64: bitmap = 1;
      000147 75 35 01         [24]  376 	mov	_bitmap,#0x01
                                    377 ;	preemptive.c:65: SP = 0x3F;
      00014A 75 81 3F         [24]  378 	mov	_SP,#0x3f
                                    379 ;	preemptive.c:66: break;
                                    380 ;	preemptive.c:67: case 1://0001
      00014D 80 26            [24]  381 	sjmp	00106$
      00014F                        382 00102$:
                                    383 ;	preemptive.c:68: final_id = 1;
      00014F 75 36 01         [24]  384 	mov	_final_id,#0x01
                                    385 ;	preemptive.c:69: bitmap = 3;
      000152 75 35 03         [24]  386 	mov	_bitmap,#0x03
                                    387 ;	preemptive.c:70: SP = 0x4F;
      000155 75 81 4F         [24]  388 	mov	_SP,#0x4f
                                    389 ;	preemptive.c:71: break;
                                    390 ;	preemptive.c:72: case 3://0011
      000158 80 1B            [24]  391 	sjmp	00106$
      00015A                        392 00103$:
                                    393 ;	preemptive.c:73: final_id = 2;
      00015A 75 36 02         [24]  394 	mov	_final_id,#0x02
                                    395 ;	preemptive.c:74: bitmap = 7;
      00015D 75 35 07         [24]  396 	mov	_bitmap,#0x07
                                    397 ;	preemptive.c:75: SP = 0x5F;
      000160 75 81 5F         [24]  398 	mov	_SP,#0x5f
                                    399 ;	preemptive.c:76: break;
                                    400 ;	preemptive.c:77: case 7://0111
      000163 80 10            [24]  401 	sjmp	00106$
      000165                        402 00104$:
                                    403 ;	preemptive.c:78: final_id = 3;
      000165 75 36 03         [24]  404 	mov	_final_id,#0x03
                                    405 ;	preemptive.c:79: bitmap = 15;
      000168 75 35 0F         [24]  406 	mov	_bitmap,#0x0f
                                    407 ;	preemptive.c:80: SP = 0x6F;
      00016B 75 81 6F         [24]  408 	mov	_SP,#0x6f
                                    409 ;	preemptive.c:81: break;
                                    410 ;	preemptive.c:82: case 15://1111
      00016E 80 05            [24]  411 	sjmp	00106$
      000170                        412 00105$:
                                    413 ;	preemptive.c:83: return -1;
      000170 75 82 FF         [24]  414 	mov	dpl,#0xff
                                    415 ;	preemptive.c:84: }
      000173 80 26            [24]  416 	sjmp	00107$
      000175                        417 00106$:
                                    418 ;	preemptive.c:88: PSW = final_id << 3;// CY AC F0 RS1 RS0 OV UD P other are 0 except rs1 rs0
      000175 E5 36            [12]  419 	mov	a,_final_id
      000177 FF               [12]  420 	mov	r7,a
      000178 C4               [12]  421 	swap	a
      000179 03               [12]  422 	rr	a
      00017A 54 F8            [12]  423 	anl	a,#0xf8
      00017C F5 D0            [12]  424 	mov	_PSW,a
                                    425 ;	preemptive.c:99: __endasm; 
      00017E C0 82            [24]  426 	PUSH	DPL
      000180 C0 83            [24]  427 	PUSH	DPH
      000182 54 00            [12]  428 	ANL	A,#0
      000184 C0 E0            [24]  429 	PUSH	ACC
      000186 C0 E0            [24]  430 	PUSH	ACC
      000188 C0 E0            [24]  431 	PUSH	ACC
      00018A C0 E0            [24]  432 	PUSH	ACC
      00018C C0 D0            [24]  433 	PUSH	PSW
                                    434 ;	preemptive.c:101: stackP[final_id] = SP;
      00018E E5 36            [12]  435 	mov	a,_final_id
      000190 24 30            [12]  436 	add	a,#_stackP
      000192 F8               [12]  437 	mov	r0,a
      000193 A6 81            [24]  438 	mov	@r0,_SP
                                    439 ;	preemptive.c:102: SP = tmp_SP;
      000195 85 37 81         [24]  440 	mov	_SP,_tmp_SP
                                    441 ;	preemptive.c:104: return final_id;
      000198 85 36 82         [24]  442 	mov	dpl,_final_id
      00019B                        443 00107$:
                                    444 ;	preemptive.c:105: }
      00019B D0 D0            [24]  445 	pop	psw
      00019D 92 AF            [24]  446 	mov	ea,c
      00019F 22               [24]  447 	ret
                                    448 ;------------------------------------------------------------
                                    449 ;Allocation info for local variables in function 'ThreadYield'
                                    450 ;------------------------------------------------------------
                                    451 ;	preemptive.c:110: void ThreadYield(void) __critical{
                                    452 ;	-----------------------------------------
                                    453 ;	 function ThreadYield
                                    454 ;	-----------------------------------------
      0001A0                        455 _ThreadYield:
      0001A0 D3               [12]  456 	setb	c
      0001A1 10 AF 01         [24]  457 	jbc	ea,00148$
      0001A4 C3               [12]  458 	clr	c
      0001A5                        459 00148$:
      0001A5 C0 D0            [24]  460 	push	psw
                                    461 ;	preemptive.c:111: SAVESTATE;
      0001A7 C0 E0            [24]  462 	PUSH ACC 
      0001A9 C0 F0            [24]  463 	PUSH B 
      0001AB C0 82            [24]  464 	PUSH DPL 
      0001AD C0 83            [24]  465 	PUSH DPH 
      0001AF C0 D0            [24]  466 	PUSH PSW 
      0001B1 E5 34            [12]  467 	mov	a,_current_id
      0001B3 24 30            [12]  468 	add	a,#_stackP
      0001B5 F8               [12]  469 	mov	r0,a
      0001B6 A6 81            [24]  470 	mov	@r0,_SP
                                    471 ;	preemptive.c:129: __endasm;
      0001B8 E8               [12]  472 	MOV	A, R0
      0001B9 C0 E0            [24]  473 	PUSH	ACC
      0001BB E9               [12]  474 	MOV	A, R1
      0001BC C0 E0            [24]  475 	PUSH	ACC
      0001BE EA               [12]  476 	MOV	A, R2
      0001BF C0 E0            [24]  477 	PUSH	ACC
      0001C1 EB               [12]  478 	MOV	A, R3
      0001C2 C0 E0            [24]  479 	PUSH	ACC
      0001C4 EC               [12]  480 	MOV	A, R4
      0001C5 C0 E0            [24]  481 	PUSH	ACC
      0001C7 ED               [12]  482 	MOV	A, R5
      0001C8 C0 E0            [24]  483 	PUSH	ACC
      0001CA EE               [12]  484 	MOV	A, R6
      0001CB C0 E0            [24]  485 	PUSH	ACC
      0001CD EF               [12]  486 	MOV	A, R7
      0001CE C0 E0            [24]  487 	PUSH	ACC
                                    488 ;	preemptive.c:132: if(current_id==3) current_id=0;
      0001D0 74 03            [12]  489 	mov	a,#0x03
      0001D2 B5 34 05         [24]  490 	cjne	a,_current_id,00102$
      0001D5 75 34 00         [24]  491 	mov	_current_id,#0x00
      0001D8 80 05            [24]  492 	sjmp	00103$
      0001DA                        493 00102$:
                                    494 ;	preemptive.c:133: else current_id++; //下一id, 若有thread就yield 沒有就yield回第一個
      0001DA E5 34            [12]  495 	mov	a,_current_id
      0001DC 04               [12]  496 	inc	a
      0001DD F5 34            [12]  497 	mov	_current_id,a
      0001DF                        498 00103$:
                                    499 ;	preemptive.c:136: if (bitmap == 1)//0001 
      0001DF 74 01            [12]  500 	mov	a,#0x01
      0001E1 B5 35 09         [24]  501 	cjne	a,_bitmap,00116$
                                    502 ;	preemptive.c:138: if (current_id > 0) //id是1,2,3
      0001E4 E5 34            [12]  503 	mov	a,_current_id
      0001E6 60 23            [24]  504 	jz	00117$
                                    505 ;	preemptive.c:139: current_id = 0;
      0001E8 75 34 00         [24]  506 	mov	_current_id,#0x00
      0001EB 80 1E            [24]  507 	sjmp	00117$
      0001ED                        508 00116$:
                                    509 ;	preemptive.c:141: else if (bitmap == 3) //0011 //0,1 ok
      0001ED 74 03            [12]  510 	mov	a,#0x03
      0001EF B5 35 0B         [24]  511 	cjne	a,_bitmap,00113$
                                    512 ;	preemptive.c:143: if (current_id > 1) //id是2,3
      0001F2 E5 34            [12]  513 	mov	a,_current_id
      0001F4 24 FE            [12]  514 	add	a,#0xff - 0x01
      0001F6 50 13            [24]  515 	jnc	00117$
                                    516 ;	preemptive.c:144: current_id = 0;
      0001F8 75 34 00         [24]  517 	mov	_current_id,#0x00
      0001FB 80 0E            [24]  518 	sjmp	00117$
      0001FD                        519 00113$:
                                    520 ;	preemptive.c:146: else if (bitmap == 7) //0111 //0,1,2 ok
      0001FD 74 07            [12]  521 	mov	a,#0x07
      0001FF B5 35 09         [24]  522 	cjne	a,_bitmap,00117$
                                    523 ;	preemptive.c:148: if (current_id > 2) 
      000202 E5 34            [12]  524 	mov	a,_current_id
      000204 24 FD            [12]  525 	add	a,#0xff - 0x02
      000206 50 03            [24]  526 	jnc	00117$
                                    527 ;	preemptive.c:149: current_id = 0;
      000208 75 34 00         [24]  528 	mov	_current_id,#0x00
      00020B                        529 00117$:
                                    530 ;	preemptive.c:172: __endasm;
      00020B D0 E0            [24]  531 	POP	ACC
      00020D FF               [12]  532 	MOV	R7, A
      00020E D0 E0            [24]  533 	POP	ACC
      000210 FE               [12]  534 	MOV	R6, A
      000211 D0 E0            [24]  535 	POP	ACC
      000213 FD               [12]  536 	MOV	R5, A
      000214 D0 E0            [24]  537 	POP	ACC
      000216 FC               [12]  538 	MOV	R4, A
      000217 D0 E0            [24]  539 	POP	ACC
      000219 FB               [12]  540 	MOV	R3, A
      00021A D0 E0            [24]  541 	POP	ACC
      00021C FA               [12]  542 	MOV	R2, A
      00021D D0 E0            [24]  543 	POP	ACC
      00021F F9               [12]  544 	MOV	R1, A
      000220 D0 E0            [24]  545 	POP	ACC
      000222 F8               [12]  546 	MOV	R0, A
                                    547 ;	preemptive.c:174: RESTORESTATE;
      000223 E5 34            [12]  548 	mov	a,_current_id
      000225 24 30            [12]  549 	add	a,#_stackP
      000227 F9               [12]  550 	mov	r1,a
      000228 87 81            [24]  551 	mov	_SP,@r1
      00022A D0 D0            [24]  552 	POP PSW 
      00022C D0 83            [24]  553 	POP DPH 
      00022E D0 82            [24]  554 	POP DPL 
      000230 D0 F0            [24]  555 	POP B 
      000232 D0 E0            [24]  556 	POP ACC 
                                    557 ;	preemptive.c:175: }
      000234 D0 D0            [24]  558 	pop	psw
      000236 92 AF            [24]  559 	mov	ea,c
      000238 22               [24]  560 	ret
                                    561 ;------------------------------------------------------------
                                    562 ;Allocation info for local variables in function 'myTimer0Handler'
                                    563 ;------------------------------------------------------------
                                    564 ;	preemptive.c:179: void myTimer0Handler(){
                                    565 ;	-----------------------------------------
                                    566 ;	 function myTimer0Handler
                                    567 ;	-----------------------------------------
      000239                        568 _myTimer0Handler:
                                    569 ;	preemptive.c:180: EA = 0;
                                    570 ;	assignBit
      000239 C2 AF            [12]  571 	clr	_EA
                                    572 ;	preemptive.c:181: SAVESTATE;
      00023B C0 E0            [24]  573 	PUSH ACC 
      00023D C0 F0            [24]  574 	PUSH B 
      00023F C0 82            [24]  575 	PUSH DPL 
      000241 C0 83            [24]  576 	PUSH DPH 
      000243 C0 D0            [24]  577 	PUSH PSW 
      000245 E5 34            [12]  578 	mov	a,_current_id
      000247 24 30            [12]  579 	add	a,#_stackP
      000249 F8               [12]  580 	mov	r0,a
      00024A A6 81            [24]  581 	mov	@r0,_SP
                                    582 ;	preemptive.c:199: __endasm;
      00024C E8               [12]  583 	MOV	A, R0
      00024D C0 E0            [24]  584 	PUSH	ACC
      00024F E9               [12]  585 	MOV	A, R1
      000250 C0 E0            [24]  586 	PUSH	ACC
      000252 EA               [12]  587 	MOV	A, R2
      000253 C0 E0            [24]  588 	PUSH	ACC
      000255 EB               [12]  589 	MOV	A, R3
      000256 C0 E0            [24]  590 	PUSH	ACC
      000258 EC               [12]  591 	MOV	A, R4
      000259 C0 E0            [24]  592 	PUSH	ACC
      00025B ED               [12]  593 	MOV	A, R5
      00025C C0 E0            [24]  594 	PUSH	ACC
      00025E EE               [12]  595 	MOV	A, R6
      00025F C0 E0            [24]  596 	PUSH	ACC
      000261 EF               [12]  597 	MOV	A, R7
      000262 C0 E0            [24]  598 	PUSH	ACC
                                    599 ;	preemptive.c:203: if(current_id==3) current_id=0;
      000264 74 03            [12]  600 	mov	a,#0x03
      000266 B5 34 05         [24]  601 	cjne	a,_current_id,00102$
      000269 75 34 00         [24]  602 	mov	_current_id,#0x00
      00026C 80 05            [24]  603 	sjmp	00103$
      00026E                        604 00102$:
                                    605 ;	preemptive.c:204: else current_id++;
      00026E E5 34            [12]  606 	mov	a,_current_id
      000270 04               [12]  607 	inc	a
      000271 F5 34            [12]  608 	mov	_current_id,a
      000273                        609 00103$:
                                    610 ;	preemptive.c:206: if (bitmap == 1)
      000273 74 01            [12]  611 	mov	a,#0x01
      000275 B5 35 09         [24]  612 	cjne	a,_bitmap,00116$
                                    613 ;	preemptive.c:208: if (current_id > 0)
      000278 E5 34            [12]  614 	mov	a,_current_id
      00027A 60 23            [24]  615 	jz	00117$
                                    616 ;	preemptive.c:209: current_id = 0;
      00027C 75 34 00         [24]  617 	mov	_current_id,#0x00
      00027F 80 1E            [24]  618 	sjmp	00117$
      000281                        619 00116$:
                                    620 ;	preemptive.c:211: else if (bitmap == 3)
      000281 74 03            [12]  621 	mov	a,#0x03
      000283 B5 35 0B         [24]  622 	cjne	a,_bitmap,00113$
                                    623 ;	preemptive.c:213: if (current_id > 1)
      000286 E5 34            [12]  624 	mov	a,_current_id
      000288 24 FE            [12]  625 	add	a,#0xff - 0x01
      00028A 50 13            [24]  626 	jnc	00117$
                                    627 ;	preemptive.c:214: current_id = 0;
      00028C 75 34 00         [24]  628 	mov	_current_id,#0x00
      00028F 80 0E            [24]  629 	sjmp	00117$
      000291                        630 00113$:
                                    631 ;	preemptive.c:216: else if (bitmap == 7)
      000291 74 07            [12]  632 	mov	a,#0x07
      000293 B5 35 09         [24]  633 	cjne	a,_bitmap,00117$
                                    634 ;	preemptive.c:218: if (current_id > 2)
      000296 E5 34            [12]  635 	mov	a,_current_id
      000298 24 FD            [12]  636 	add	a,#0xff - 0x02
      00029A 50 03            [24]  637 	jnc	00117$
                                    638 ;	preemptive.c:219: current_id = 0;
      00029C 75 34 00         [24]  639 	mov	_current_id,#0x00
      00029F                        640 00117$:
                                    641 ;	preemptive.c:242: __endasm;
      00029F D0 E0            [24]  642 	POP	ACC
      0002A1 FF               [12]  643 	MOV	R7, A
      0002A2 D0 E0            [24]  644 	POP	ACC
      0002A4 FE               [12]  645 	MOV	R6, A
      0002A5 D0 E0            [24]  646 	POP	ACC
      0002A7 FD               [12]  647 	MOV	R5, A
      0002A8 D0 E0            [24]  648 	POP	ACC
      0002AA FC               [12]  649 	MOV	R4, A
      0002AB D0 E0            [24]  650 	POP	ACC
      0002AD FB               [12]  651 	MOV	R3, A
      0002AE D0 E0            [24]  652 	POP	ACC
      0002B0 FA               [12]  653 	MOV	R2, A
      0002B1 D0 E0            [24]  654 	POP	ACC
      0002B3 F9               [12]  655 	MOV	R1, A
      0002B4 D0 E0            [24]  656 	POP	ACC
      0002B6 F8               [12]  657 	MOV	R0, A
                                    658 ;	preemptive.c:244: RESTORESTATE;
      0002B7 E5 34            [12]  659 	mov	a,_current_id
      0002B9 24 30            [12]  660 	add	a,#_stackP
      0002BB F9               [12]  661 	mov	r1,a
      0002BC 87 81            [24]  662 	mov	_SP,@r1
      0002BE D0 D0            [24]  663 	POP PSW 
      0002C0 D0 83            [24]  664 	POP DPH 
      0002C2 D0 82            [24]  665 	POP DPL 
      0002C4 D0 F0            [24]  666 	POP B 
      0002C6 D0 E0            [24]  667 	POP ACC 
                                    668 ;	preemptive.c:246: EA = 1;
                                    669 ;	assignBit
      0002C8 D2 AF            [12]  670 	setb	_EA
                                    671 ;	preemptive.c:249: __endasm;
      0002CA 32               [24]  672 	RETI
                                    673 ;	preemptive.c:250: }
      0002CB 22               [24]  674 	ret
                                    675 ;------------------------------------------------------------
                                    676 ;Allocation info for local variables in function 'ThreadExit'
                                    677 ;------------------------------------------------------------
                                    678 ;	preemptive.c:254: void ThreadExit(void) __critical{
                                    679 ;	-----------------------------------------
                                    680 ;	 function ThreadExit
                                    681 ;	-----------------------------------------
      0002CC                        682 _ThreadExit:
      0002CC D3               [12]  683 	setb	c
      0002CD 10 AF 01         [24]  684 	jbc	ea,00103$
      0002D0 C3               [12]  685 	clr	c
      0002D1                        686 00103$:
      0002D1 C0 D0            [24]  687 	push	psw
                                    688 ;	preemptive.c:256: RESTORESTATE;
      0002D3 E5 34            [12]  689 	mov	a,_current_id
      0002D5 24 30            [12]  690 	add	a,#_stackP
      0002D7 F9               [12]  691 	mov	r1,a
      0002D8 87 81            [24]  692 	mov	_SP,@r1
      0002DA D0 D0            [24]  693 	POP PSW 
      0002DC D0 83            [24]  694 	POP DPH 
      0002DE D0 82            [24]  695 	POP DPL 
      0002E0 D0 F0            [24]  696 	POP B 
      0002E2 D0 E0            [24]  697 	POP ACC 
                                    698 ;	preemptive.c:257: }
      0002E4 D0 D0            [24]  699 	pop	psw
      0002E6 92 AF            [24]  700 	mov	ea,c
      0002E8 22               [24]  701 	ret
                                    702 	.area CSEG    (CODE)
                                    703 	.area CONST   (CODE)
                                    704 	.area XINIT   (CODE)
                                    705 	.area CABS    (ABS,CODE)
