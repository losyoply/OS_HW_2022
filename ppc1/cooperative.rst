                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.9.0 #11195 (MINGW32)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
                                      6 	.optsdcc -mmcs51 --model-small
                                      7 	
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _tmp_SP
                                    110 	.globl _final_id
                                    111 	.globl _bitmap
                                    112 	.globl _current_id
                                    113 	.globl _stackP
                                    114 	.globl _ThreadCreate
                                    115 	.globl _ThreadYield
                                    116 	.globl _ThreadExit
                                    117 ;--------------------------------------------------------
                                    118 ; special function registers
                                    119 ;--------------------------------------------------------
                                    120 	.area RSEG    (ABS,DATA)
      000000                        121 	.org 0x0000
                           000080   122 _P0	=	0x0080
                           000081   123 _SP	=	0x0081
                           000082   124 _DPL	=	0x0082
                           000083   125 _DPH	=	0x0083
                           000087   126 _PCON	=	0x0087
                           000088   127 _TCON	=	0x0088
                           000089   128 _TMOD	=	0x0089
                           00008A   129 _TL0	=	0x008a
                           00008B   130 _TL1	=	0x008b
                           00008C   131 _TH0	=	0x008c
                           00008D   132 _TH1	=	0x008d
                           000090   133 _P1	=	0x0090
                           000098   134 _SCON	=	0x0098
                           000099   135 _SBUF	=	0x0099
                           0000A0   136 _P2	=	0x00a0
                           0000A8   137 _IE	=	0x00a8
                           0000B0   138 _P3	=	0x00b0
                           0000B8   139 _IP	=	0x00b8
                           0000D0   140 _PSW	=	0x00d0
                           0000E0   141 _ACC	=	0x00e0
                           0000F0   142 _B	=	0x00f0
                                    143 ;--------------------------------------------------------
                                    144 ; special function bits
                                    145 ;--------------------------------------------------------
                                    146 	.area RSEG    (ABS,DATA)
      000000                        147 	.org 0x0000
                           000080   148 _P0_0	=	0x0080
                           000081   149 _P0_1	=	0x0081
                           000082   150 _P0_2	=	0x0082
                           000083   151 _P0_3	=	0x0083
                           000084   152 _P0_4	=	0x0084
                           000085   153 _P0_5	=	0x0085
                           000086   154 _P0_6	=	0x0086
                           000087   155 _P0_7	=	0x0087
                           000088   156 _IT0	=	0x0088
                           000089   157 _IE0	=	0x0089
                           00008A   158 _IT1	=	0x008a
                           00008B   159 _IE1	=	0x008b
                           00008C   160 _TR0	=	0x008c
                           00008D   161 _TF0	=	0x008d
                           00008E   162 _TR1	=	0x008e
                           00008F   163 _TF1	=	0x008f
                           000090   164 _P1_0	=	0x0090
                           000091   165 _P1_1	=	0x0091
                           000092   166 _P1_2	=	0x0092
                           000093   167 _P1_3	=	0x0093
                           000094   168 _P1_4	=	0x0094
                           000095   169 _P1_5	=	0x0095
                           000096   170 _P1_6	=	0x0096
                           000097   171 _P1_7	=	0x0097
                           000098   172 _RI	=	0x0098
                           000099   173 _TI	=	0x0099
                           00009A   174 _RB8	=	0x009a
                           00009B   175 _TB8	=	0x009b
                           00009C   176 _REN	=	0x009c
                           00009D   177 _SM2	=	0x009d
                           00009E   178 _SM1	=	0x009e
                           00009F   179 _SM0	=	0x009f
                           0000A0   180 _P2_0	=	0x00a0
                           0000A1   181 _P2_1	=	0x00a1
                           0000A2   182 _P2_2	=	0x00a2
                           0000A3   183 _P2_3	=	0x00a3
                           0000A4   184 _P2_4	=	0x00a4
                           0000A5   185 _P2_5	=	0x00a5
                           0000A6   186 _P2_6	=	0x00a6
                           0000A7   187 _P2_7	=	0x00a7
                           0000A8   188 _EX0	=	0x00a8
                           0000A9   189 _ET0	=	0x00a9
                           0000AA   190 _EX1	=	0x00aa
                           0000AB   191 _ET1	=	0x00ab
                           0000AC   192 _ES	=	0x00ac
                           0000AF   193 _EA	=	0x00af
                           0000B0   194 _P3_0	=	0x00b0
                           0000B1   195 _P3_1	=	0x00b1
                           0000B2   196 _P3_2	=	0x00b2
                           0000B3   197 _P3_3	=	0x00b3
                           0000B4   198 _P3_4	=	0x00b4
                           0000B5   199 _P3_5	=	0x00b5
                           0000B6   200 _P3_6	=	0x00b6
                           0000B7   201 _P3_7	=	0x00b7
                           0000B0   202 _RXD	=	0x00b0
                           0000B1   203 _TXD	=	0x00b1
                           0000B2   204 _INT0	=	0x00b2
                           0000B3   205 _INT1	=	0x00b3
                           0000B4   206 _T0	=	0x00b4
                           0000B5   207 _T1	=	0x00b5
                           0000B6   208 _WR	=	0x00b6
                           0000B7   209 _RD	=	0x00b7
                           0000B8   210 _PX0	=	0x00b8
                           0000B9   211 _PT0	=	0x00b9
                           0000BA   212 _PX1	=	0x00ba
                           0000BB   213 _PT1	=	0x00bb
                           0000BC   214 _PS	=	0x00bc
                           0000D0   215 _P	=	0x00d0
                           0000D1   216 _F1	=	0x00d1
                           0000D2   217 _OV	=	0x00d2
                           0000D3   218 _RS0	=	0x00d3
                           0000D4   219 _RS1	=	0x00d4
                           0000D5   220 _F0	=	0x00d5
                           0000D6   221 _AC	=	0x00d6
                           0000D7   222 _CY	=	0x00d7
                                    223 ;--------------------------------------------------------
                                    224 ; overlayable register banks
                                    225 ;--------------------------------------------------------
                                    226 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        227 	.ds 8
                                    228 ;--------------------------------------------------------
                                    229 ; internal ram data
                                    230 ;--------------------------------------------------------
                                    231 	.area DSEG    (DATA)
                           000030   232 _stackP	=	0x0030
                           000034   233 _current_id	=	0x0034
                           000035   234 _bitmap	=	0x0035
                           000036   235 _final_id	=	0x0036
                           000037   236 _tmp_SP	=	0x0037
                                    237 ;--------------------------------------------------------
                                    238 ; overlayable items in internal ram 
                                    239 ;--------------------------------------------------------
                                    240 	.area	OSEG    (OVR,DATA)
                                    241 ;--------------------------------------------------------
                                    242 ; indirectly addressable internal ram data
                                    243 ;--------------------------------------------------------
                                    244 	.area ISEG    (DATA)
                                    245 ;--------------------------------------------------------
                                    246 ; absolute internal ram data
                                    247 ;--------------------------------------------------------
                                    248 	.area IABS    (ABS,DATA)
                                    249 	.area IABS    (ABS,DATA)
                                    250 ;--------------------------------------------------------
                                    251 ; bit data
                                    252 ;--------------------------------------------------------
                                    253 	.area BSEG    (BIT)
                                    254 ;--------------------------------------------------------
                                    255 ; paged external ram data
                                    256 ;--------------------------------------------------------
                                    257 	.area PSEG    (PAG,XDATA)
                                    258 ;--------------------------------------------------------
                                    259 ; external ram data
                                    260 ;--------------------------------------------------------
                                    261 	.area XSEG    (XDATA)
                                    262 ;--------------------------------------------------------
                                    263 ; absolute external ram data
                                    264 ;--------------------------------------------------------
                                    265 	.area XABS    (ABS,XDATA)
                                    266 ;--------------------------------------------------------
                                    267 ; external initialized ram data
                                    268 ;--------------------------------------------------------
                                    269 	.area XISEG   (XDATA)
                                    270 	.area HOME    (CODE)
                                    271 	.area GSINIT0 (CODE)
                                    272 	.area GSINIT1 (CODE)
                                    273 	.area GSINIT2 (CODE)
                                    274 	.area GSINIT3 (CODE)
                                    275 	.area GSINIT4 (CODE)
                                    276 	.area GSINIT5 (CODE)
                                    277 	.area GSINIT  (CODE)
                                    278 	.area GSFINAL (CODE)
                                    279 	.area CSEG    (CODE)
                                    280 ;--------------------------------------------------------
                                    281 ; global & static initialisations
                                    282 ;--------------------------------------------------------
                                    283 	.area HOME    (CODE)
                                    284 	.area GSINIT  (CODE)
                                    285 	.area GSFINAL (CODE)
                                    286 	.area GSINIT  (CODE)
                                    287 ;--------------------------------------------------------
                                    288 ; Home
                                    289 ;--------------------------------------------------------
                                    290 	.area HOME    (CODE)
                                    291 	.area HOME    (CODE)
                                    292 ;--------------------------------------------------------
                                    293 ; code
                                    294 ;--------------------------------------------------------
                                    295 	.area CSEG    (CODE)
                                    296 ;------------------------------------------------------------
                                    297 ;Allocation info for local variables in function 'Bootstrap'
                                    298 ;------------------------------------------------------------
                                    299 ;	cooperative.c:42: void Bootstrap(void) {
                                    300 ;	-----------------------------------------
                                    301 ;	 function Bootstrap
                                    302 ;	-----------------------------------------
      000064                        303 _Bootstrap:
                           000007   304 	ar7 = 0x07
                           000006   305 	ar6 = 0x06
                           000005   306 	ar5 = 0x05
                           000004   307 	ar4 = 0x04
                           000003   308 	ar3 = 0x03
                           000002   309 	ar2 = 0x02
                           000001   310 	ar1 = 0x01
                           000000   311 	ar0 = 0x00
                                    312 ;	cooperative.c:45: bitmap = 0b0000;
      000064 75 35 00         [24]  313 	mov	_bitmap,#0x00
                                    314 ;	cooperative.c:46: current_id = ThreadCreate(main);
      000067 90 00 4B         [24]  315 	mov	dptr,#_main
      00006A 12 00 82         [24]  316 	lcall	_ThreadCreate
      00006D 85 82 34         [24]  317 	mov	_current_id,dpl
                                    318 ;	cooperative.c:47: RESTORESTATE;
      000070 E5 34            [12]  319 	mov	a,_current_id
      000072 24 30            [12]  320 	add	a,#_stackP
      000074 F9               [12]  321 	mov	r1,a
      000075 87 81            [24]  322 	mov	_SP,@r1
      000077 D0 D0            [24]  323 	POP PSW 
      000079 D0 83            [24]  324 	POP DPH 
      00007B D0 82            [24]  325 	POP DPL 
      00007D D0 F0            [24]  326 	POP B 
      00007F D0 E0            [24]  327 	POP ACC 
                                    328 ;	cooperative.c:49: }
      000081 22               [24]  329 	ret
                                    330 ;------------------------------------------------------------
                                    331 ;Allocation info for local variables in function 'ThreadCreate'
                                    332 ;------------------------------------------------------------
                                    333 ;fp                        Allocated to registers 
                                    334 ;------------------------------------------------------------
                                    335 ;	cooperative.c:52: ThreadID ThreadCreate(FunctionPtr fp) {
                                    336 ;	-----------------------------------------
                                    337 ;	 function ThreadCreate
                                    338 ;	-----------------------------------------
      000082                        339 _ThreadCreate:
                                    340 ;	cooperative.c:55: tmp_SP = SP;
      000082 85 81 37         [24]  341 	mov	_tmp_SP,_SP
                                    342 ;	cooperative.c:58: switch(bitmap){
      000085 AF 35            [24]  343 	mov	r7,_bitmap
      000087 BF 00 02         [24]  344 	cjne	r7,#0x00,00129$
      00008A 80 14            [24]  345 	sjmp	00101$
      00008C                        346 00129$:
      00008C BF 01 02         [24]  347 	cjne	r7,#0x01,00130$
      00008F 80 1A            [24]  348 	sjmp	00102$
      000091                        349 00130$:
      000091 BF 03 02         [24]  350 	cjne	r7,#0x03,00131$
      000094 80 20            [24]  351 	sjmp	00103$
      000096                        352 00131$:
      000096 BF 07 02         [24]  353 	cjne	r7,#0x07,00132$
      000099 80 26            [24]  354 	sjmp	00104$
      00009B                        355 00132$:
                                    356 ;	cooperative.c:59: case 0://0000
      00009B BF 0F 32         [24]  357 	cjne	r7,#0x0f,00106$
      00009E 80 2C            [24]  358 	sjmp	00105$
      0000A0                        359 00101$:
                                    360 ;	cooperative.c:60: final_id = 0;
      0000A0 75 36 00         [24]  361 	mov	_final_id,#0x00
                                    362 ;	cooperative.c:61: bitmap = 1;
      0000A3 75 35 01         [24]  363 	mov	_bitmap,#0x01
                                    364 ;	cooperative.c:62: SP = 0x3F;
      0000A6 75 81 3F         [24]  365 	mov	_SP,#0x3f
                                    366 ;	cooperative.c:63: break;
                                    367 ;	cooperative.c:64: case 1://0001
      0000A9 80 25            [24]  368 	sjmp	00106$
      0000AB                        369 00102$:
                                    370 ;	cooperative.c:65: final_id = 1;
      0000AB 75 36 01         [24]  371 	mov	_final_id,#0x01
                                    372 ;	cooperative.c:66: bitmap = 3;
      0000AE 75 35 03         [24]  373 	mov	_bitmap,#0x03
                                    374 ;	cooperative.c:67: SP = 0x4F;
      0000B1 75 81 4F         [24]  375 	mov	_SP,#0x4f
                                    376 ;	cooperative.c:68: break;
                                    377 ;	cooperative.c:69: case 3://0011
      0000B4 80 1A            [24]  378 	sjmp	00106$
      0000B6                        379 00103$:
                                    380 ;	cooperative.c:70: final_id = 2;
      0000B6 75 36 02         [24]  381 	mov	_final_id,#0x02
                                    382 ;	cooperative.c:71: bitmap = 7;
      0000B9 75 35 07         [24]  383 	mov	_bitmap,#0x07
                                    384 ;	cooperative.c:72: SP = 0x5F;
      0000BC 75 81 5F         [24]  385 	mov	_SP,#0x5f
                                    386 ;	cooperative.c:73: break;
                                    387 ;	cooperative.c:74: case 7://0111
      0000BF 80 0F            [24]  388 	sjmp	00106$
      0000C1                        389 00104$:
                                    390 ;	cooperative.c:75: final_id = 3;
      0000C1 75 36 03         [24]  391 	mov	_final_id,#0x03
                                    392 ;	cooperative.c:76: bitmap = 15;
      0000C4 75 35 0F         [24]  393 	mov	_bitmap,#0x0f
                                    394 ;	cooperative.c:77: SP = 0x6F;
      0000C7 75 81 6F         [24]  395 	mov	_SP,#0x6f
                                    396 ;	cooperative.c:78: break;
                                    397 ;	cooperative.c:79: case 15://1111
      0000CA 80 04            [24]  398 	sjmp	00106$
      0000CC                        399 00105$:
                                    400 ;	cooperative.c:80: return -1;
      0000CC 75 82 FF         [24]  401 	mov	dpl,#0xff
                                    402 ;	cooperative.c:81: }
      0000CF 22               [24]  403 	ret
      0000D0                        404 00106$:
                                    405 ;	cooperative.c:85: PSW = final_id << 3;// CY AC F0 RS1 RS0 OV UD P other are 0 except rs1 rs0
      0000D0 E5 36            [12]  406 	mov	a,_final_id
      0000D2 FF               [12]  407 	mov	r7,a
      0000D3 C4               [12]  408 	swap	a
      0000D4 03               [12]  409 	rr	a
      0000D5 54 F8            [12]  410 	anl	a,#0xf8
      0000D7 F5 D0            [12]  411 	mov	_PSW,a
                                    412 ;	cooperative.c:96: __endasm; 
      0000D9 C0 82            [24]  413 	PUSH	DPL
      0000DB C0 83            [24]  414 	PUSH	DPH
      0000DD 54 00            [12]  415 	ANL	A,#0
      0000DF C0 E0            [24]  416 	PUSH	ACC
      0000E1 C0 E0            [24]  417 	PUSH	ACC
      0000E3 C0 E0            [24]  418 	PUSH	ACC
      0000E5 C0 E0            [24]  419 	PUSH	ACC
      0000E7 C0 D0            [24]  420 	PUSH	PSW
                                    421 ;	cooperative.c:98: stackP[final_id] = SP;
      0000E9 E5 36            [12]  422 	mov	a,_final_id
      0000EB 24 30            [12]  423 	add	a,#_stackP
      0000ED F8               [12]  424 	mov	r0,a
      0000EE A6 81            [24]  425 	mov	@r0,_SP
                                    426 ;	cooperative.c:99: SP = tmp_SP;
      0000F0 85 37 81         [24]  427 	mov	_SP,_tmp_SP
                                    428 ;	cooperative.c:101: return final_id;
      0000F3 85 36 82         [24]  429 	mov	dpl,_final_id
                                    430 ;	cooperative.c:102: }
      0000F6 22               [24]  431 	ret
                                    432 ;------------------------------------------------------------
                                    433 ;Allocation info for local variables in function 'ThreadYield'
                                    434 ;------------------------------------------------------------
                                    435 ;	cooperative.c:106: void ThreadYield(void) {
                                    436 ;	-----------------------------------------
                                    437 ;	 function ThreadYield
                                    438 ;	-----------------------------------------
      0000F7                        439 _ThreadYield:
                                    440 ;	cooperative.c:107: SAVESTATE;
      0000F7 C0 E0            [24]  441 	PUSH ACC 
      0000F9 C0 F0            [24]  442 	PUSH B 
      0000FB C0 82            [24]  443 	PUSH DPL 
      0000FD C0 83            [24]  444 	PUSH DPH 
      0000FF C0 D0            [24]  445 	PUSH PSW 
      000101 E5 34            [12]  446 	mov	a,_current_id
      000103 24 30            [12]  447 	add	a,#_stackP
      000105 F8               [12]  448 	mov	r0,a
      000106 A6 81            [24]  449 	mov	@r0,_SP
                                    450 ;	cooperative.c:110: if(current_id==3) current_id=0;
      000108 74 03            [12]  451 	mov	a,#0x03
      00010A B5 34 05         [24]  452 	cjne	a,_current_id,00102$
      00010D 75 34 00         [24]  453 	mov	_current_id,#0x00
      000110 80 05            [24]  454 	sjmp	00103$
      000112                        455 00102$:
                                    456 ;	cooperative.c:111: else current_id++;
      000112 E5 34            [12]  457 	mov	a,_current_id
      000114 04               [12]  458 	inc	a
      000115 F5 34            [12]  459 	mov	_current_id,a
      000117                        460 00103$:
                                    461 ;	cooperative.c:113: if (bitmap == 1)
      000117 74 01            [12]  462 	mov	a,#0x01
      000119 B5 35 09         [24]  463 	cjne	a,_bitmap,00116$
                                    464 ;	cooperative.c:115: if (current_id > 0)
      00011C E5 34            [12]  465 	mov	a,_current_id
      00011E 60 23            [24]  466 	jz	00117$
                                    467 ;	cooperative.c:116: current_id = 0;
      000120 75 34 00         [24]  468 	mov	_current_id,#0x00
      000123 80 1E            [24]  469 	sjmp	00117$
      000125                        470 00116$:
                                    471 ;	cooperative.c:118: else if (bitmap == 3)
      000125 74 03            [12]  472 	mov	a,#0x03
      000127 B5 35 0B         [24]  473 	cjne	a,_bitmap,00113$
                                    474 ;	cooperative.c:120: if (current_id > 1)
      00012A E5 34            [12]  475 	mov	a,_current_id
      00012C 24 FE            [12]  476 	add	a,#0xff - 0x01
      00012E 50 13            [24]  477 	jnc	00117$
                                    478 ;	cooperative.c:121: current_id = 0;
      000130 75 34 00         [24]  479 	mov	_current_id,#0x00
      000133 80 0E            [24]  480 	sjmp	00117$
      000135                        481 00113$:
                                    482 ;	cooperative.c:123: else if (bitmap == 7)
      000135 74 07            [12]  483 	mov	a,#0x07
      000137 B5 35 09         [24]  484 	cjne	a,_bitmap,00117$
                                    485 ;	cooperative.c:125: if (current_id > 2)
      00013A E5 34            [12]  486 	mov	a,_current_id
      00013C 24 FD            [12]  487 	add	a,#0xff - 0x02
      00013E 50 03            [24]  488 	jnc	00117$
                                    489 ;	cooperative.c:126: current_id = 0;
      000140 75 34 00         [24]  490 	mov	_current_id,#0x00
      000143                        491 00117$:
                                    492 ;	cooperative.c:131: RESTORESTATE;
      000143 E5 34            [12]  493 	mov	a,_current_id
      000145 24 30            [12]  494 	add	a,#_stackP
      000147 F9               [12]  495 	mov	r1,a
      000148 87 81            [24]  496 	mov	_SP,@r1
      00014A D0 D0            [24]  497 	POP PSW 
      00014C D0 83            [24]  498 	POP DPH 
      00014E D0 82            [24]  499 	POP DPL 
      000150 D0 F0            [24]  500 	POP B 
      000152 D0 E0            [24]  501 	POP ACC 
                                    502 ;	cooperative.c:132: }
      000154 22               [24]  503 	ret
                                    504 ;------------------------------------------------------------
                                    505 ;Allocation info for local variables in function 'ThreadExit'
                                    506 ;------------------------------------------------------------
                                    507 ;	cooperative.c:134: void ThreadExit(void) {
                                    508 ;	-----------------------------------------
                                    509 ;	 function ThreadExit
                                    510 ;	-----------------------------------------
      000155                        511 _ThreadExit:
                                    512 ;	cooperative.c:136: RESTORESTATE;
      000155 E5 34            [12]  513 	mov	a,_current_id
      000157 24 30            [12]  514 	add	a,#_stackP
      000159 F9               [12]  515 	mov	r1,a
      00015A 87 81            [24]  516 	mov	_SP,@r1
      00015C D0 D0            [24]  517 	POP PSW 
      00015E D0 83            [24]  518 	POP DPH 
      000160 D0 82            [24]  519 	POP DPL 
      000162 D0 F0            [24]  520 	POP B 
      000164 D0 E0            [24]  521 	POP ACC 
                                    522 ;	cooperative.c:137: }
      000166 22               [24]  523 	ret
                                    524 	.area CSEG    (CODE)
                                    525 	.area CONST   (CODE)
                                    526 	.area XINIT   (CODE)
                                    527 	.area CABS    (ABS,CODE)
