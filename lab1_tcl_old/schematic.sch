# File saved with Nlview 7.0.21  2019-05-29 bk=1.5064 VDI=41 GEI=36 GUI=JA:9.0 non-TLS-threadsafe
# 
# non-default properties - (restore without -noprops)
property attrcolor #000000
property attrfontsize 8
property autobundle 1
property backgroundcolor #ffffff
property boxcolor0 #000000
property boxcolor1 #000000
property boxcolor2 #000000
property boxinstcolor #000000
property boxpincolor #000000
property buscolor #008000
property closeenough 5
property createnetattrdsp 2048
property decorate 1
property elidetext 40
property fillcolor1 #ffffcc
property fillcolor2 #dfebf8
property fillcolor3 #f0f0f0
property gatecellname 2
property instattrmax 30
property instdrag 15
property instorder 1
property marksize 12
property maxfontsize 15
property maxzoom 6.25
property netcolor #19b400
property objecthighlight0 #ff00ff
property objecthighlight1 #ffff00
property objecthighlight2 #00ff00
property objecthighlight3 #ff6666
property objecthighlight4 #0000ff
property objecthighlight5 #ffc800
property objecthighlight7 #00ffff
property objecthighlight8 #ff00ff
property objecthighlight9 #ccccff
property objecthighlight10 #0ead00
property objecthighlight11 #cefc00
property objecthighlight12 #9e2dbe
property objecthighlight13 #ba6a29
property objecthighlight14 #fc0188
property objecthighlight15 #02f990
property objecthighlight16 #f1b0fb
property objecthighlight17 #fec004
property objecthighlight18 #149bff
property objecthighlight19 #eb591b
property overlapcolor #19b400
property pbuscolor #000000
property pbusnamecolor #000000
property pinattrmax 20
property pinorder 2
property pinpermute 0
property portcolor #000000
property portnamecolor #000000
property ripindexfontsize 8
property rippercolor #000000
property rubberbandcolor #000000
property rubberbandfontsize 15
property selectattr 0
property selectionappearance 2
property selectioncolor #0000ff
property sheetheight 44
property sheetwidth 68
property showmarks 1
property shownetname 0
property showpagenumbers 1
property showripindex 4
property timelimit 1
#
module new demo_wrapper_nexys_a7 work:demo_wrapper_nexys_a7:NOFILE -nosplit
load symbol demo work:demo:NOFILE HIERBOX pin clk_i input.left pin rst_i input.left pinBus led_o output.right [15:0] pinBus sw_i input.left [15:0] boxcolor 1 fillcolor 2 minwidth 13%
load symbol RTL_ADD work RTL(+) pin I1 input.left pinBus I0 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_MUX work MUX pin S input.bot pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] pinBus O output.right [31:0] fillcolor 1
load symbol RTL_XOR work XOR pinBus I0 input [15:0] pinBus I1 input [15:0] pinBus O output [15:0] fillcolor 1
load symbol RTL_EQ work RTL(=) pin O output.right pinBus I0 input.left [31:0] pinBus I1 input.left [31:0] fillcolor 1
load symbol RTL_REG_ASYNC__BREG_1 work[31:0]ssww GEN pin C input.clk.left pin CLR input.top pinBus D input.left [31:0] pinBus Q output.right [31:0] fillcolor 1 sandwich 3 prop @bundle 32
load symbol RTL_REG_ASYNC__BREG_2 work[15:0]sswwww GEN pin C input.clk.left pin CE input.left pinBus CLR input.top [15:0] pinBus D input.left [15:0] pinBus PRE input.bot [15:0] pinBus Q output.right [15:0] fillcolor 1 sandwich 3 prop @bundle 16
load port BTNR input -pg 1 -lvl 0 -x -40 -y 80
load port CLK100MHZ input -pg 1 -lvl 0 -x -40 -y 50
load portBus LED output [15:0] -attr @name LED[15:0] -pg 1 -lvl 2 -x 270 -y 80
load portBus SW input [15:0] -attr @name SW[15:0] -pg 1 -lvl 0 -x -40 -y 110
load inst demo_inst demo work:demo:NOFILE -fold -autohide -attr @cell(#000000) demo -attr @fillcolor #dfebf8 -pinBusAttr led_o @name led_o[15:0] -pinBusAttr sw_i @name sw_i[15:0] -pg 1 -lvl 1 -x 110 -y 50
load inst demo_inst|clk_timer_ff0_i RTL_ADD work -hier demo_inst -attr @cell(#000000) RTL_ADD -attr @name clk_timer_ff0_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr O @name O[31:0] -pg 1 -lvl 1 -x 220 -y 98
load inst demo_inst|clk_timer_ff_i RTL_MUX work -hier demo_inst -attr @cell(#000000) RTL_MUX -attr @name clk_timer_ff_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I0 @attr S=1'b1 -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr S=default -pinBusAttr O @name O[31:0] -pg 1 -lvl 2 -x 490 -y 88
load inst demo_inst|led_o_i RTL_XOR work -hier demo_inst -attr @cell(#000000) RTL_XOR -attr @name led_o_i -pinBusAttr I0 @name I0[15:0] -pinBusAttr I1 @name I1[15:0] -pinBusAttr O @name O[15:0] -pg 1 -lvl 6 -x 1600 -y 308
load inst demo_inst|timer_tick_i RTL_EQ work -hier demo_inst -attr @cell(#000000) RTL_EQ -attr @name timer_tick_i -pinBusAttr I0 @name I0[31:0] -pinBusAttr I1 @name I1[31:0] -pinBusAttr I1 @attr V=X\"01312D00\" -pg 1 -lvl 4 -x 1140 -y 188
load inst demo_inst|clk_timer_ff_reg[31:0] RTL_REG_ASYNC__BREG_1 work[31:0]ssww -hier demo_inst -attr @cell(#000000) RTL_REG_ASYNC -attr @name clk_timer_ff_reg[31:0] -pg 1 -lvl 3 -x 720 -y 108
load inst demo_inst|led_reg_ff_reg[15:0] RTL_REG_ASYNC__BREG_2 work[15:0]sswwww -hier demo_inst -attr @cell(#000000) RTL_REG_ASYNC -attr @name led_reg_ff_reg[15:0] -pinBusAttr CLR @attr n/c -pg 1 -lvl 5 -x 1330 -y 138
load net BTNR -port BTNR -pin demo_inst rst_i
netloc BTNR 1 0 1 NJ 80
load net CLK100MHZ -port CLK100MHZ -pin demo_inst clk_i
netloc CLK100MHZ 1 0 1 -20J 50n
load net LED[0] -attr @rip led_o[0] -port LED[0] -pin demo_inst led_o[0]
load net LED[10] -attr @rip led_o[10] -port LED[10] -pin demo_inst led_o[10]
load net LED[11] -attr @rip led_o[11] -port LED[11] -pin demo_inst led_o[11]
load net LED[12] -attr @rip led_o[12] -port LED[12] -pin demo_inst led_o[12]
load net LED[13] -attr @rip led_o[13] -port LED[13] -pin demo_inst led_o[13]
load net LED[14] -attr @rip led_o[14] -port LED[14] -pin demo_inst led_o[14]
load net LED[15] -attr @rip led_o[15] -port LED[15] -pin demo_inst led_o[15]
load net LED[1] -attr @rip led_o[1] -port LED[1] -pin demo_inst led_o[1]
load net LED[2] -attr @rip led_o[2] -port LED[2] -pin demo_inst led_o[2]
load net LED[3] -attr @rip led_o[3] -port LED[3] -pin demo_inst led_o[3]
load net LED[4] -attr @rip led_o[4] -port LED[4] -pin demo_inst led_o[4]
load net LED[5] -attr @rip led_o[5] -port LED[5] -pin demo_inst led_o[5]
load net LED[6] -attr @rip led_o[6] -port LED[6] -pin demo_inst led_o[6]
load net LED[7] -attr @rip led_o[7] -port LED[7] -pin demo_inst led_o[7]
load net LED[8] -attr @rip led_o[8] -port LED[8] -pin demo_inst led_o[8]
load net LED[9] -attr @rip led_o[9] -port LED[9] -pin demo_inst led_o[9]
load net SW[0] -attr @rip SW[0] -port SW[0] -pin demo_inst sw_i[0]
load net SW[10] -attr @rip SW[10] -port SW[10] -pin demo_inst sw_i[10]
load net SW[11] -attr @rip SW[11] -port SW[11] -pin demo_inst sw_i[11]
load net SW[12] -attr @rip SW[12] -port SW[12] -pin demo_inst sw_i[12]
load net SW[13] -attr @rip SW[13] -port SW[13] -pin demo_inst sw_i[13]
load net SW[14] -attr @rip SW[14] -port SW[14] -pin demo_inst sw_i[14]
load net SW[15] -attr @rip SW[15] -port SW[15] -pin demo_inst sw_i[15]
load net SW[1] -attr @rip SW[1] -port SW[1] -pin demo_inst sw_i[1]
load net SW[2] -attr @rip SW[2] -port SW[2] -pin demo_inst sw_i[2]
load net SW[3] -attr @rip SW[3] -port SW[3] -pin demo_inst sw_i[3]
load net SW[4] -attr @rip SW[4] -port SW[4] -pin demo_inst sw_i[4]
load net SW[5] -attr @rip SW[5] -port SW[5] -pin demo_inst sw_i[5]
load net SW[6] -attr @rip SW[6] -port SW[6] -pin demo_inst sw_i[6]
load net SW[7] -attr @rip SW[7] -port SW[7] -pin demo_inst sw_i[7]
load net SW[8] -attr @rip SW[8] -port SW[8] -pin demo_inst sw_i[8]
load net SW[9] -attr @rip SW[9] -port SW[9] -pin demo_inst sw_i[9]
load net demo_inst|<const0> -ground -attr @name <const0> -pin demo_inst|clk_timer_ff_i I0[31] -pin demo_inst|clk_timer_ff_i I0[30] -pin demo_inst|clk_timer_ff_i I0[29] -pin demo_inst|clk_timer_ff_i I0[28] -pin demo_inst|clk_timer_ff_i I0[27] -pin demo_inst|clk_timer_ff_i I0[26] -pin demo_inst|clk_timer_ff_i I0[25] -pin demo_inst|clk_timer_ff_i I0[24] -pin demo_inst|clk_timer_ff_i I0[23] -pin demo_inst|clk_timer_ff_i I0[22] -pin demo_inst|clk_timer_ff_i I0[21] -pin demo_inst|clk_timer_ff_i I0[20] -pin demo_inst|clk_timer_ff_i I0[19] -pin demo_inst|clk_timer_ff_i I0[18] -pin demo_inst|clk_timer_ff_i I0[17] -pin demo_inst|clk_timer_ff_i I0[16] -pin demo_inst|clk_timer_ff_i I0[15] -pin demo_inst|clk_timer_ff_i I0[14] -pin demo_inst|clk_timer_ff_i I0[13] -pin demo_inst|clk_timer_ff_i I0[12] -pin demo_inst|clk_timer_ff_i I0[11] -pin demo_inst|clk_timer_ff_i I0[10] -pin demo_inst|clk_timer_ff_i I0[9] -pin demo_inst|clk_timer_ff_i I0[8] -pin demo_inst|clk_timer_ff_i I0[7] -pin demo_inst|clk_timer_ff_i I0[6] -pin demo_inst|clk_timer_ff_i I0[5] -pin demo_inst|clk_timer_ff_i I0[4] -pin demo_inst|clk_timer_ff_i I0[3] -pin demo_inst|clk_timer_ff_i I0[2] -pin demo_inst|clk_timer_ff_i I0[1] -pin demo_inst|clk_timer_ff_i I0[0] -pin demo_inst|timer_tick_i I1[31] -pin demo_inst|timer_tick_i I1[30] -pin demo_inst|timer_tick_i I1[29] -pin demo_inst|timer_tick_i I1[28] -pin demo_inst|timer_tick_i I1[27] -pin demo_inst|timer_tick_i I1[26] -pin demo_inst|timer_tick_i I1[25] -pin demo_inst|timer_tick_i I1[23] -pin demo_inst|timer_tick_i I1[22] -pin demo_inst|timer_tick_i I1[19] -pin demo_inst|timer_tick_i I1[18] -pin demo_inst|timer_tick_i I1[17] -pin demo_inst|timer_tick_i I1[15] -pin demo_inst|timer_tick_i I1[14] -pin demo_inst|timer_tick_i I1[12] -pin demo_inst|timer_tick_i I1[9] -pin demo_inst|timer_tick_i I1[7] -pin demo_inst|timer_tick_i I1[6] -pin demo_inst|timer_tick_i I1[5] -pin demo_inst|timer_tick_i I1[4] -pin demo_inst|timer_tick_i I1[3] -pin demo_inst|timer_tick_i I1[2] -pin demo_inst|timer_tick_i I1[1] -pin demo_inst|timer_tick_i I1[0]
load net demo_inst|<const1> -power -attr @name <const1> -pin demo_inst|clk_timer_ff0_i I1 -pin demo_inst|timer_tick_i I1[24] -pin demo_inst|timer_tick_i I1[21] -pin demo_inst|timer_tick_i I1[20] -pin demo_inst|timer_tick_i I1[16] -pin demo_inst|timer_tick_i I1[13] -pin demo_inst|timer_tick_i I1[11] -pin demo_inst|timer_tick_i I1[10] -pin demo_inst|timer_tick_i I1[8]
load net demo_inst|clk_i -attr @name clk_i -hierPin demo_inst clk_i -pin demo_inst|clk_timer_ff_reg[31:0] C -pin demo_inst|led_reg_ff_reg[15:0] C
netloc demo_inst|clk_i 1 0 5 NJ 198 NJ 198 670 198 940J 118 NJ
load net demo_inst|clk_timer_ff0[0] -attr @rip O[0] -attr @name clk_timer_ff0[0] -pin demo_inst|clk_timer_ff0_i O[0] -pin demo_inst|clk_timer_ff_i I1[0]
load net demo_inst|clk_timer_ff0[10] -attr @rip O[10] -attr @name clk_timer_ff0[10] -pin demo_inst|clk_timer_ff0_i O[10] -pin demo_inst|clk_timer_ff_i I1[10]
load net demo_inst|clk_timer_ff0[11] -attr @rip O[11] -attr @name clk_timer_ff0[11] -pin demo_inst|clk_timer_ff0_i O[11] -pin demo_inst|clk_timer_ff_i I1[11]
load net demo_inst|clk_timer_ff0[12] -attr @rip O[12] -attr @name clk_timer_ff0[12] -pin demo_inst|clk_timer_ff0_i O[12] -pin demo_inst|clk_timer_ff_i I1[12]
load net demo_inst|clk_timer_ff0[13] -attr @rip O[13] -attr @name clk_timer_ff0[13] -pin demo_inst|clk_timer_ff0_i O[13] -pin demo_inst|clk_timer_ff_i I1[13]
load net demo_inst|clk_timer_ff0[14] -attr @rip O[14] -attr @name clk_timer_ff0[14] -pin demo_inst|clk_timer_ff0_i O[14] -pin demo_inst|clk_timer_ff_i I1[14]
load net demo_inst|clk_timer_ff0[15] -attr @rip O[15] -attr @name clk_timer_ff0[15] -pin demo_inst|clk_timer_ff0_i O[15] -pin demo_inst|clk_timer_ff_i I1[15]
load net demo_inst|clk_timer_ff0[16] -attr @rip O[16] -attr @name clk_timer_ff0[16] -pin demo_inst|clk_timer_ff0_i O[16] -pin demo_inst|clk_timer_ff_i I1[16]
load net demo_inst|clk_timer_ff0[17] -attr @rip O[17] -attr @name clk_timer_ff0[17] -pin demo_inst|clk_timer_ff0_i O[17] -pin demo_inst|clk_timer_ff_i I1[17]
load net demo_inst|clk_timer_ff0[18] -attr @rip O[18] -attr @name clk_timer_ff0[18] -pin demo_inst|clk_timer_ff0_i O[18] -pin demo_inst|clk_timer_ff_i I1[18]
load net demo_inst|clk_timer_ff0[19] -attr @rip O[19] -attr @name clk_timer_ff0[19] -pin demo_inst|clk_timer_ff0_i O[19] -pin demo_inst|clk_timer_ff_i I1[19]
load net demo_inst|clk_timer_ff0[1] -attr @rip O[1] -attr @name clk_timer_ff0[1] -pin demo_inst|clk_timer_ff0_i O[1] -pin demo_inst|clk_timer_ff_i I1[1]
load net demo_inst|clk_timer_ff0[20] -attr @rip O[20] -attr @name clk_timer_ff0[20] -pin demo_inst|clk_timer_ff0_i O[20] -pin demo_inst|clk_timer_ff_i I1[20]
load net demo_inst|clk_timer_ff0[21] -attr @rip O[21] -attr @name clk_timer_ff0[21] -pin demo_inst|clk_timer_ff0_i O[21] -pin demo_inst|clk_timer_ff_i I1[21]
load net demo_inst|clk_timer_ff0[22] -attr @rip O[22] -attr @name clk_timer_ff0[22] -pin demo_inst|clk_timer_ff0_i O[22] -pin demo_inst|clk_timer_ff_i I1[22]
load net demo_inst|clk_timer_ff0[23] -attr @rip O[23] -attr @name clk_timer_ff0[23] -pin demo_inst|clk_timer_ff0_i O[23] -pin demo_inst|clk_timer_ff_i I1[23]
load net demo_inst|clk_timer_ff0[24] -attr @rip O[24] -attr @name clk_timer_ff0[24] -pin demo_inst|clk_timer_ff0_i O[24] -pin demo_inst|clk_timer_ff_i I1[24]
load net demo_inst|clk_timer_ff0[25] -attr @rip O[25] -attr @name clk_timer_ff0[25] -pin demo_inst|clk_timer_ff0_i O[25] -pin demo_inst|clk_timer_ff_i I1[25]
load net demo_inst|clk_timer_ff0[26] -attr @rip O[26] -attr @name clk_timer_ff0[26] -pin demo_inst|clk_timer_ff0_i O[26] -pin demo_inst|clk_timer_ff_i I1[26]
load net demo_inst|clk_timer_ff0[27] -attr @rip O[27] -attr @name clk_timer_ff0[27] -pin demo_inst|clk_timer_ff0_i O[27] -pin demo_inst|clk_timer_ff_i I1[27]
load net demo_inst|clk_timer_ff0[28] -attr @rip O[28] -attr @name clk_timer_ff0[28] -pin demo_inst|clk_timer_ff0_i O[28] -pin demo_inst|clk_timer_ff_i I1[28]
load net demo_inst|clk_timer_ff0[29] -attr @rip O[29] -attr @name clk_timer_ff0[29] -pin demo_inst|clk_timer_ff0_i O[29] -pin demo_inst|clk_timer_ff_i I1[29]
load net demo_inst|clk_timer_ff0[2] -attr @rip O[2] -attr @name clk_timer_ff0[2] -pin demo_inst|clk_timer_ff0_i O[2] -pin demo_inst|clk_timer_ff_i I1[2]
load net demo_inst|clk_timer_ff0[30] -attr @rip O[30] -attr @name clk_timer_ff0[30] -pin demo_inst|clk_timer_ff0_i O[30] -pin demo_inst|clk_timer_ff_i I1[30]
load net demo_inst|clk_timer_ff0[31] -attr @rip O[31] -attr @name clk_timer_ff0[31] -pin demo_inst|clk_timer_ff0_i O[31] -pin demo_inst|clk_timer_ff_i I1[31]
load net demo_inst|clk_timer_ff0[3] -attr @rip O[3] -attr @name clk_timer_ff0[3] -pin demo_inst|clk_timer_ff0_i O[3] -pin demo_inst|clk_timer_ff_i I1[3]
load net demo_inst|clk_timer_ff0[4] -attr @rip O[4] -attr @name clk_timer_ff0[4] -pin demo_inst|clk_timer_ff0_i O[4] -pin demo_inst|clk_timer_ff_i I1[4]
load net demo_inst|clk_timer_ff0[5] -attr @rip O[5] -attr @name clk_timer_ff0[5] -pin demo_inst|clk_timer_ff0_i O[5] -pin demo_inst|clk_timer_ff_i I1[5]
load net demo_inst|clk_timer_ff0[6] -attr @rip O[6] -attr @name clk_timer_ff0[6] -pin demo_inst|clk_timer_ff0_i O[6] -pin demo_inst|clk_timer_ff_i I1[6]
load net demo_inst|clk_timer_ff0[7] -attr @rip O[7] -attr @name clk_timer_ff0[7] -pin demo_inst|clk_timer_ff0_i O[7] -pin demo_inst|clk_timer_ff_i I1[7]
load net demo_inst|clk_timer_ff0[8] -attr @rip O[8] -attr @name clk_timer_ff0[8] -pin demo_inst|clk_timer_ff0_i O[8] -pin demo_inst|clk_timer_ff_i I1[8]
load net demo_inst|clk_timer_ff0[9] -attr @rip O[9] -attr @name clk_timer_ff0[9] -pin demo_inst|clk_timer_ff0_i O[9] -pin demo_inst|clk_timer_ff_i I1[9]
load net demo_inst|clk_timer_ff[0] -attr @rip 0 -attr @name clk_timer_ff[0] -pin demo_inst|clk_timer_ff0_i I0[0] -pin demo_inst|clk_timer_ff_reg[31:0] Q[0] -pin demo_inst|timer_tick_i I0[0]
load net demo_inst|clk_timer_ff[10] -attr @rip 10 -attr @name clk_timer_ff[10] -pin demo_inst|clk_timer_ff0_i I0[10] -pin demo_inst|clk_timer_ff_reg[31:0] Q[10] -pin demo_inst|timer_tick_i I0[10]
load net demo_inst|clk_timer_ff[11] -attr @rip 11 -attr @name clk_timer_ff[11] -pin demo_inst|clk_timer_ff0_i I0[11] -pin demo_inst|clk_timer_ff_reg[31:0] Q[11] -pin demo_inst|timer_tick_i I0[11]
load net demo_inst|clk_timer_ff[12] -attr @rip 12 -attr @name clk_timer_ff[12] -pin demo_inst|clk_timer_ff0_i I0[12] -pin demo_inst|clk_timer_ff_reg[31:0] Q[12] -pin demo_inst|timer_tick_i I0[12]
load net demo_inst|clk_timer_ff[13] -attr @rip 13 -attr @name clk_timer_ff[13] -pin demo_inst|clk_timer_ff0_i I0[13] -pin demo_inst|clk_timer_ff_reg[31:0] Q[13] -pin demo_inst|timer_tick_i I0[13]
load net demo_inst|clk_timer_ff[14] -attr @rip 14 -attr @name clk_timer_ff[14] -pin demo_inst|clk_timer_ff0_i I0[14] -pin demo_inst|clk_timer_ff_reg[31:0] Q[14] -pin demo_inst|timer_tick_i I0[14]
load net demo_inst|clk_timer_ff[15] -attr @rip 15 -attr @name clk_timer_ff[15] -pin demo_inst|clk_timer_ff0_i I0[15] -pin demo_inst|clk_timer_ff_reg[31:0] Q[15] -pin demo_inst|timer_tick_i I0[15]
load net demo_inst|clk_timer_ff[16] -attr @rip 16 -attr @name clk_timer_ff[16] -pin demo_inst|clk_timer_ff0_i I0[16] -pin demo_inst|clk_timer_ff_reg[31:0] Q[16] -pin demo_inst|timer_tick_i I0[16]
load net demo_inst|clk_timer_ff[17] -attr @rip 17 -attr @name clk_timer_ff[17] -pin demo_inst|clk_timer_ff0_i I0[17] -pin demo_inst|clk_timer_ff_reg[31:0] Q[17] -pin demo_inst|timer_tick_i I0[17]
load net demo_inst|clk_timer_ff[18] -attr @rip 18 -attr @name clk_timer_ff[18] -pin demo_inst|clk_timer_ff0_i I0[18] -pin demo_inst|clk_timer_ff_reg[31:0] Q[18] -pin demo_inst|timer_tick_i I0[18]
load net demo_inst|clk_timer_ff[19] -attr @rip 19 -attr @name clk_timer_ff[19] -pin demo_inst|clk_timer_ff0_i I0[19] -pin demo_inst|clk_timer_ff_reg[31:0] Q[19] -pin demo_inst|timer_tick_i I0[19]
load net demo_inst|clk_timer_ff[1] -attr @rip 1 -attr @name clk_timer_ff[1] -pin demo_inst|clk_timer_ff0_i I0[1] -pin demo_inst|clk_timer_ff_reg[31:0] Q[1] -pin demo_inst|timer_tick_i I0[1]
load net demo_inst|clk_timer_ff[20] -attr @rip 20 -attr @name clk_timer_ff[20] -pin demo_inst|clk_timer_ff0_i I0[20] -pin demo_inst|clk_timer_ff_reg[31:0] Q[20] -pin demo_inst|timer_tick_i I0[20]
load net demo_inst|clk_timer_ff[21] -attr @rip 21 -attr @name clk_timer_ff[21] -pin demo_inst|clk_timer_ff0_i I0[21] -pin demo_inst|clk_timer_ff_reg[31:0] Q[21] -pin demo_inst|timer_tick_i I0[21]
load net demo_inst|clk_timer_ff[22] -attr @rip 22 -attr @name clk_timer_ff[22] -pin demo_inst|clk_timer_ff0_i I0[22] -pin demo_inst|clk_timer_ff_reg[31:0] Q[22] -pin demo_inst|timer_tick_i I0[22]
load net demo_inst|clk_timer_ff[23] -attr @rip 23 -attr @name clk_timer_ff[23] -pin demo_inst|clk_timer_ff0_i I0[23] -pin demo_inst|clk_timer_ff_reg[31:0] Q[23] -pin demo_inst|timer_tick_i I0[23]
load net demo_inst|clk_timer_ff[24] -attr @rip 24 -attr @name clk_timer_ff[24] -pin demo_inst|clk_timer_ff0_i I0[24] -pin demo_inst|clk_timer_ff_reg[31:0] Q[24] -pin demo_inst|timer_tick_i I0[24]
load net demo_inst|clk_timer_ff[25] -attr @rip 25 -attr @name clk_timer_ff[25] -pin demo_inst|clk_timer_ff0_i I0[25] -pin demo_inst|clk_timer_ff_reg[31:0] Q[25] -pin demo_inst|timer_tick_i I0[25]
load net demo_inst|clk_timer_ff[26] -attr @rip 26 -attr @name clk_timer_ff[26] -pin demo_inst|clk_timer_ff0_i I0[26] -pin demo_inst|clk_timer_ff_reg[31:0] Q[26] -pin demo_inst|timer_tick_i I0[26]
load net demo_inst|clk_timer_ff[27] -attr @rip 27 -attr @name clk_timer_ff[27] -pin demo_inst|clk_timer_ff0_i I0[27] -pin demo_inst|clk_timer_ff_reg[31:0] Q[27] -pin demo_inst|timer_tick_i I0[27]
load net demo_inst|clk_timer_ff[28] -attr @rip 28 -attr @name clk_timer_ff[28] -pin demo_inst|clk_timer_ff0_i I0[28] -pin demo_inst|clk_timer_ff_reg[31:0] Q[28] -pin demo_inst|timer_tick_i I0[28]
load net demo_inst|clk_timer_ff[29] -attr @rip 29 -attr @name clk_timer_ff[29] -pin demo_inst|clk_timer_ff0_i I0[29] -pin demo_inst|clk_timer_ff_reg[31:0] Q[29] -pin demo_inst|timer_tick_i I0[29]
load net demo_inst|clk_timer_ff[2] -attr @rip 2 -attr @name clk_timer_ff[2] -pin demo_inst|clk_timer_ff0_i I0[2] -pin demo_inst|clk_timer_ff_reg[31:0] Q[2] -pin demo_inst|timer_tick_i I0[2]
load net demo_inst|clk_timer_ff[30] -attr @rip 30 -attr @name clk_timer_ff[30] -pin demo_inst|clk_timer_ff0_i I0[30] -pin demo_inst|clk_timer_ff_reg[31:0] Q[30] -pin demo_inst|timer_tick_i I0[30]
load net demo_inst|clk_timer_ff[31] -attr @rip 31 -attr @name clk_timer_ff[31] -pin demo_inst|clk_timer_ff0_i I0[31] -pin demo_inst|clk_timer_ff_reg[31:0] Q[31] -pin demo_inst|timer_tick_i I0[31]
load net demo_inst|clk_timer_ff[3] -attr @rip 3 -attr @name clk_timer_ff[3] -pin demo_inst|clk_timer_ff0_i I0[3] -pin demo_inst|clk_timer_ff_reg[31:0] Q[3] -pin demo_inst|timer_tick_i I0[3]
load net demo_inst|clk_timer_ff[4] -attr @rip 4 -attr @name clk_timer_ff[4] -pin demo_inst|clk_timer_ff0_i I0[4] -pin demo_inst|clk_timer_ff_reg[31:0] Q[4] -pin demo_inst|timer_tick_i I0[4]
load net demo_inst|clk_timer_ff[5] -attr @rip 5 -attr @name clk_timer_ff[5] -pin demo_inst|clk_timer_ff0_i I0[5] -pin demo_inst|clk_timer_ff_reg[31:0] Q[5] -pin demo_inst|timer_tick_i I0[5]
load net demo_inst|clk_timer_ff[6] -attr @rip 6 -attr @name clk_timer_ff[6] -pin demo_inst|clk_timer_ff0_i I0[6] -pin demo_inst|clk_timer_ff_reg[31:0] Q[6] -pin demo_inst|timer_tick_i I0[6]
load net demo_inst|clk_timer_ff[7] -attr @rip 7 -attr @name clk_timer_ff[7] -pin demo_inst|clk_timer_ff0_i I0[7] -pin demo_inst|clk_timer_ff_reg[31:0] Q[7] -pin demo_inst|timer_tick_i I0[7]
load net demo_inst|clk_timer_ff[8] -attr @rip 8 -attr @name clk_timer_ff[8] -pin demo_inst|clk_timer_ff0_i I0[8] -pin demo_inst|clk_timer_ff_reg[31:0] Q[8] -pin demo_inst|timer_tick_i I0[8]
load net demo_inst|clk_timer_ff[9] -attr @rip 9 -attr @name clk_timer_ff[9] -pin demo_inst|clk_timer_ff0_i I0[9] -pin demo_inst|clk_timer_ff_reg[31:0] Q[9] -pin demo_inst|timer_tick_i I0[9]
load net demo_inst|clk_timer_ff__0[0] -attr @rip O[0] -attr @name clk_timer_ff__0[0] -pin demo_inst|clk_timer_ff_i O[0] -pin demo_inst|clk_timer_ff_reg[31:0] D[0]
load net demo_inst|clk_timer_ff__0[10] -attr @rip O[10] -attr @name clk_timer_ff__0[10] -pin demo_inst|clk_timer_ff_i O[10] -pin demo_inst|clk_timer_ff_reg[31:0] D[10]
load net demo_inst|clk_timer_ff__0[11] -attr @rip O[11] -attr @name clk_timer_ff__0[11] -pin demo_inst|clk_timer_ff_i O[11] -pin demo_inst|clk_timer_ff_reg[31:0] D[11]
load net demo_inst|clk_timer_ff__0[12] -attr @rip O[12] -attr @name clk_timer_ff__0[12] -pin demo_inst|clk_timer_ff_i O[12] -pin demo_inst|clk_timer_ff_reg[31:0] D[12]
load net demo_inst|clk_timer_ff__0[13] -attr @rip O[13] -attr @name clk_timer_ff__0[13] -pin demo_inst|clk_timer_ff_i O[13] -pin demo_inst|clk_timer_ff_reg[31:0] D[13]
load net demo_inst|clk_timer_ff__0[14] -attr @rip O[14] -attr @name clk_timer_ff__0[14] -pin demo_inst|clk_timer_ff_i O[14] -pin demo_inst|clk_timer_ff_reg[31:0] D[14]
load net demo_inst|clk_timer_ff__0[15] -attr @rip O[15] -attr @name clk_timer_ff__0[15] -pin demo_inst|clk_timer_ff_i O[15] -pin demo_inst|clk_timer_ff_reg[31:0] D[15]
load net demo_inst|clk_timer_ff__0[16] -attr @rip O[16] -attr @name clk_timer_ff__0[16] -pin demo_inst|clk_timer_ff_i O[16] -pin demo_inst|clk_timer_ff_reg[31:0] D[16]
load net demo_inst|clk_timer_ff__0[17] -attr @rip O[17] -attr @name clk_timer_ff__0[17] -pin demo_inst|clk_timer_ff_i O[17] -pin demo_inst|clk_timer_ff_reg[31:0] D[17]
load net demo_inst|clk_timer_ff__0[18] -attr @rip O[18] -attr @name clk_timer_ff__0[18] -pin demo_inst|clk_timer_ff_i O[18] -pin demo_inst|clk_timer_ff_reg[31:0] D[18]
load net demo_inst|clk_timer_ff__0[19] -attr @rip O[19] -attr @name clk_timer_ff__0[19] -pin demo_inst|clk_timer_ff_i O[19] -pin demo_inst|clk_timer_ff_reg[31:0] D[19]
load net demo_inst|clk_timer_ff__0[1] -attr @rip O[1] -attr @name clk_timer_ff__0[1] -pin demo_inst|clk_timer_ff_i O[1] -pin demo_inst|clk_timer_ff_reg[31:0] D[1]
load net demo_inst|clk_timer_ff__0[20] -attr @rip O[20] -attr @name clk_timer_ff__0[20] -pin demo_inst|clk_timer_ff_i O[20] -pin demo_inst|clk_timer_ff_reg[31:0] D[20]
load net demo_inst|clk_timer_ff__0[21] -attr @rip O[21] -attr @name clk_timer_ff__0[21] -pin demo_inst|clk_timer_ff_i O[21] -pin demo_inst|clk_timer_ff_reg[31:0] D[21]
load net demo_inst|clk_timer_ff__0[22] -attr @rip O[22] -attr @name clk_timer_ff__0[22] -pin demo_inst|clk_timer_ff_i O[22] -pin demo_inst|clk_timer_ff_reg[31:0] D[22]
load net demo_inst|clk_timer_ff__0[23] -attr @rip O[23] -attr @name clk_timer_ff__0[23] -pin demo_inst|clk_timer_ff_i O[23] -pin demo_inst|clk_timer_ff_reg[31:0] D[23]
load net demo_inst|clk_timer_ff__0[24] -attr @rip O[24] -attr @name clk_timer_ff__0[24] -pin demo_inst|clk_timer_ff_i O[24] -pin demo_inst|clk_timer_ff_reg[31:0] D[24]
load net demo_inst|clk_timer_ff__0[25] -attr @rip O[25] -attr @name clk_timer_ff__0[25] -pin demo_inst|clk_timer_ff_i O[25] -pin demo_inst|clk_timer_ff_reg[31:0] D[25]
load net demo_inst|clk_timer_ff__0[26] -attr @rip O[26] -attr @name clk_timer_ff__0[26] -pin demo_inst|clk_timer_ff_i O[26] -pin demo_inst|clk_timer_ff_reg[31:0] D[26]
load net demo_inst|clk_timer_ff__0[27] -attr @rip O[27] -attr @name clk_timer_ff__0[27] -pin demo_inst|clk_timer_ff_i O[27] -pin demo_inst|clk_timer_ff_reg[31:0] D[27]
load net demo_inst|clk_timer_ff__0[28] -attr @rip O[28] -attr @name clk_timer_ff__0[28] -pin demo_inst|clk_timer_ff_i O[28] -pin demo_inst|clk_timer_ff_reg[31:0] D[28]
load net demo_inst|clk_timer_ff__0[29] -attr @rip O[29] -attr @name clk_timer_ff__0[29] -pin demo_inst|clk_timer_ff_i O[29] -pin demo_inst|clk_timer_ff_reg[31:0] D[29]
load net demo_inst|clk_timer_ff__0[2] -attr @rip O[2] -attr @name clk_timer_ff__0[2] -pin demo_inst|clk_timer_ff_i O[2] -pin demo_inst|clk_timer_ff_reg[31:0] D[2]
load net demo_inst|clk_timer_ff__0[30] -attr @rip O[30] -attr @name clk_timer_ff__0[30] -pin demo_inst|clk_timer_ff_i O[30] -pin demo_inst|clk_timer_ff_reg[31:0] D[30]
load net demo_inst|clk_timer_ff__0[31] -attr @rip O[31] -attr @name clk_timer_ff__0[31] -pin demo_inst|clk_timer_ff_i O[31] -pin demo_inst|clk_timer_ff_reg[31:0] D[31]
load net demo_inst|clk_timer_ff__0[3] -attr @rip O[3] -attr @name clk_timer_ff__0[3] -pin demo_inst|clk_timer_ff_i O[3] -pin demo_inst|clk_timer_ff_reg[31:0] D[3]
load net demo_inst|clk_timer_ff__0[4] -attr @rip O[4] -attr @name clk_timer_ff__0[4] -pin demo_inst|clk_timer_ff_i O[4] -pin demo_inst|clk_timer_ff_reg[31:0] D[4]
load net demo_inst|clk_timer_ff__0[5] -attr @rip O[5] -attr @name clk_timer_ff__0[5] -pin demo_inst|clk_timer_ff_i O[5] -pin demo_inst|clk_timer_ff_reg[31:0] D[5]
load net demo_inst|clk_timer_ff__0[6] -attr @rip O[6] -attr @name clk_timer_ff__0[6] -pin demo_inst|clk_timer_ff_i O[6] -pin demo_inst|clk_timer_ff_reg[31:0] D[6]
load net demo_inst|clk_timer_ff__0[7] -attr @rip O[7] -attr @name clk_timer_ff__0[7] -pin demo_inst|clk_timer_ff_i O[7] -pin demo_inst|clk_timer_ff_reg[31:0] D[7]
load net demo_inst|clk_timer_ff__0[8] -attr @rip O[8] -attr @name clk_timer_ff__0[8] -pin demo_inst|clk_timer_ff_i O[8] -pin demo_inst|clk_timer_ff_reg[31:0] D[8]
load net demo_inst|clk_timer_ff__0[9] -attr @rip O[9] -attr @name clk_timer_ff__0[9] -pin demo_inst|clk_timer_ff_i O[9] -pin demo_inst|clk_timer_ff_reg[31:0] D[9]
load net demo_inst|led_o[0] -attr @rip O[0] -attr @name led_o[0] -hierPin demo_inst led_o[0] -pin demo_inst|led_o_i O[0]
load net demo_inst|led_o[10] -attr @rip O[10] -attr @name led_o[10] -hierPin demo_inst led_o[10] -pin demo_inst|led_o_i O[10]
load net demo_inst|led_o[11] -attr @rip O[11] -attr @name led_o[11] -hierPin demo_inst led_o[11] -pin demo_inst|led_o_i O[11]
load net demo_inst|led_o[12] -attr @rip O[12] -attr @name led_o[12] -hierPin demo_inst led_o[12] -pin demo_inst|led_o_i O[12]
load net demo_inst|led_o[13] -attr @rip O[13] -attr @name led_o[13] -hierPin demo_inst led_o[13] -pin demo_inst|led_o_i O[13]
load net demo_inst|led_o[14] -attr @rip O[14] -attr @name led_o[14] -hierPin demo_inst led_o[14] -pin demo_inst|led_o_i O[14]
load net demo_inst|led_o[15] -attr @rip O[15] -attr @name led_o[15] -hierPin demo_inst led_o[15] -pin demo_inst|led_o_i O[15]
load net demo_inst|led_o[1] -attr @rip O[1] -attr @name led_o[1] -hierPin demo_inst led_o[1] -pin demo_inst|led_o_i O[1]
load net demo_inst|led_o[2] -attr @rip O[2] -attr @name led_o[2] -hierPin demo_inst led_o[2] -pin demo_inst|led_o_i O[2]
load net demo_inst|led_o[3] -attr @rip O[3] -attr @name led_o[3] -hierPin demo_inst led_o[3] -pin demo_inst|led_o_i O[3]
load net demo_inst|led_o[4] -attr @rip O[4] -attr @name led_o[4] -hierPin demo_inst led_o[4] -pin demo_inst|led_o_i O[4]
load net demo_inst|led_o[5] -attr @rip O[5] -attr @name led_o[5] -hierPin demo_inst led_o[5] -pin demo_inst|led_o_i O[5]
load net demo_inst|led_o[6] -attr @rip O[6] -attr @name led_o[6] -hierPin demo_inst led_o[6] -pin demo_inst|led_o_i O[6]
load net demo_inst|led_o[7] -attr @rip O[7] -attr @name led_o[7] -hierPin demo_inst led_o[7] -pin demo_inst|led_o_i O[7]
load net demo_inst|led_o[8] -attr @rip O[8] -attr @name led_o[8] -hierPin demo_inst led_o[8] -pin demo_inst|led_o_i O[8]
load net demo_inst|led_o[9] -attr @rip O[9] -attr @name led_o[9] -hierPin demo_inst led_o[9] -pin demo_inst|led_o_i O[9]
load net demo_inst|led_reg_ff[0] -attr @rip 0 -attr @name led_reg_ff[0] -pin demo_inst|led_o_i I1[0] -pin demo_inst|led_reg_ff_reg[15:0] D[15] -pin demo_inst|led_reg_ff_reg[15:0] Q[0]
load net demo_inst|led_reg_ff[10] -attr @rip 10 -attr @name led_reg_ff[10] -pin demo_inst|led_o_i I1[10] -pin demo_inst|led_reg_ff_reg[15:0] D[9] -pin demo_inst|led_reg_ff_reg[15:0] Q[10]
load net demo_inst|led_reg_ff[11] -attr @rip 11 -attr @name led_reg_ff[11] -pin demo_inst|led_o_i I1[11] -pin demo_inst|led_reg_ff_reg[15:0] D[10] -pin demo_inst|led_reg_ff_reg[15:0] Q[11]
load net demo_inst|led_reg_ff[12] -attr @rip 12 -attr @name led_reg_ff[12] -pin demo_inst|led_o_i I1[12] -pin demo_inst|led_reg_ff_reg[15:0] D[11] -pin demo_inst|led_reg_ff_reg[15:0] Q[12]
load net demo_inst|led_reg_ff[13] -attr @rip 13 -attr @name led_reg_ff[13] -pin demo_inst|led_o_i I1[13] -pin demo_inst|led_reg_ff_reg[15:0] D[12] -pin demo_inst|led_reg_ff_reg[15:0] Q[13]
load net demo_inst|led_reg_ff[14] -attr @rip 14 -attr @name led_reg_ff[14] -pin demo_inst|led_o_i I1[14] -pin demo_inst|led_reg_ff_reg[15:0] D[13] -pin demo_inst|led_reg_ff_reg[15:0] Q[14]
load net demo_inst|led_reg_ff[15] -attr @rip 15 -attr @name led_reg_ff[15] -pin demo_inst|led_o_i I1[15] -pin demo_inst|led_reg_ff_reg[15:0] D[14] -pin demo_inst|led_reg_ff_reg[15:0] Q[15]
load net demo_inst|led_reg_ff[1] -attr @rip 1 -attr @name led_reg_ff[1] -pin demo_inst|led_o_i I1[1] -pin demo_inst|led_reg_ff_reg[15:0] D[0] -pin demo_inst|led_reg_ff_reg[15:0] Q[1]
load net demo_inst|led_reg_ff[2] -attr @rip 2 -attr @name led_reg_ff[2] -pin demo_inst|led_o_i I1[2] -pin demo_inst|led_reg_ff_reg[15:0] D[1] -pin demo_inst|led_reg_ff_reg[15:0] Q[2]
load net demo_inst|led_reg_ff[3] -attr @rip 3 -attr @name led_reg_ff[3] -pin demo_inst|led_o_i I1[3] -pin demo_inst|led_reg_ff_reg[15:0] D[2] -pin demo_inst|led_reg_ff_reg[15:0] Q[3]
load net demo_inst|led_reg_ff[4] -attr @rip 4 -attr @name led_reg_ff[4] -pin demo_inst|led_o_i I1[4] -pin demo_inst|led_reg_ff_reg[15:0] D[3] -pin demo_inst|led_reg_ff_reg[15:0] Q[4]
load net demo_inst|led_reg_ff[5] -attr @rip 5 -attr @name led_reg_ff[5] -pin demo_inst|led_o_i I1[5] -pin demo_inst|led_reg_ff_reg[15:0] D[4] -pin demo_inst|led_reg_ff_reg[15:0] Q[5]
load net demo_inst|led_reg_ff[6] -attr @rip 6 -attr @name led_reg_ff[6] -pin demo_inst|led_o_i I1[6] -pin demo_inst|led_reg_ff_reg[15:0] D[5] -pin demo_inst|led_reg_ff_reg[15:0] Q[6]
load net demo_inst|led_reg_ff[7] -attr @rip 7 -attr @name led_reg_ff[7] -pin demo_inst|led_o_i I1[7] -pin demo_inst|led_reg_ff_reg[15:0] D[6] -pin demo_inst|led_reg_ff_reg[15:0] Q[7]
load net demo_inst|led_reg_ff[8] -attr @rip 8 -attr @name led_reg_ff[8] -pin demo_inst|led_o_i I1[8] -pin demo_inst|led_reg_ff_reg[15:0] D[7] -pin demo_inst|led_reg_ff_reg[15:0] Q[8]
load net demo_inst|led_reg_ff[9] -attr @rip 9 -attr @name led_reg_ff[9] -pin demo_inst|led_o_i I1[9] -pin demo_inst|led_reg_ff_reg[15:0] D[8] -pin demo_inst|led_reg_ff_reg[15:0] Q[9]
load net demo_inst|rst_i -attr @name rst_i -hierPin demo_inst rst_i -pin demo_inst|clk_timer_ff_reg[31:0] CLR -pin demo_inst|led_reg_ff_reg[15:0] CLR[14] -pin demo_inst|led_reg_ff_reg[15:0] CLR[13] -pin demo_inst|led_reg_ff_reg[15:0] CLR[12] -pin demo_inst|led_reg_ff_reg[15:0] CLR[11] -pin demo_inst|led_reg_ff_reg[15:0] CLR[10] -pin demo_inst|led_reg_ff_reg[15:0] CLR[9] -pin demo_inst|led_reg_ff_reg[15:0] CLR[8] -pin demo_inst|led_reg_ff_reg[15:0] CLR[7] -pin demo_inst|led_reg_ff_reg[15:0] CLR[6] -pin demo_inst|led_reg_ff_reg[15:0] CLR[5] -pin demo_inst|led_reg_ff_reg[15:0] CLR[4] -pin demo_inst|led_reg_ff_reg[15:0] CLR[3] -pin demo_inst|led_reg_ff_reg[15:0] CLR[2] -pin demo_inst|led_reg_ff_reg[15:0] CLR[1] -pin demo_inst|led_reg_ff_reg[15:0] CLR[0] -pin demo_inst|led_reg_ff_reg[15:0] PRE[15]
netloc demo_inst|rst_i 1 0 5 NJ 218 NJ 218 630 48N 960 278 1260
load net demo_inst|sw_i[0] -attr @rip sw_i[0] -attr @name sw_i[0] -hierPin demo_inst sw_i[0] -pin demo_inst|led_o_i I0[0]
load net demo_inst|sw_i[10] -attr @rip sw_i[10] -attr @name sw_i[10] -hierPin demo_inst sw_i[10] -pin demo_inst|led_o_i I0[10]
load net demo_inst|sw_i[11] -attr @rip sw_i[11] -attr @name sw_i[11] -hierPin demo_inst sw_i[11] -pin demo_inst|led_o_i I0[11]
load net demo_inst|sw_i[12] -attr @rip sw_i[12] -attr @name sw_i[12] -hierPin demo_inst sw_i[12] -pin demo_inst|led_o_i I0[12]
load net demo_inst|sw_i[13] -attr @rip sw_i[13] -attr @name sw_i[13] -hierPin demo_inst sw_i[13] -pin demo_inst|led_o_i I0[13]
load net demo_inst|sw_i[14] -attr @rip sw_i[14] -attr @name sw_i[14] -hierPin demo_inst sw_i[14] -pin demo_inst|led_o_i I0[14]
load net demo_inst|sw_i[15] -attr @rip sw_i[15] -attr @name sw_i[15] -hierPin demo_inst sw_i[15] -pin demo_inst|led_o_i I0[15]
load net demo_inst|sw_i[1] -attr @rip sw_i[1] -attr @name sw_i[1] -hierPin demo_inst sw_i[1] -pin demo_inst|led_o_i I0[1]
load net demo_inst|sw_i[2] -attr @rip sw_i[2] -attr @name sw_i[2] -hierPin demo_inst sw_i[2] -pin demo_inst|led_o_i I0[2]
load net demo_inst|sw_i[3] -attr @rip sw_i[3] -attr @name sw_i[3] -hierPin demo_inst sw_i[3] -pin demo_inst|led_o_i I0[3]
load net demo_inst|sw_i[4] -attr @rip sw_i[4] -attr @name sw_i[4] -hierPin demo_inst sw_i[4] -pin demo_inst|led_o_i I0[4]
load net demo_inst|sw_i[5] -attr @rip sw_i[5] -attr @name sw_i[5] -hierPin demo_inst sw_i[5] -pin demo_inst|led_o_i I0[5]
load net demo_inst|sw_i[6] -attr @rip sw_i[6] -attr @name sw_i[6] -hierPin demo_inst sw_i[6] -pin demo_inst|led_o_i I0[6]
load net demo_inst|sw_i[7] -attr @rip sw_i[7] -attr @name sw_i[7] -hierPin demo_inst sw_i[7] -pin demo_inst|led_o_i I0[7]
load net demo_inst|sw_i[8] -attr @rip sw_i[8] -attr @name sw_i[8] -hierPin demo_inst sw_i[8] -pin demo_inst|led_o_i I0[8]
load net demo_inst|sw_i[9] -attr @rip sw_i[9] -attr @name sw_i[9] -hierPin demo_inst sw_i[9] -pin demo_inst|led_o_i I0[9]
load net demo_inst|timer_tick -attr @name timer_tick -pin demo_inst|clk_timer_ff_i S -pin demo_inst|led_reg_ff_reg[15:0] CE -pin demo_inst|timer_tick_i O
netloc demo_inst|timer_tick 1 2 3 610 258 NJ 258 1280
load netBundle @demo_inst|sw_i 16 demo_inst|sw_i[15] demo_inst|sw_i[14] demo_inst|sw_i[13] demo_inst|sw_i[12] demo_inst|sw_i[11] demo_inst|sw_i[10] demo_inst|sw_i[9] demo_inst|sw_i[8] demo_inst|sw_i[7] demo_inst|sw_i[6] demo_inst|sw_i[5] demo_inst|sw_i[4] demo_inst|sw_i[3] demo_inst|sw_i[2] demo_inst|sw_i[1] demo_inst|sw_i[0] -autobundled
netbloc @demo_inst|sw_i 1 0 6 NJ 298 NJ 298 NJ 298 NJ 298 NJ 298 N
load netBundle @demo_inst|clk_timer_ff0 32 demo_inst|clk_timer_ff0[31] demo_inst|clk_timer_ff0[30] demo_inst|clk_timer_ff0[29] demo_inst|clk_timer_ff0[28] demo_inst|clk_timer_ff0[27] demo_inst|clk_timer_ff0[26] demo_inst|clk_timer_ff0[25] demo_inst|clk_timer_ff0[24] demo_inst|clk_timer_ff0[23] demo_inst|clk_timer_ff0[22] demo_inst|clk_timer_ff0[21] demo_inst|clk_timer_ff0[20] demo_inst|clk_timer_ff0[19] demo_inst|clk_timer_ff0[18] demo_inst|clk_timer_ff0[17] demo_inst|clk_timer_ff0[16] demo_inst|clk_timer_ff0[15] demo_inst|clk_timer_ff0[14] demo_inst|clk_timer_ff0[13] demo_inst|clk_timer_ff0[12] demo_inst|clk_timer_ff0[11] demo_inst|clk_timer_ff0[10] demo_inst|clk_timer_ff0[9] demo_inst|clk_timer_ff0[8] demo_inst|clk_timer_ff0[7] demo_inst|clk_timer_ff0[6] demo_inst|clk_timer_ff0[5] demo_inst|clk_timer_ff0[4] demo_inst|clk_timer_ff0[3] demo_inst|clk_timer_ff0[2] demo_inst|clk_timer_ff0[1] demo_inst|clk_timer_ff0[0] -autobundled
netbloc @demo_inst|clk_timer_ff0 1 1 1 NJ 98
load netBundle @demo_inst|clk_timer_ff__0 32 demo_inst|clk_timer_ff__0[31] demo_inst|clk_timer_ff__0[30] demo_inst|clk_timer_ff__0[29] demo_inst|clk_timer_ff__0[28] demo_inst|clk_timer_ff__0[27] demo_inst|clk_timer_ff__0[26] demo_inst|clk_timer_ff__0[25] demo_inst|clk_timer_ff__0[24] demo_inst|clk_timer_ff__0[23] demo_inst|clk_timer_ff__0[22] demo_inst|clk_timer_ff__0[21] demo_inst|clk_timer_ff__0[20] demo_inst|clk_timer_ff__0[19] demo_inst|clk_timer_ff__0[18] demo_inst|clk_timer_ff__0[17] demo_inst|clk_timer_ff__0[16] demo_inst|clk_timer_ff__0[15] demo_inst|clk_timer_ff__0[14] demo_inst|clk_timer_ff__0[13] demo_inst|clk_timer_ff__0[12] demo_inst|clk_timer_ff__0[11] demo_inst|clk_timer_ff__0[10] demo_inst|clk_timer_ff__0[9] demo_inst|clk_timer_ff__0[8] demo_inst|clk_timer_ff__0[7] demo_inst|clk_timer_ff__0[6] demo_inst|clk_timer_ff__0[5] demo_inst|clk_timer_ff__0[4] demo_inst|clk_timer_ff__0[3] demo_inst|clk_timer_ff__0[2] demo_inst|clk_timer_ff__0[1] demo_inst|clk_timer_ff__0[0] -autobundled
netbloc @demo_inst|clk_timer_ff__0 1 2 1 650 88n
load netBundle @demo_inst|led_o 16 demo_inst|led_o[15] demo_inst|led_o[14] demo_inst|led_o[13] demo_inst|led_o[12] demo_inst|led_o[11] demo_inst|led_o[10] demo_inst|led_o[9] demo_inst|led_o[8] demo_inst|led_o[7] demo_inst|led_o[6] demo_inst|led_o[5] demo_inst|led_o[4] demo_inst|led_o[3] demo_inst|led_o[2] demo_inst|led_o[1] demo_inst|led_o[0] -autobundled
netbloc @demo_inst|led_o 1 6 1 N 308
load netBundle @demo_inst|clk_timer_ff 32 demo_inst|clk_timer_ff[31] demo_inst|clk_timer_ff[30] demo_inst|clk_timer_ff[29] demo_inst|clk_timer_ff[28] demo_inst|clk_timer_ff[27] demo_inst|clk_timer_ff[26] demo_inst|clk_timer_ff[25] demo_inst|clk_timer_ff[24] demo_inst|clk_timer_ff[23] demo_inst|clk_timer_ff[22] demo_inst|clk_timer_ff[21] demo_inst|clk_timer_ff[20] demo_inst|clk_timer_ff[19] demo_inst|clk_timer_ff[18] demo_inst|clk_timer_ff[17] demo_inst|clk_timer_ff[16] demo_inst|clk_timer_ff[15] demo_inst|clk_timer_ff[14] demo_inst|clk_timer_ff[13] demo_inst|clk_timer_ff[12] demo_inst|clk_timer_ff[11] demo_inst|clk_timer_ff[10] demo_inst|clk_timer_ff[9] demo_inst|clk_timer_ff[8] demo_inst|clk_timer_ff[7] demo_inst|clk_timer_ff[6] demo_inst|clk_timer_ff[5] demo_inst|clk_timer_ff[4] demo_inst|clk_timer_ff[3] demo_inst|clk_timer_ff[2] demo_inst|clk_timer_ff[1] demo_inst|clk_timer_ff[0] -autobundled
netbloc @demo_inst|clk_timer_ff 1 0 4 140 178 NJ 178 NJ 178 920
load netBundle @demo_inst|led_reg_ff 16 demo_inst|led_reg_ff[15] demo_inst|led_reg_ff[14] demo_inst|led_reg_ff[13] demo_inst|led_reg_ff[12] demo_inst|led_reg_ff[11] demo_inst|led_reg_ff[10] demo_inst|led_reg_ff[9] demo_inst|led_reg_ff[8] demo_inst|led_reg_ff[7] demo_inst|led_reg_ff[6] demo_inst|led_reg_ff[5] demo_inst|led_reg_ff[4] demo_inst|led_reg_ff[3] demo_inst|led_reg_ff[2] demo_inst|led_reg_ff[1] demo_inst|led_reg_ff[0] -autobundled
netbloc @demo_inst|led_reg_ff 1 4 2 1300 238 1520
load netBundle @SW 16 SW[15] SW[14] SW[13] SW[12] SW[11] SW[10] SW[9] SW[8] SW[7] SW[6] SW[5] SW[4] SW[3] SW[2] SW[1] SW[0] -autobundled
netbloc @SW 1 0 1 -20J 100n
load netBundle @LED 16 LED[15] LED[14] LED[13] LED[12] LED[11] LED[10] LED[9] LED[8] LED[7] LED[6] LED[5] LED[4] LED[3] LED[2] LED[1] LED[0] -autobundled
netbloc @LED 1 1 1 N 80
levelinfo -pg 1 -40 110 270
levelinfo -hier demo_inst * 220 490 720 1140 1330 1600 *
pagesize -pg 1 -db -bbox -sgen -170 -10 380 380
pagesize -hier demo_inst -db -bbox -sgen 110 28 1720 348
show
zoom 2.69505
scrollpos -342 -116
#
# initialize ictrl to current module demo_wrapper_nexys_a7 work:demo_wrapper_nexys_a7:NOFILE
ictrl init topinfo |
