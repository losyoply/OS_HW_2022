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
                                    110 	.globl _car_time
                                    111 	.globl _time
                                    112 	.globl _time_unit
                                    113 	.globl _tmp_SP
                                    114 	.globl _final_id
                                    115 	.globl _bitmap
                                    116 	.globl _current_id
                                    117 	.globl _stackP
                                    118 	.globl _ThreadCreate
                                    119 	.globl _ThreadExit
                                    120 	.globl _now
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
                           000030   236 _stackP	=	0x0030
                           000034   237 _current_id	=	0x0034
                           000035   238 _bitmap	=	0x0035
                           000036   239 _final_id	=	0x0036
                           000037   240 _tmp_SP	=	0x0037
                           000038   241 _time_unit	=	0x0038
                           000039   242 _time	=	0x0039
                           00003A   243 _car_time	=	0x003a
                                    244 ;--------------------------------------------------------
                                    245 ; overlayable items in internal ram 
                                    246 ;--------------------------------------------------------
                                    247 	.area	OSEG    (OVR,DATA)
                                    248 ;--------------------------------------------------------
                                    249 ; indirectly addressable internal ram data
                                    250 ;--------------------------------------------------------
                                    251 	.area ISEG    (DATA)
                                    252 ;--------------------------------------------------------
                                    253 ; absolute internal ram data
                                    254 ;--------------------------------------------------------
                                    255 	.area IABS    (ABS,DATA)
                                    256 	.area IABS    (ABS,DATA)
                                    257 ;--------------------------------------------------------
                                    258 ; bit data
                                    259 ;--------------------------------------------------------
                                    260 	.area BSEG    (BIT)
                                    261 ;--------------------------------------------------------
                                    262 ; paged external ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area PSEG    (PAG,XDATA)
                                    265 ;--------------------------------------------------------
                                    266 ; external ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area XSEG    (XDATA)
                                    269 ;--------------------------------------------------------
                                    270 ; absolute external ram data
                                    271 ;--------------------------------------------------------
                                    272 	.area XABS    (ABS,XDATA)
                                    273 ;--------------------------------------------------------
                                    274 ; external initialized ram data
                                    275 ;--------------------------------------------------------
                                    276 	.area XISEG   (XDATA)
                                    277 	.area HOME    (CODE)
                                    278 	.area GSINIT0 (CODE)
                                    279 	.area GSINIT1 (CODE)
                                    280 	.area GSINIT2 (CODE)
                                    281 	.area GSINIT3 (CODE)
                                    282 	.area GSINIT4 (CODE)
                                    283 	.area GSINIT5 (CODE)
                                    284 	.area GSINIT  (CODE)
                                    285 	.area GSFINAL (CODE)
                                    286 	.area CSEG    (CODE)
                                    287 ;--------------------------------------------------------
                                    288 ; global & static initialisations
                                    289 ;--------------------------------------------------------
                                    290 	.area HOME    (CODE)
                                    291 	.area GSINIT  (CODE)
                                    292 	.area GSFINAL (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 ;--------------------------------------------------------
                                    295 ; Home
                                    296 ;--------------------------------------------------------
                                    297 	.area HOME    (CODE)
                                    298 	.area HOME    (CODE)
                                    299 ;--------------------------------------------------------
                                    300 ; code
                                    301 ;--------------------------------------------------------
                                    302 	.area CSEG    (CODE)
                                    303 ;------------------------------------------------------------
                                    304 ;Allocation info for local variables in function 'Bootstrap'
                                    305 ;------------------------------------------------------------
                                    306 ;	preemptive.c:53: void Bootstrap(void) {
                                    307 ;	-----------------------------------------
                                    308 ;	 function Bootstrap
                                    309 ;	-----------------------------------------
      00015C                        310 _Bootstrap:
                           000007   311 	ar7 = 0x07
                           000006   312 	ar6 = 0x06
                           000005   313 	ar5 = 0x05
                           000004   314 	ar4 = 0x04
                           000003   315 	ar3 = 0x03
                           000002   316 	ar2 = 0x02
                           000001   317 	ar1 = 0x01
                           000000   318 	ar0 = 0x00
                                    319 ;	preemptive.c:56: TMOD = 0;  // timer 0 mode 0
      00015C 75 89 00         [24]  320 	mov	_TMOD,#0x00
                                    321 ;	preemptive.c:57: IE = 0x82;  // enable timer 0 interrupt; keep consumer polling
      00015F 75 A8 82         [24]  322 	mov	_IE,#0x82
                                    323 ;	preemptive.c:59: TR0 = 1; // set bit TR0 to start running timer 0
                                    324 ;	assignBit
      000162 D2 8C            [12]  325 	setb	_TR0
                                    326 ;	preemptive.c:61: bitmap = 0b0000;
      000164 75 35 00         [24]  327 	mov	_bitmap,#0x00
                                    328 ;	preemptive.c:62: current_id = ThreadCreate(main);
      000167 90 01 12         [24]  329 	mov	dptr,#_main
      00016A 12 01 82         [24]  330 	lcall	_ThreadCreate
      00016D 85 82 34         [24]  331 	mov	_current_id,dpl
                                    332 ;	preemptive.c:63: RESTORESTATE;
      000170 E5 34            [12]  333 	mov	a,_current_id
      000172 24 30            [12]  334 	add	a,#_stackP
      000174 F9               [12]  335 	mov	r1,a
      000175 87 81            [24]  336 	mov	_SP,@r1
      000177 D0 D0            [24]  337 	POP PSW 
      000179 D0 83            [24]  338 	POP DPH 
      00017B D0 82            [24]  339 	POP DPL 
      00017D D0 F0            [24]  340 	POP B 
      00017F D0 E0            [24]  341 	POP ACC 
                                    342 ;	preemptive.c:66: }
      000181 22               [24]  343 	ret
                                    344 ;------------------------------------------------------------
                                    345 ;Allocation info for local variables in function 'ThreadCreate'
                                    346 ;------------------------------------------------------------
                                    347 ;fp                        Allocated to registers 
                                    348 ;------------------------------------------------------------
                                    349 ;	preemptive.c:75: ThreadID ThreadCreate(FunctionPtr fp) __critical{
                                    350 ;	-----------------------------------------
                                    351 ;	 function ThreadCreate
                                    352 ;	-----------------------------------------
      000182                        353 _ThreadCreate:
      000182 D3               [12]  354 	setb	c
      000183 10 AF 01         [24]  355 	jbc	ea,00136$
      000186 C3               [12]  356 	clr	c
      000187                        357 00136$:
      000187 C0 D0            [24]  358 	push	psw
                                    359 ;	preemptive.c:111: EA = 0;
                                    360 ;	assignBit
      000189 C2 AF            [12]  361 	clr	_EA
                                    362 ;	preemptive.c:118: if (bitmap == 15){ //thread full
      00018B 74 0F            [12]  363 	mov	a,#0x0f
      00018D B5 35 05         [24]  364 	cjne	a,_bitmap,00102$
                                    365 ;	preemptive.c:119: return -1;
      000190 75 82 FF         [24]  366 	mov	dpl,#0xff
      000193 80 69            [24]  367 	sjmp	00114$
      000195                        368 00102$:
                                    369 ;	preemptive.c:122: tmp_SP = SP;
      000195 85 81 37         [24]  370 	mov	_tmp_SP,_SP
                                    371 ;	preemptive.c:127: if (!(bitmap & 1)){
      000198 E5 35            [12]  372 	mov	a,_bitmap
      00019A 20 E0 0B         [24]  373 	jb	acc.0,00112$
                                    374 ;	preemptive.c:128: final_id = 0;
      00019D 75 36 00         [24]  375 	mov	_final_id,#0x00
                                    376 ;	preemptive.c:129: bitmap = bitmap | 1;
      0001A0 43 35 01         [24]  377 	orl	_bitmap,#0x01
                                    378 ;	preemptive.c:130: SP = 0x3F;
      0001A3 75 81 3F         [24]  379 	mov	_SP,#0x3f
      0001A6 80 2E            [24]  380 	sjmp	00113$
      0001A8                        381 00112$:
                                    382 ;	preemptive.c:132: else if (!(bitmap & 2)){
      0001A8 E5 35            [12]  383 	mov	a,_bitmap
      0001AA 20 E1 0B         [24]  384 	jb	acc.1,00109$
                                    385 ;	preemptive.c:133: final_id = 1;
      0001AD 75 36 01         [24]  386 	mov	_final_id,#0x01
                                    387 ;	preemptive.c:134: bitmap = bitmap | 2;
      0001B0 43 35 02         [24]  388 	orl	_bitmap,#0x02
                                    389 ;	preemptive.c:135: SP = 0x4F;
      0001B3 75 81 4F         [24]  390 	mov	_SP,#0x4f
      0001B6 80 1E            [24]  391 	sjmp	00113$
      0001B8                        392 00109$:
                                    393 ;	preemptive.c:137: else if (!(bitmap & 4)){
      0001B8 E5 35            [12]  394 	mov	a,_bitmap
      0001BA 20 E2 0B         [24]  395 	jb	acc.2,00106$
                                    396 ;	preemptive.c:138: final_id = 2;
      0001BD 75 36 02         [24]  397 	mov	_final_id,#0x02
                                    398 ;	preemptive.c:139: bitmap = bitmap | 4;
      0001C0 43 35 04         [24]  399 	orl	_bitmap,#0x04
                                    400 ;	preemptive.c:140: SP = 0x5F;
      0001C3 75 81 5F         [24]  401 	mov	_SP,#0x5f
      0001C6 80 0E            [24]  402 	sjmp	00113$
      0001C8                        403 00106$:
                                    404 ;	preemptive.c:142: else if (!(bitmap & 8)){
      0001C8 E5 35            [12]  405 	mov	a,_bitmap
      0001CA 20 E3 09         [24]  406 	jb	acc.3,00113$
                                    407 ;	preemptive.c:143: final_id = 3;
      0001CD 75 36 03         [24]  408 	mov	_final_id,#0x03
                                    409 ;	preemptive.c:144: bitmap = bitmap | 8;
      0001D0 43 35 08         [24]  410 	orl	_bitmap,#0x08
                                    411 ;	preemptive.c:145: SP = 0x6F;
      0001D3 75 81 6F         [24]  412 	mov	_SP,#0x6f
      0001D6                        413 00113$:
                                    414 ;	preemptive.c:149: PSW = final_id << 3;// CY AC F0 RS1 RS0 OV UD P other are 0 except rs1 rs0
      0001D6 E5 36            [12]  415 	mov	a,_final_id
      0001D8 FF               [12]  416 	mov	r7,a
      0001D9 C4               [12]  417 	swap	a
      0001DA 03               [12]  418 	rr	a
      0001DB 54 F8            [12]  419 	anl	a,#0xf8
      0001DD F5 D0            [12]  420 	mov	_PSW,a
                                    421 ;	preemptive.c:167: __endasm; 
      0001DF C0 82            [24]  422 	PUSH	DPL
      0001E1 C0 83            [24]  423 	PUSH	DPH
      0001E3 54 00            [12]  424 	ANL	A,#0
      0001E5 C0 E0            [24]  425 	PUSH	ACC
      0001E7 C0 E0            [24]  426 	PUSH	ACC
      0001E9 C0 E0            [24]  427 	PUSH	ACC
      0001EB C0 E0            [24]  428 	PUSH	ACC
      0001ED C0 D0            [24]  429 	PUSH	PSW
                                    430 ;	preemptive.c:169: stackP[final_id] = SP;
      0001EF E5 36            [12]  431 	mov	a,_final_id
      0001F1 24 30            [12]  432 	add	a,#_stackP
      0001F3 F8               [12]  433 	mov	r0,a
      0001F4 A6 81            [24]  434 	mov	@r0,_SP
                                    435 ;	preemptive.c:170: SP = tmp_SP;
      0001F6 85 37 81         [24]  436 	mov	_SP,_tmp_SP
                                    437 ;	preemptive.c:172: EA = 1;
                                    438 ;	assignBit
      0001F9 D2 AF            [12]  439 	setb	_EA
                                    440 ;	preemptive.c:174: return final_id;
      0001FB 85 36 82         [24]  441 	mov	dpl,_final_id
      0001FE                        442 00114$:
                                    443 ;	preemptive.c:175: }
      0001FE D0 D0            [24]  444 	pop	psw
      000200 92 AF            [24]  445 	mov	ea,c
      000202 22               [24]  446 	ret
                                    447 ;------------------------------------------------------------
                                    448 ;Allocation info for local variables in function 'ThreadExit'
                                    449 ;------------------------------------------------------------
                                    450 ;	preemptive.c:183: void ThreadExit(void){
                                    451 ;	-----------------------------------------
                                    452 ;	 function ThreadExit
                                    453 ;	-----------------------------------------
      000203                        454 _ThreadExit:
                                    455 ;	preemptive.c:191: EA = 0; 
                                    456 ;	assignBit
      000203 C2 AF            [12]  457 	clr	_EA
                                    458 ;	preemptive.c:192: if (current_id == 0){
      000205 E5 34            [12]  459 	mov	a,_current_id
      000207 70 32            [24]  460 	jnz	00166$
                                    461 ;	preemptive.c:193: bitmap = bitmap - 1;
      000209 E5 35            [12]  462 	mov	a,_bitmap
      00020B FF               [12]  463 	mov	r7,a
      00020C 14               [12]  464 	dec	a
      00020D F5 35            [12]  465 	mov	_bitmap,a
                                    466 ;	preemptive.c:194: do{ //??????exit?????????main?????????????????????????????????????????????main??????????????????????????????
      00020F                        467 00112$:
                                    468 ;	preemptive.c:196: if (bitmap & 2){
      00020F E5 35            [12]  469 	mov	a,_bitmap
      000211 30 E1 06         [24]  470 	jnb	acc.1,00110$
                                    471 ;	preemptive.c:197: current_id = 1;
      000214 75 34 01         [24]  472 	mov	_current_id,#0x01
                                    473 ;	preemptive.c:198: break;
      000217 02 02 D8         [24]  474 	ljmp	00167$
      00021A                        475 00110$:
                                    476 ;	preemptive.c:200: else if (bitmap & 4){
      00021A E5 35            [12]  477 	mov	a,_bitmap
      00021C 30 E2 06         [24]  478 	jnb	acc.2,00107$
                                    479 ;	preemptive.c:201: current_id = 2;
      00021F 75 34 02         [24]  480 	mov	_current_id,#0x02
                                    481 ;	preemptive.c:202: break;
      000222 02 02 D8         [24]  482 	ljmp	00167$
      000225                        483 00107$:
                                    484 ;	preemptive.c:204: else if (bitmap & 8){
      000225 E5 35            [12]  485 	mov	a,_bitmap
      000227 30 E3 06         [24]  486 	jnb	acc.3,00104$
                                    487 ;	preemptive.c:205: current_id = 3;
      00022A 75 34 03         [24]  488 	mov	_current_id,#0x03
                                    489 ;	preemptive.c:206: break;
      00022D 02 02 D8         [24]  490 	ljmp	00167$
      000230                        491 00104$:
                                    492 ;	preemptive.c:208: else if (bitmap & 1){ //there is thread on id = 0
      000230 E5 35            [12]  493 	mov	a,_bitmap
      000232 30 E0 DA         [24]  494 	jnb	acc.0,00112$
                                    495 ;	preemptive.c:209: current_id = 0;//switch to thread id=0
      000235 75 34 00         [24]  496 	mov	_current_id,#0x00
                                    497 ;	preemptive.c:210: break;
      000238 02 02 D8         [24]  498 	ljmp	00167$
                                    499 ;	preemptive.c:213: }while(1);//????????????thread??????????????????
      00023B                        500 00166$:
                                    501 ;	preemptive.c:215: else if (current_id == 1){
      00023B 74 01            [12]  502 	mov	a,#0x01
      00023D B5 34 32         [24]  503 	cjne	a,_current_id,00163$
                                    504 ;	preemptive.c:216: bitmap = bitmap - 2;
      000240 E5 35            [12]  505 	mov	a,_bitmap
      000242 FF               [12]  506 	mov	r7,a
      000243 24 FE            [12]  507 	add	a,#0xfe
      000245 F5 35            [12]  508 	mov	_bitmap,a
                                    509 ;	preemptive.c:217: do{ //??????exit?????????main?????????????????????????????????????????????main??????????????????????????????
      000247                        510 00126$:
                                    511 ;	preemptive.c:220: if (bitmap & 4){
      000247 E5 35            [12]  512 	mov	a,_bitmap
      000249 30 E2 06         [24]  513 	jnb	acc.2,00124$
                                    514 ;	preemptive.c:221: current_id = 2;
      00024C 75 34 02         [24]  515 	mov	_current_id,#0x02
                                    516 ;	preemptive.c:222: break;
      00024F 02 02 D8         [24]  517 	ljmp	00167$
      000252                        518 00124$:
                                    519 ;	preemptive.c:224: else if (bitmap & 8){
      000252 E5 35            [12]  520 	mov	a,_bitmap
      000254 30 E3 06         [24]  521 	jnb	acc.3,00121$
                                    522 ;	preemptive.c:225: current_id = 3;
      000257 75 34 03         [24]  523 	mov	_current_id,#0x03
                                    524 ;	preemptive.c:226: break;
      00025A 02 02 D8         [24]  525 	ljmp	00167$
      00025D                        526 00121$:
                                    527 ;	preemptive.c:228: else if (bitmap & 1){ //there is thread on id = 0
      00025D E5 35            [12]  528 	mov	a,_bitmap
      00025F 30 E0 06         [24]  529 	jnb	acc.0,00118$
                                    530 ;	preemptive.c:229: current_id = 0;//switch to thread id=0
      000262 75 34 00         [24]  531 	mov	_current_id,#0x00
                                    532 ;	preemptive.c:230: break;
      000265 02 02 D8         [24]  533 	ljmp	00167$
      000268                        534 00118$:
                                    535 ;	preemptive.c:232: else if (bitmap & 2){
      000268 E5 35            [12]  536 	mov	a,_bitmap
      00026A 30 E1 DA         [24]  537 	jnb	acc.1,00126$
                                    538 ;	preemptive.c:233: current_id = 1;
      00026D 75 34 01         [24]  539 	mov	_current_id,#0x01
                                    540 ;	preemptive.c:234: break;
                                    541 ;	preemptive.c:237: }while(1);//????????????thread??????????????????
      000270 80 66            [24]  542 	sjmp	00167$
      000272                        543 00163$:
                                    544 ;	preemptive.c:239: else if (current_id == 2){
      000272 74 02            [12]  545 	mov	a,#0x02
      000274 B5 34 2F         [24]  546 	cjne	a,_current_id,00160$
                                    547 ;	preemptive.c:240: bitmap = bitmap - 4;
      000277 E5 35            [12]  548 	mov	a,_bitmap
      000279 FF               [12]  549 	mov	r7,a
      00027A 24 FC            [12]  550 	add	a,#0xfc
      00027C F5 35            [12]  551 	mov	_bitmap,a
                                    552 ;	preemptive.c:241: do{ //??????exit?????????main?????????????????????????????????????????????main??????????????????????????????
      00027E                        553 00140$:
                                    554 ;	preemptive.c:243: if (bitmap & 8){
      00027E E5 35            [12]  555 	mov	a,_bitmap
      000280 30 E3 05         [24]  556 	jnb	acc.3,00138$
                                    557 ;	preemptive.c:244: current_id = 3;
      000283 75 34 03         [24]  558 	mov	_current_id,#0x03
                                    559 ;	preemptive.c:245: break;
      000286 80 50            [24]  560 	sjmp	00167$
      000288                        561 00138$:
                                    562 ;	preemptive.c:247: else if (bitmap & 1){ //there is thread on id = 0
      000288 E5 35            [12]  563 	mov	a,_bitmap
      00028A 30 E0 05         [24]  564 	jnb	acc.0,00135$
                                    565 ;	preemptive.c:248: current_id = 0;//switch to thread id=0
      00028D 75 34 00         [24]  566 	mov	_current_id,#0x00
                                    567 ;	preemptive.c:249: break;
      000290 80 46            [24]  568 	sjmp	00167$
      000292                        569 00135$:
                                    570 ;	preemptive.c:251: else if (bitmap & 2){
      000292 E5 35            [12]  571 	mov	a,_bitmap
      000294 30 E1 05         [24]  572 	jnb	acc.1,00132$
                                    573 ;	preemptive.c:252: current_id = 1;
      000297 75 34 01         [24]  574 	mov	_current_id,#0x01
                                    575 ;	preemptive.c:253: break;
      00029A 80 3C            [24]  576 	sjmp	00167$
      00029C                        577 00132$:
                                    578 ;	preemptive.c:255: else if (bitmap & 4){
      00029C E5 35            [12]  579 	mov	a,_bitmap
      00029E 30 E2 DD         [24]  580 	jnb	acc.2,00140$
                                    581 ;	preemptive.c:256: current_id = 2;
      0002A1 75 34 02         [24]  582 	mov	_current_id,#0x02
                                    583 ;	preemptive.c:257: break;
                                    584 ;	preemptive.c:260: }while(1);//????????????thread??????????????????
      0002A4 80 32            [24]  585 	sjmp	00167$
      0002A6                        586 00160$:
                                    587 ;	preemptive.c:262: else if (current_id == 3){
      0002A6 74 03            [12]  588 	mov	a,#0x03
      0002A8 B5 34 2D         [24]  589 	cjne	a,_current_id,00167$
                                    590 ;	preemptive.c:263: bitmap = bitmap - 8;
      0002AB E5 35            [12]  591 	mov	a,_bitmap
      0002AD FF               [12]  592 	mov	r7,a
      0002AE 24 F8            [12]  593 	add	a,#0xf8
      0002B0 F5 35            [12]  594 	mov	_bitmap,a
                                    595 ;	preemptive.c:264: do{ //??????exit?????????main?????????????????????????????????????????????main??????????????????????????????
      0002B2                        596 00154$:
                                    597 ;	preemptive.c:265: if (bitmap & 1){ //there is thread on id = 0
      0002B2 E5 35            [12]  598 	mov	a,_bitmap
      0002B4 30 E0 05         [24]  599 	jnb	acc.0,00152$
                                    600 ;	preemptive.c:266: current_id = 0;//switch to thread id=0
      0002B7 75 34 00         [24]  601 	mov	_current_id,#0x00
                                    602 ;	preemptive.c:267: break;
      0002BA 80 1C            [24]  603 	sjmp	00167$
      0002BC                        604 00152$:
                                    605 ;	preemptive.c:269: else if (bitmap & 2){
      0002BC E5 35            [12]  606 	mov	a,_bitmap
      0002BE 30 E1 05         [24]  607 	jnb	acc.1,00149$
                                    608 ;	preemptive.c:270: current_id = 1;
      0002C1 75 34 01         [24]  609 	mov	_current_id,#0x01
                                    610 ;	preemptive.c:271: break;
      0002C4 80 12            [24]  611 	sjmp	00167$
      0002C6                        612 00149$:
                                    613 ;	preemptive.c:273: else if (bitmap & 4){
      0002C6 E5 35            [12]  614 	mov	a,_bitmap
      0002C8 30 E2 05         [24]  615 	jnb	acc.2,00146$
                                    616 ;	preemptive.c:274: current_id = 2;
      0002CB 75 34 02         [24]  617 	mov	_current_id,#0x02
                                    618 ;	preemptive.c:275: break;
      0002CE 80 08            [24]  619 	sjmp	00167$
      0002D0                        620 00146$:
                                    621 ;	preemptive.c:277: else if (bitmap & 8){
      0002D0 E5 35            [12]  622 	mov	a,_bitmap
      0002D2 30 E3 DD         [24]  623 	jnb	acc.3,00154$
                                    624 ;	preemptive.c:278: current_id = 3;
      0002D5 75 34 03         [24]  625 	mov	_current_id,#0x03
                                    626 ;	preemptive.c:282: }while(1);//????????????thread??????????????????
      0002D8                        627 00167$:
                                    628 ;	preemptive.c:305: RESTORESTATE;
      0002D8 E5 34            [12]  629 	mov	a,_current_id
      0002DA 24 30            [12]  630 	add	a,#_stackP
      0002DC F9               [12]  631 	mov	r1,a
      0002DD 87 81            [24]  632 	mov	_SP,@r1
      0002DF D0 D0            [24]  633 	POP PSW 
      0002E1 D0 83            [24]  634 	POP DPH 
      0002E3 D0 82            [24]  635 	POP DPL 
      0002E5 D0 F0            [24]  636 	POP B 
      0002E7 D0 E0            [24]  637 	POP ACC 
                                    638 ;	preemptive.c:306: EA = 1;
                                    639 ;	assignBit
      0002E9 D2 AF            [12]  640 	setb	_EA
                                    641 ;	preemptive.c:307: }
      0002EB 22               [24]  642 	ret
                                    643 ;------------------------------------------------------------
                                    644 ;Allocation info for local variables in function 'myTimer0Handler'
                                    645 ;------------------------------------------------------------
                                    646 ;	preemptive.c:310: void myTimer0Handler(){
                                    647 ;	-----------------------------------------
                                    648 ;	 function myTimer0Handler
                                    649 ;	-----------------------------------------
      0002EC                        650 _myTimer0Handler:
                                    651 ;	preemptive.c:311: EA = 0;
                                    652 ;	assignBit
      0002EC C2 AF            [12]  653 	clr	_EA
                                    654 ;	preemptive.c:312: SAVESTATE;
      0002EE C0 E0            [24]  655 	PUSH ACC 
      0002F0 C0 F0            [24]  656 	PUSH B 
      0002F2 C0 82            [24]  657 	PUSH DPL 
      0002F4 C0 83            [24]  658 	PUSH DPH 
      0002F6 C0 D0            [24]  659 	PUSH PSW 
      0002F8 E5 34            [12]  660 	mov	a,_current_id
      0002FA 24 30            [12]  661 	add	a,#_stackP
      0002FC F8               [12]  662 	mov	r0,a
      0002FD A6 81            [24]  663 	mov	@r0,_SP
                                    664 ;	preemptive.c:330: __endasm;
      0002FF E8               [12]  665 	MOV	A, R0
      000300 C0 E0            [24]  666 	PUSH	ACC
      000302 E9               [12]  667 	MOV	A, R1
      000303 C0 E0            [24]  668 	PUSH	ACC
      000305 EA               [12]  669 	MOV	A, R2
      000306 C0 E0            [24]  670 	PUSH	ACC
      000308 EB               [12]  671 	MOV	A, R3
      000309 C0 E0            [24]  672 	PUSH	ACC
      00030B EC               [12]  673 	MOV	A, R4
      00030C C0 E0            [24]  674 	PUSH	ACC
      00030E ED               [12]  675 	MOV	A, R5
      00030F C0 E0            [24]  676 	PUSH	ACC
      000311 EE               [12]  677 	MOV	A, R6
      000312 C0 E0            [24]  678 	PUSH	ACC
      000314 EF               [12]  679 	MOV	A, R7
      000315 C0 E0            [24]  680 	PUSH	ACC
                                    681 ;	preemptive.c:331: time_unit = time_unit + 1; 
      000317 E5 38            [12]  682 	mov	a,_time_unit
      000319 FF               [12]  683 	mov	r7,a
      00031A 04               [12]  684 	inc	a
      00031B F5 38            [12]  685 	mov	_time_unit,a
                                    686 ;	preemptive.c:332: if (time_unit == 30) //???????????????????????????QQ
      00031D 74 1E            [12]  687 	mov	a,#0x1e
      00031F B5 38 09         [24]  688 	cjne	a,_time_unit,00125$
                                    689 ;	preemptive.c:334: time_unit = 0;
      000322 75 38 00         [24]  690 	mov	_time_unit,#0x00
                                    691 ;	preemptive.c:335: time = time + 1;
      000325 E5 39            [12]  692 	mov	a,_time
      000327 FF               [12]  693 	mov	r7,a
      000328 04               [12]  694 	inc	a
      000329 F5 39            [12]  695 	mov	_time,a
                                    696 ;	preemptive.c:338: do {
      00032B                        697 00125$:
                                    698 ;	preemptive.c:339: if(current_id==3) current_id=0;
      00032B 74 03            [12]  699 	mov	a,#0x03
      00032D B5 34 05         [24]  700 	cjne	a,_current_id,00104$
      000330 75 34 00         [24]  701 	mov	_current_id,#0x00
      000333 80 05            [24]  702 	sjmp	00105$
      000335                        703 00104$:
                                    704 ;	preemptive.c:340: else current_id++;
      000335 E5 34            [12]  705 	mov	a,_current_id
      000337 04               [12]  706 	inc	a
      000338 F5 34            [12]  707 	mov	_current_id,a
      00033A                        708 00105$:
                                    709 ;	preemptive.c:342: if (current_id == 0){ 
      00033A E5 34            [12]  710 	mov	a,_current_id
      00033C 70 07            [24]  711 	jnz	00123$
                                    712 ;	preemptive.c:343: if (bitmap & 1){ //there is thread in id = 0
      00033E E5 35            [12]  713 	mov	a,_bitmap
      000340 30 E0 E8         [24]  714 	jnb	acc.0,00125$
                                    715 ;	preemptive.c:344: break;
      000343 80 22            [24]  716 	sjmp	00127$
      000345                        717 00123$:
                                    718 ;	preemptive.c:347: else if (current_id == 1){
      000345 74 01            [12]  719 	mov	a,#0x01
      000347 B5 34 07         [24]  720 	cjne	a,_current_id,00120$
                                    721 ;	preemptive.c:348: if (bitmap & 2){
      00034A E5 35            [12]  722 	mov	a,_bitmap
      00034C 30 E1 DC         [24]  723 	jnb	acc.1,00125$
                                    724 ;	preemptive.c:349: break;
      00034F 80 16            [24]  725 	sjmp	00127$
      000351                        726 00120$:
                                    727 ;	preemptive.c:352: else if (current_id == 2){
      000351 74 02            [12]  728 	mov	a,#0x02
      000353 B5 34 07         [24]  729 	cjne	a,_current_id,00117$
                                    730 ;	preemptive.c:353: if (bitmap & 4){
      000356 E5 35            [12]  731 	mov	a,_bitmap
      000358 30 E2 D0         [24]  732 	jnb	acc.2,00125$
                                    733 ;	preemptive.c:354: break;
      00035B 80 0A            [24]  734 	sjmp	00127$
      00035D                        735 00117$:
                                    736 ;	preemptive.c:357: else if (current_id == 3){
      00035D 74 03            [12]  737 	mov	a,#0x03
      00035F B5 34 C9         [24]  738 	cjne	a,_current_id,00125$
                                    739 ;	preemptive.c:358: if (bitmap & 8){
      000362 E5 35            [12]  740 	mov	a,_bitmap
      000364 30 E3 C4         [24]  741 	jnb	acc.3,00125$
                                    742 ;	preemptive.c:363: } while (1);
      000367                        743 00127$:
                                    744 ;	preemptive.c:382: __endasm;
      000367 D0 E0            [24]  745 	POP	ACC
      000369 FF               [12]  746 	MOV	R7, A
      00036A D0 E0            [24]  747 	POP	ACC
      00036C FE               [12]  748 	MOV	R6, A
      00036D D0 E0            [24]  749 	POP	ACC
      00036F FD               [12]  750 	MOV	R5, A
      000370 D0 E0            [24]  751 	POP	ACC
      000372 FC               [12]  752 	MOV	R4, A
      000373 D0 E0            [24]  753 	POP	ACC
      000375 FB               [12]  754 	MOV	R3, A
      000376 D0 E0            [24]  755 	POP	ACC
      000378 FA               [12]  756 	MOV	R2, A
      000379 D0 E0            [24]  757 	POP	ACC
      00037B F9               [12]  758 	MOV	R1, A
      00037C D0 E0            [24]  759 	POP	ACC
      00037E F8               [12]  760 	MOV	R0, A
                                    761 ;	preemptive.c:384: RESTORESTATE;
      00037F E5 34            [12]  762 	mov	a,_current_id
      000381 24 30            [12]  763 	add	a,#_stackP
      000383 F9               [12]  764 	mov	r1,a
      000384 87 81            [24]  765 	mov	_SP,@r1
      000386 D0 D0            [24]  766 	POP PSW 
      000388 D0 83            [24]  767 	POP DPH 
      00038A D0 82            [24]  768 	POP DPL 
      00038C D0 F0            [24]  769 	POP B 
      00038E D0 E0            [24]  770 	POP ACC 
                                    771 ;	preemptive.c:386: EA = 1;
                                    772 ;	assignBit
      000390 D2 AF            [12]  773 	setb	_EA
                                    774 ;	preemptive.c:389: __endasm;
      000392 32               [24]  775 	RETI
                                    776 ;	preemptive.c:390: }
      000393 22               [24]  777 	ret
                                    778 ;------------------------------------------------------------
                                    779 ;Allocation info for local variables in function 'now'
                                    780 ;------------------------------------------------------------
                                    781 ;	preemptive.c:394: unsigned char now(void){
                                    782 ;	-----------------------------------------
                                    783 ;	 function now
                                    784 ;	-----------------------------------------
      000394                        785 _now:
                                    786 ;	preemptive.c:395: return time;
      000394 85 39 82         [24]  787 	mov	dpl,_time
                                    788 ;	preemptive.c:396: }
      000397 22               [24]  789 	ret
                                    790 	.area CSEG    (CODE)
                                    791 	.area CONST   (CODE)
                                    792 	.area XINIT   (CODE)
                                    793 	.area CABS    (ABS,CODE)
