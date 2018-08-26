.data
##############################################################################################
################           VARIABLES          ################################################

	count: .word 14
	start: .word 1
	end: .word 0
	jumpcount: .word 0
	barrelspeed: .word 2
	barrelcount: .word 45
	random: .word 0
	score: .word 0
	dispscore: .asciiz ""
	initx: .word 25
	endx: .word 37
	flagcolor: .word 0
	enabledup: .word 0
	enableddown: .word 0
	up: .word 0
	down: .word 0
	base: .word 0x10040000	# Heap
	#Prompts
	scoreprompt: .asciiz "SC0RE   0"
	startpmt: .asciiz "PRESS ENTER"
	coverstartpmt: .asciiz "                            "
	quitpmt: .asciiz "QUIT Y 0R N"
	inspmt: .asciiz "JUMP- SB KEY"
	working: .asciiz "\n\n\n\n\nMario is jumping...\n\n\n\n\n"
	
################################################################################################
################           TABLES             ##################################################
	# ColorTable
	ColorTable:
		.word 0x000000 # black
		.word 0xffff00 # Yellow
		.word 0x0000ff # Blue
		.word 0x00ff00 # Green
		.word 0xff0000 # Red
		.word 0xffffff # White
		.word 0xFFDEAD # Skin tone
		.word 0xA0522D # Hair color
		
	# MarioTable
	# What to add to $a0, What to add to $a1, $a2 - color
	MarioTable:
		.word 460,48640,0xff0000
		.word 464,48640,0xff0000
		.word 468,48640,0xff0000
		.word 472,48640,0xff0000
		.word 476,48640,0xff0000
		.word 480,48640,0xff0000
		
		.word 448, 49152, 0xff0000
		.word 452, 49152, 0xff0000
		.word 456,49152,0xff0000
		.word 460,49152,0xff0000
		.word 464,49152,0xff0000
		.word 468,49152,0xff0000
		.word 472,49152,0xff0000
		.word 476,49152,0xff0000
		.word 480,49152,0xff0000
		.word 484,49152,0xff0000
		
		.word 456,49664,0xFFDEAD
		.word 460, 49664, 0
		.word 464,49664,0xFFDEAD
		.word 468,49664,0xFFDEAD
		.word 472,49664,0xA0522D
		.word 476,49664,0xA0522D
		.word 480,49664,0xA0522D
		.word 484,49664,0xA0522D
		
		.word 448, 50176, 0xFFDEAD
		.word 452,50176,0xFFDEAD
		.word 456,50176,0xFFDEAD
		.word 460,50176,0
		.word 464,50176,0xFFDEAD
		.word 468,50176,0xFFDEAD
		.word 472,50176,0xFFDEAD
		.word 476,50176,0xFFDEAD
		.word 480,50176,0xA0522D
		.word 484,50176,0xFFDEAD
		.word 488,50176,0xA0522D
		
		.word 444, 50688, 0xFFDEAD
		.word 448,50688,0xFFDEAD
		.word 452,50688,0xFFDEAD
		.word 456,50688,0
		.word 460,50688,0xFFDEAD
		.word 464,50688,0xFFDEAD
		.word 468,50688,0xFFDEAD
		.word 472,50688,0xFFDEAD
		.word 476,50688,0xA0522D
		.word 480,50688,0xA0522D
		.word 484,50688,0xFFDEAD
		.word 488,50688,0xA0522D
		
		.word 448,51200,0
		.word 452,51200,0
		.word 456,51200,0
		.word 460,51200,0
		.word 464,51200,0xFFDEAD
		.word 468,51200,0xFFDEAD
		.word 472,51200,0xFFDEAD
		.word 476,51200,0xFFDEAD
		.word 480,51200,0xFFDEAD
		.word 484,51200,0xA0522D
		.word 488,51200,0xA0522D
		
		.word 456, 51712, 0xFFDEAD
		.word 460,51712,0xFFDEAD
		.word 464,51712,0xFFDEAD
		.word 468,51712,0xFFDEAD
		.word 472,51712,0xFFDEAD
		.word 476,51712,0xFFDEAD
		.word 480,51712,0xFFDEAD
		.word 484,51712,0xFFDEAD
		.word 488,51712,0xFFDEAD
		
		.word 460, 52224, 0xff0000
		.word 464,52224,0xff0000
		.word 468,52224,0xff0000
		.word 472,52224,0xff0000
		.word 476,52224,0x0000ff
		.word 480,52224,0xff0000
		.word 484,52224,0xff0000
		.word 488,52224,0xff0000
		
		.word 456, 52736, 0xff0000
		.word 460,52736,0xff0000
		.word 464,52736,0xff0000
		.word 468,52736,0x0000ff
		.word 472,52736,0xff0000
		.word 476,52736,0xff0000
		.word 480,52736,0x0000ff
		.word 484,52736,0xff0000
		.word 488,52736,0xff0000
		.word 492,52736,0xff0000
		
		.word 452, 53248,0xff0000
		.word 456,53248,0xff0000
		.word 460,53248,0xff0000
		.word 464,53248,0xff0000
		.word 468,53248,0x0000ff
		.word 472,53248,0x0000ff
		.word 476,53248,0x0000ff
		.word 480,53248,0x0000ff
		.word 484,53248,0xff0000
		.word 488,53248,0xff0000
		.word 492,53248,0xff0000
		.word 496,53248,0xff0000
		
		.word 452, 53760, 0xFFDEAD
		.word 456,53760,0xFFDEAD
		.word 460,53760,0xff0000
		.word 464,53760,0x0000ff
		.word 468,53760,0xffff00
		.word 472,53760,0x0000ff
		.word 476,53760,0x0000ff
		.word 480,53760,0xffff00
		.word 484,53760,0x0000ff
		.word 488,53760,0xff0000
		.word 492,53760,0xFFDEAD
		.word 496,53760,0xFFDEAD
		
		.word 452, 54272, 0xFFDEAD
		.word 456,54272,0xFFDEAD
		.word 460,54272,0xFFDEAD
		.word 464,54272,0x0000ff
		.word 468,54272,0x0000ff
		.word 472,54272,0x0000ff
		.word 476,54272,0x0000ff
		.word 480,54272,0x0000ff
		.word 484,54272,0x0000ff
		.word 488,54272,0xFFDEAD
		.word 492,54272,0xFFDEAD
		.word 496,54272,0xFFDEAD
		
		.word 452,54784,0xFFDEAD
		.word 456,54784,0xFFDEAD
		.word 460,54784,0x0000ff
		.word 464,54784,0x0000ff
		.word 468,54784,0x0000ff
		.word 472,54784,0x0000ff
		.word 476,54784,0x0000ff
		.word 480,54784,0x0000ff
		.word 484,54784,0x0000ff
		.word 488,54784,0x0000ff
		.word 492,54784,0xFFDEAD
		.word 496,54784,0xFFDEAD
		
		.word 460, 55296, 0x0000ff
		.word 464,55296,0x0000ff
		.word 468,55296,0x0000ff
		.word 480,55296,0x0000ff
		.word 484,55296,0x0000ff
		.word 488,55296,0x0000ff
		
		.word 456,55808,0xA0522D
		.word 460,55808,0xA0522D
		.word 464,55808,0xA0522D
		.word 484,55808,0xA0522D
		.word 488,55808,0xA0522D
		.word 492,55808,0xA0522D
		
		.word 452, 56320, 0xA0522D
		.word 456,56320,0xA0522D
		.word 460,56320,0xA0522D
		.word 464,56320,0xA0522D
		.word 484,56320,0xA0522D
		.word 488,56320,0xA0522D
		.word 492,56320,0xA0522D
		.word 496,56320,0xA0522D
		# 151 boxes (Count set to 150)
	
	# DKTable
	DKTable:
		#3
		.word 56, 49152,0xA0522D
		.word 60,49152,0xA0522D
		.word 64,49152,0xA0522D
		
		#3
		.word 52,49664,0xA0522D
		.word 56,49664,0xA0522D
		.word 60,49664,0xA0522D
		
		#6
		.word 48,50176,0xA0522D
		.word 52,50176,0xA0522D
		.word 56,50176,0xA0522D
		.word 60,50176,0xA0522D
		.word 64,50176,0xA0522D
		.word 68,50176,0xA0522D
		
		# 10
		.word 36,50688,0xA0522D
		.word 40,50688,0xA0522D
		.word 44,50688,0xff0000
		.word 48,50688,0xff0000
		.word 52,50688,0xA0522D
		.word 56,50688,0xA0522D
		.word 60,50688,0xA0522D
		.word 64,50688,0xffdead
		.word 68,50688,0xffdead
		.word 72,50688,0xffdead
		
		#15
		.word 12,51200,0
		.word 16,51200,0
		.word 20,51200,0
		.word 24,51200,0xA0522D
		.word 28,51200,0xA0522D
		.word 32,51200,0xA0522D
		.word 36,51200,0xA0522D
		.word 40,51200,0xA0522D
		.word 44,51200,0xA0522D
		.word 48,51200,0xff0000
		.word 52,51200,0xffdead
		.word 56,51200,0xffdead
		.word 60,51200,0xA0522D
		.word 64,51200,0xffffff
		.word 68,51200,0x696969
		
		#15
		.word 12,51712,0
		.word 16,51712,0
		.word 20,51712,0xA0522D
		.word 24,51712,0xA0522D
		.word 28,51712,0xA0522D
		.word 32,51712,0xA0522D
		.word 36,51712,0xA0522D
		.word 40,51712,0xA0522D
		.word 44,51712,0xA0522D
		.word 48,51712,0xff0000
		.word 52,51712,0xffdead
		.word 56,51712,0xffdead
		.word 60,51712,0xA0522D
		.word 64,51712,0xffffff
		.word 68,51712,0x696969
		
		#18
		.word 12,52224,0
		.word 16,52224,0xA0522D
		.word 20,52224,0xA0522D
		.word 24,52224,0xA0522D
		.word 28,52224,0xA0522D
		.word 32,52224,0xA0522D
		.word 36,52224,0xA0522D
		.word 40,52224,0xA0522D
		.word 44,52224,0xA0522D
		.word 48,52224,0xff0000
		.word 52,52224,0xA0522D
		.word 56,52224,0xA0522D
		.word 60,52224,0xffdead
		.word 64,52224,0xffdead
		.word 68,52224,0xffdead
		.word 72,52224,0
		.word 76,52224,0xffdead
		.word 80,52224,0
		
		#18
		.word 12,52736,0xA0522D
		.word 16,52736,0xA0522D
		.word 20,52736,0xA0522D
		.word 24,52736,0xA0522D
		.word 28,52736,0xA0522D
		.word 32,52736,0xA0522D
		.word 36,52736,0xA0522D
		.word 40,52736,0xA0522D
		.word 44,52736,0xA0522D
		.word 48,52736,0xA0522D
		.word 52,52736,0xff0000
		.word 56,52736,0xffdead
		.word 60,52736,0xffdead
		.word 64,52736,0
		.word 68,52736,0xffdead
		.word 72,52736,0xffdead
		.word 76,52736,0xffdead
		.word 80,52736,0xffdead
		
		#19
		.word 4,53248,0
		.word 8,53248,0xA0522D
		.word 12,53248,0xA0522D
		.word 16,53248,0xA0522D
		.word 20,53248,0xA0522D
		.word 24,53248,0xA0522D
		.word 28,53248,0xA0522D
		.word 32,53248,0xA0522D
		.word 36,53248,0xA0522D
		.word 40,53248,0xA0522D
		.word 44,53248,0xA0522D
		.word 48,53248,0xA0522D
		.word 52,53248,0xA0522D
		.word 56,53248,0xA0522D
		.word 60,53248,0xffdead
		.word 64,53248,0xFFDEAD
		.word 68,53248,0
		.word 72,53248,0
		.word 76,53248,0
		
		#19
		.word 4,53760,0
		.word 8,53760,0xA0522D
		.word 12,53760,0xA0522D
		.word 16,53760,0xA0522D
		.word 20,53760,0xA0522D
		.word 24,53760,0xA0522D
		.word 28,53760,0xA0522D
		.word 32,53760,0
		.word 36,53760,0xA0522D
		.word 40,53760,0xA0522D
		.word 44,53760,0xA0522D
		.word 48,53760,0xA0522D
		.word 52,53760,0xA0522D
		.word 56,53760,0xA0522D
		.word 60,53760,0xff0000
		.word 64,53760,0xFFDEAD
		.word 68,53760,0xFFDEAD
		.word 72,53760,0xFFDEAD
		.word 76,53760,0xFFDEAD
		
		#18
		.word 4,54272,0xA0522D
		.word 8,54272,0xA0522D
		.word 12,54272,0xA0522D
		.word 16,54272,0xA0522D
		.word 20,54272,0xA0522D
		.word 24, 54272,0xA0522D
		.word 28,54272,0
		.word 32,54272,0
		.word 36,54272,0xA0522D
		.word 40,54272,0xA0522D
		.word 44,54272,0xA0522D
		.word 48,54272,0xA0522D
		.word 52,54272,0xFFDEAD
		.word 56,54272,0xff0000
		.word 60,54272,0xff0000
		.word 64,54272,0xFFDEAD
		.word 68,54272,0xFFDEAD
		.word 72,54272,0xFFDEAD
		
		#17
		.word 4, 54784, 0xA0522D
		.word 8, 54784, 0xA0522D
		.word 12,54784, 0xA0522D
		.word 16,54784, 0xA0522D
		.word 20, 54784, 0xA0522D
		.word 24,54784, 0xA0522D
		.word 28,54784, 0xFFDEAD
		.word 32,54784, 0xFFDEAD
		.word 36,54784, 0xA0522D
		.word 40,54784, 0xA0522D
		.word 44,54784, 0xA0522D
		.word 48,54784, 0xFFDEAD
		.word 52,54784, 0xFFDEAD
		.word 56,54784, 0xFF0000
		.word, 60,54784, 0xFF0000
		.word 64,54784, 0xA0522D
		.word 68,54784, 0xA0522D
		
		#17
		.word 4, 55296, 0xA0522D
		.word 8, 55296, 0xA0522D
		.word 12,55296, 0xA0522D
		.word 16,55296, 0xA0522D
		.word 20, 55296, 0xA0522D
		.word 24,55296, 0xA0522D
		.word 28,55296, 0xFFDEAD
		.word 32,55296, 0xFFDEAD
		.word 36,55296, 0xA0522D
		.word 40,55296, 0xA0522D
		.word 44,55296, 0xA0522D
		.word 48,55296, 0xFFDEAD
		.word 52,55296, 0xFFDEAD
		.word 56,55296, 0xFF0000
		.word, 60,55296, 0xFF0000
		.word 64,55296, 0xA0522D
		.word 68,55296, 0xA0522D
		
		#12
		.word 8, 55808, 0xA0522D
		.word 12,55808, 0xA0522D
		.word 16,55808, 0xA0522D
		.word 20, 55808, 0xA0522D
		.word 36,55808, 0xFFDEAD
		.word 40,55808, 0xFFDEAD
		.word 44, 55808, 0xA0522D
		.word 48,55808, 0xA0522D
		.word 60,55808, 0xff0000
		.word 64,55808, 0xff0000
		.word 68,55808, 0xA0522D
		.word 72,55808, 0xA0522D
		
		#12
		.word 8, 56320, 0xA0522D
		.word 12,56320, 0xA0522D
		.word 16,56320, 0xA0522D
		.word 20, 56320, 0xA0522D
		.word 36,56320, 0xFFDEAD
		.word 40,56320, 0xFFDEAD
		.word 44, 56320, 0xA0522D
		.word 48,56320, 0xA0522D
		.word 60,56320, 0xff0000
		.word 64,56320, 0xff0000
		.word 68,56320, 0xA0522D
		.word 72,56320, 0xA0522D
		
		#16
		.word 4, 56832, 0xFFDEAD
		.word 8, 56832, 0xFFDEAD
		.word 12, 56832, 0xFFDEAD
		.word 16, 56832, 0xFFDEAD
		.word 20, 56832, 0xFFDEAD
		.word 24, 56832, 0xFFDEAD
		.word 32, 56832, 0xFFDEAD
		.word 36, 56832, 0xFFDEAD
		.word 40, 56832, 0xFFDEAD
		.word 44,56832, 0xFFDEAD
		.word 48,56832, 0xFFDEAD
		.word 60,56832, 0xff0000
		.word 64,56832,0xff0000
		.word 68, 56832, 0xFFDEAD
		.word 72, 56832, 0xFFDEAD
		
	# SoundTable
	SoundTable:
	
	######################## Interrupt data ####################################
	# Status register bits
	EXC_ENABLE_MASK:        .word   0x00000001
	
		# Cause register bits
	EXC_CODE_MASK:          .word   0x0000003c  # Exception code bits
	
	EXC_CODE_INTERRUPT:     .word   0   # External interrupt
	EXC_CODE_ADDR_LOAD:     .word   4   # Address error on load	
	EXC_CODE_ADDR_STORE:    .word   5   # Address error on store
	EXC_CODE_IBUS:          .word   6   # Bus error instruction fetch
	EXC_CODE_DBUS:          .word   7   # Bus error on load or store
	EXC_CODE_SYSCALL:       .word   8   # System call
	EXC_CODE_BREAKPOINT:    .word   9   # Break point
	EXC_CODE_RESERVED:      .word   10  # Reserved instruction code
	EXC_CODE_OVERFLOW:      .word   12  # Arithmetic overflow

	# Status and cause register bits
	EXC_INT_ALL_MASK:       .word   0x0000ff00  # Interrupt level enable bits
	
	EXC_INT0_MASK:          .word   0x00000100  # Software
	EXC_INT1_MASK:          .word   0x00000200  # Software
	EXC_INT2_MASK:          .word   0x00000400  # Display
	EXC_INT3_MASK:          .word   0x00000800  # Keyboard
	EXC_INT4_MASK:          .word   0x00001000
	EXC_INT5_MASK:          .word   0x00002000  # Timer
	EXC_INT6_MASK:          .word   0x00004000
	EXC_INT7_MASK:          .word   0x00008000
	###################### END INTERRUPT DATA #################################

	##################### DIGIT DATA   #######################################
	        .data
        .word   0 : 40
Stack:

Colors: .word   0x000000        # background color (black)
        .word   0xffffff        # foreground color (white)

DigitTable:
        .byte   ' ', 0,0,0,0,0,0,0,0,0,0,0,0
        .byte   '0', 0x7e,0xff,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xff,0x7e
        .byte   '1', 0x38,0x78,0xf8,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18
        .byte   '2', 0x7e,0xff,0x83,0x06,0x0c,0x18,0x30,0x60,0xc0,0xc1,0xff,0x7e
        .byte   '3', 0x7e,0xff,0x83,0x03,0x03,0x1e,0x1e,0x03,0x03,0x83,0xff,0x7e
        .byte   '4', 0xc3,0xc3,0xc3,0xc3,0xc3,0xff,0x7f,0x03,0x03,0x03,0x03,0x03
        .byte   '5', 0xff,0xff,0xc0,0xc0,0xc0,0xfe,0x7f,0x03,0x03,0x83,0xff,0x7f
        .byte   '6', 0xc0,0xc0,0xc0,0xc0,0xc0,0xfe,0xfe,0xc3,0xc3,0xc3,0xff,0x7e
        .byte   '7', 0x7e,0xff,0x03,0x06,0x06,0x0c,0x0c,0x18,0x18,0x30,0x30,0x60
        .byte   '8', 0x7e,0xff,0xc3,0xc3,0xc3,0x7e,0x7e,0xc3,0xc3,0xc3,0xff,0x7e
        .byte   '9', 0x7e,0xff,0xc3,0xc3,0xc3,0x7f,0x7f,0x03,0x03,0x03,0x03,0x03
        .byte   'A', 0x18,0x3c,0x66,0xc3,0xc3,0xc3,0xff,0xff,0xc3,0xc3,0xc3,0xc3
        .byte   'B', 0xfc,0xfe,0xc3,0xc3,0xc3,0xfe,0xfe,0xc3,0xc3,0xc3,0xfe,0xfc
        .byte   'C', 0x7e,0xff,0xc1,0xc0,0xc0,0xc0,0xc0,0xc0,0xc0,0xc1,0xff,0x7e
        .byte   'D', 0xfc,0xfe,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xfe,0xfc
        .byte   'E', 0xff,0xff,0xc0,0xc0,0xc0,0xfe,0xfe,0xc0,0xc0,0xc0,0xff,0xff
        .byte   'F', 0xff,0xff,0xc0,0xc0,0xc0,0xfe,0xfe,0xc0,0xc0,0xc0,0xc0,0xc0
        .byte	'G', 0x18,0x66,0xc3,0xc3,0xc0,0xc0,0xcf,0xcf,0xc3,0xc3,0x7e,0x3c
        .byte	'P', 0xfc,0xfe,0xc3,0xc3,0xc3,0xfe,0xfe,0xc0,0xc0,0xc0,0xc0,0xc0
        .byte	'R', 0xfc,0xfe,0xc3,0xc3,0xc3,0xfe,0xfe,0xc3,0xc3,0xc3,0xc3,0xc3
        .byte	'S', 0x7e,0xff,0xc0,0xc0,0xc0,0xff,0xff,0x03,0x03,0x03,0xff,0x7e
        .byte	'N', 0xc3,0xe3,0xe3,0xd3,0xd3,0xcb,0xcb,0xc7,0xc7,0xc3,0xc3,0xc3
        .byte	'Y', 0xc3,0xc3,0xc3,0x66,0x3c,0x18,0x18,0x18,0x18,0x18,0x18,0x18
        .byte	'K', 0xc3,0xc3,0xc3,0xc3,0xc2,0xfc,0xf8,0xc4,0xc3,0xc3,0xc3,0xc3
        .byte	'J', 0x03,0x03,0x03,0x03,0x03,0x03,0x03,0x03,0xc3,0xc3,0x7e,0x3c 
        .byte	'U', 0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0x3c,0x3c
        .byte	'M', 0xc3,0xe7,0xdb,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3,0xc3
        .byte   '-', 0x00,0x00,0x00,0x00,0x00,0x7e,0x7e,0x00,0x00,0x00,0x00,0x00
        .byte	'T', 0xff,0xff,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18
        .byte	'Q', 0x3c,0x7e,0xc3,0xc3,0xc3,0xc3,0xc3,0xdb,0xdb,0xe7,0x3c,0x03
        .byte	'I', 0xff,0xff,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0x18,0xff,0xff

.text

# Enable interrupts in status register
mfc0    $t0, $12

# Disable all interrupt levels
lw      $t1, EXC_INT_ALL_MASK
not     $t1, $t1
and     $t0, $t0, $t1
	
# Enable console interrupt levels
lw      $t1, EXC_INT3_MASK
or      $t0, $t0, $t1
# Enable exceptions globally
lw      $t1, EXC_ENABLE_MASK
or      $t0, $t0, $t1

mtc0    $t0, $12
	
# Enable keyboard interrupts
li      $t0, 0xffff0000     # Receiver control register
li      $t1, 0x00000002     # Interrupt enable bit
sw      $t1, ($t0)

InitRand:
# Get time in ms
li $v0, 30
syscall
# Random syscall
li $v0, 40
syscall

######################### START OF MAIN PROGRAM ######################################
Main:
	# Allocate memory to stack
	addiu $sp, $sp, -40
	
	# Black out screen
	li $a0, 0
	li $a1, 0
	li $a2, 0
	li $a3, 128
	jal DrawBox
	
	# Draw initial screen - blue ground
	jal DrawBack
	
	# Draw DK
	jal DrawDK
	
	# Display Start propmt - poll keyboard for any character
	la $a2, startpmt
	li $a0, 8
	li $a1, 59
	jal OutText
	
	# Wait for input
	awaitinputstart:
		lw $t0, start		# Changed by interrupt handler
		bnez $t0, awaitinputstart
	
	# Cover start key with empty space
	la $a2, coverstartpmt
	li $a0, 8
	li $a1, 59
	jal OutText
	
	# Print next screen
	li $a0, 150			# Print score
	li $a1, 1
	la $a2, scoreprompt
	jal OutText
	
	# Print instruction
	li $a1, 115			# Spacebar jump instruction
	li $a0, 5
	la $a2, inspmt
	jal OutText
	
	# Draw mario - initial position
	# Initialize values
	la $t0, MarioTable
	lw $a0, 0($t0)
	lw $a1, 4($t0)
	lw $a2, 8($t0)
	jal DrawMario
	
	# Loop barrel moving and jumping Mario
	Moving:	
	# Draw barrel - pixels to move forward depends on barrelspeed variable
	jal DrawBarrel
	
	# Check if Mario is jumping
	lw $s1, enabledup
	beqz $s1, jmp		# If not, continue barrel regular
	
	# Loop for Mario jumping
	
	JumpingEnabled:
	# Initialize Mario drawing
	sw $t0, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a3, 12($sp)
	la $t0, MarioTable
	lw $a0, 0($t0)
	lw $a1, 4($t0)
	lw $a2, 8($t0)
	
	# Keep track of how high Mario has left to jump (count variable)
	lw $s3, count
	addi $s3, $s3, -1
	sw $s3, count
	beqz $s3, NoUpJump	# If jumping up is done, continue to jumping down
	
	# Sends to procedure that updates how high Mario is going
	jal JumpMarioUp
	
	# This will return to JumpEnabled if count not done
	jal DrawBarrel
	
	# Loop for Mario jumping down
	NoUpJump:
	# Disable up signal
	li $t0, 0
	sw $t0, enabledup
	# Enable down signal
	li $t0, 1
	sw $t0, enableddown
	
	# reset counter for down jump
	li $t0, 14
	sw $t0, count
	
	JumpingDisabled:
	# Initialize Mario drawing
	sw $t0, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a3, 12($sp)
	la $t0, MarioTable
	lw $a0, 0($t0)
	lw $a1, 4($t0)
	lw $a2, 8($t0)
	
	# Keep track of how much Mario has left to fall (count variable)
	lw $s3, count
	addi $s3, $s3, -1
	sw $s3, count
	beqz $s3, Reset	# If jumping up is done, continue to jumping down
	
	# Sends to procedure that updates how low Mario is going
	jal JumpMarioDown
	
	# This will return to JumpDisabled if count not done
	jal DrawBarrel
	
	
	lw $t0, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a3, 12($sp)
	
	
	Reset:
	# Reset counter, decrement/increment registers
	li $s3, 14
	sw $s3, count
	li $s3, 0
	sw $s3, up
	sw $s3, down
	sw $s3, enabledup
	
	# Jump here if no jumping
	jmp:
	addiu $sp, $sp, 40
	li $t0, 0
	sw $t0, enabledup
	sw $t0, enableddown
	
	# Loop back
	j Moving
	
	# Exit
	Exitgame:
	li $v0, 10
	syscall
	
############################################################################################################
#########################           PROCEDURES            #################################################
	
	# Procedure: InitRand
	# Initializes randomizing with seed
	RandNum:
		# Get random number for sequence	
		li $v0, 42
		li $a1, 1
		syscall
		# Return
		jr $ra
	
	# Procedure: CalcAddr
	# Calculates memory address according to given x and y coordinates
	# Input: $a0 is x coordinate
	# Input: $a1 is y coordinate
	CalcAddr:
		#address = xcoord*4+base+ycoord*128*4
		lw $t2, base
		
		# $t0 = xcoord*4
		sll $t0, $a0, 2
		# $t1 = ycoord*128*4
		sll $t1, $a1, 9
		# $v0 = $t0+base+$t1
		add $v0, $t1, $t0
		add $v0, $v0, $t2
		
		#Return
		jr $ra
	
	# Procedure: GetColor
	# Gets color given the number for it
	# Input: $a2 = color number (0-5)
	# Output: $v1 = actual number to write to display
	GetColor:
	la $t0, ColorTable	# Load base
	sll $t1, $a2, 2		# x4 offset
	add $t2, $t1, $t0
	lw $v1, ($t2)
	
	#Return
	jr $ra
		
	# Procedure: DrawDot
	# Draws a dot on bitmap display
	# Input: $a0 is x coordinate
	# Input: $a1 is y coordinate
	# Input: $a2 is color number
	DrawDot:
		# Allocate memory to stack
		addiu $sp, $sp, -8
		# Store $ra
		sw $ra, 4($sp)
		# Store $a2
		sw $a2, 0($sp)
		# $v0 contains address for pixel
		jal CalcAddr
		# Restore $a0
		lw $a2, 0($sp)
		lw $ra, 4($sp)
		# Store $v0
		sw $v0, 0($sp)
		# Will have color in $v1
		jal GetColor
		# Restore address to $v0
		lw $v0, 0($sp)
		# Store color in address
		sw $v1, ($v0)
		# Load original $ra back
		lw $ra, 4($sp)
		#DE-allocate memory from stack
		addiu $sp, $sp, 8
		#return
		jr $ra
	
	# Procedure: HorzLine
	# Multiple dots that form a horizontal line
	# Input: $a0 is x coordinate
	# Input: $a1 is y coordinate
	# Input: $a2 is color number
	# Input: $a3 is how long want line
	HorzLine:
		# Allocate memory to stack
		addiu $sp, $sp, -28
		# Save $ra and $ax
		sw $ra, 12($sp)
		sw $a0, 24($sp)
		sw $a1, 20($sp)
		sw $a3, 16($sp)
		
	HorzLoop:
		# Store $ax
		sw $a0, 8($sp)
		sw $a1, 4($sp)
		sw $a3, 0($sp)
		jal DrawDot
		# Load $ax
		lw $a0, 8($sp)
		lw $a1, 4($sp)
		lw $a3, 0($sp)
		# Increment xcoord $a0
		addi $a0, $a0, 1
		# Decrement $a3
		addiu  $a3, $a3, -1
		# Determine how much longer to go
		bne $a3, $0, HorzLoop
		# Restore $ra
		lw $ra, 12($sp)
		lw $a0, 24($sp)
		lw $a1, 20($sp)
		lw $a3, 16($sp)
		# De-allocate memory from stack
		addiu $sp, $sp, 28
		# return
		jr $ra
	
	# Procedure: DrawBox
	# Draws a filled box using horizontal lines
	# Input: $a0 is x coordinate
	# Input: $a1 is y coordinate
	# Input: $a2 is color number
	# Input: $a3 is how long want line
	DrawBox:
		# Allocate memory to stack
		addiu $sp, $sp, -28
		# Save $ra and $s0
		sw $ra, 24($sp)
		sw $s0, 20($sp)
		sw $a1, 16($sp)
		# Copy $a3 to $s0
		move $s0, $a3
	BoxLoop:
		# Store $ax
		sw $a0, 16($sp)
		sw $a1, 12($sp)
		sw $a2, 8($sp)
		sw $a3, 4($sp)
		jal HorzLine
		# Load $ax
		lw $a0, 16($sp)
		lw $a1, 12($sp)
		lw $a2, 8($sp)
		lw $a3, 4($sp)
		# Increment $a1
		addiu $a1, $a1, 1
		# Decrement counter
		addi $s0, $s0, -1
		# Check if already size
		bne $s0, $0, BoxLoop
		# restore $ra and $s0
		lw $ra, 24($sp)
		lw $s0, 20($sp)
		lw $a1, 16($sp)
		# De-allocate memory from stack
		addiu $sp, $sp, 28
		# Return
		jr $ra
	
	# OutText: display ascii characters on the bit mapped display
	# $a0 = horizontal pixel co-ordinate (0-255)
	# $a1 = vertical pixel co-ordinate (0-255)
	# $a2 = pointer to asciiz text (to be displayed)
	OutText:
        addiu   $sp, $sp, -24
        sw      $ra, 20($sp)

        li      $t8, 1          # line number in the digit array (1-12)
	_text1:
        la      $t9, 0x10040000 # get the memory start address
        sll     $t0, $a0, 2     # assumes mars was configured as 128 x 128
        addu    $t9, $t9, $t0   # and 1 pixel width, 1 pixel height
        sll     $t0, $a1, 9    # (a0 * 4) + (a1 * 4 * 128)
        addu    $t9, $t9, $t0   # t9 = memory address for this pixel

        move    $t2, $a2        # t2 = pointer to the text string
	_text2:
        lb      $t0, 0($t2)     # character to be displayed
        addiu   $t2, $t2, 1     # last character is a null
        beq     $t0, $zero, _text9

        la      $t3, DigitTable # find the character in the table
	_text3:
        lb      $t4, 0($t3)     # get an entry from the table
        beq     $t4, $t0, _text4
        beq     $t4, $zero, _text4
        addiu   $t3, $t3, 13    # go to the next entry in the table
        j       _text3
	_text4:
        addu    $t3, $t3, $t8   # t8 is the line number
        lb      $t4, 0($t3)     # bit map to be displayed

        sw      $zero, 0($t9)   # first pixel is black
        addiu   $t9, $t9, 4

        li      $t5, 8          # 8 bits to go out
	_text5:
        la      $t7, Colors
        lw      $t7, 0($t7)     # assume black
        andi    $t6, $t4, 0x80  # mask out the bit (0=black, 1=white)
        beq     $t6, $zero, _text6
        la      $t7, Colors     # else it is white
        lw      $t7, 4($t7)
	_text6:
        sw      $t7, 0($t9)     # write the pixel color
        addiu   $t9, $t9, 4     # go to the next memory position
        sll     $t4, $t4, 1     # and line number
        addiu   $t5, $t5, -1    # and decrement down (8,7,...0)
        bne     $t5, $zero, _text5

        sw      $zero, 0($t9)   # last pixel is black
        addiu   $t9, $t9, 4
        j       _text2          # go get another character

	_text9:
        addiu   $a1, $a1, 1     # advance to the next line
        addiu   $t8, $t8, 1     # increment the digit array offset (1-12)
        bne     $t8, 13, _text1

        lw      $ra, 20($sp)
        addiu   $sp, $sp, 24
        jr      $ra	
	        
	
	# Procedure: DrawBack
	# Draws the blue floor and Dokey Kong(possibly)
	# Input: none
	# Output: Displayed to screen
	DrawBack:
	# Allocate memory to stack
	addiu $sp, $sp, -20
	# Save $a* and $ra
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	sw $a1, 8($sp)
	sw $a2, 12($sp)
	sw $a3, 16($sp)
	# Initialize coordinates, color and size	
	li $a0, 0
	li $a1, 112
	li $a2, 2
	li $a3, 16
	# Counter for drawing floor
	li $t0, 8
	DrawBackLoop:
	
		#Allocate memory to stack
		addiu $sp, $sp, -20
		
		# Save $a* and $t*
		sw $a0, 0($sp)
		sw $a1, 4($sp)
		sw $a2, 8($sp)
		sw $a3, 12($sp)
		sw $t0, 16($sp)
		
		# Draw box
		jal DrawBox
		
		# Load $a* and $t*
		lw $a0, 0($sp)
		lw $a1, 4($sp)
		lw $a2, 8($sp)
		lw $a3, 12($sp)
		lw $t0, 16($sp)
		
		# Add 32 to 'x'
		addi $a0, $a0, 16
		
		# Decrement counter
		addi $t0, $t0, -1
		
		# De-allocate memory from stack
		addiu $sp, $sp, 20
		
		# Check if floor done
		bnez $t0, DrawBackLoop
	
	# Load $a* and $ra
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	lw $a1, 8($sp)
	lw $a2, 12($sp)
	lw $a3, 16($sp)
	# DE-allocate memory from stack
	addiu $sp, $sp, 20
	# Return
	jr $ra
	
	#Procedure: DrawMario
	#Draws Mario resting pose --not jumping--
	#Input: First $a0 - x coordinate, $a1 - y coordinate and $a2 - color
	#Output: Mario printed to screen
	DrawMario:
	# Allocate memory to stack
	addiu $sp, $sp, -44
	# Save $a* and $ra
	sw $ra, 20($sp)
	sw $a0, 24($sp)
	sw $a1, 28($sp) 
	sw $a2, 32($sp)
	sw $a3, 36($sp)
	
	# Counter of pixels
	li $t1, 153
	
	# Check if color should be black
	lw $t4, flagcolor
	beqz $t4, contmario	# Skip if flag not set
	li $a2, 0
	
	contmario:
	# Fetch next data
	addiu $t0, $t0, 12
	
	DrawMarioLoop:
		sw $t0, 0($sp)
		sw $t1, 4($sp)
		sw $a0, 8($sp)
		sw $a1, 12($sp)
		sw $a3, 16($sp)
		sw $a2, 40($sp)
		
		# Determine if lose when Mario in resting position
		jal DetermineLose
		
		# Load saved registers
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $a0, 8($sp)
		lw $a1, 12($sp)
		lw $a3, 16($sp)
		lw $a2, 40($sp)
		
		# Draw pixel
		lw $t5, base
		add $a0, $a0, $t5
		add $a1, $a0, $a1
		sw $a2, ($a1)
		
		# Load saved registers
		lw $t0, 0($sp)
		lw $t1, 4($sp)
		lw $a0, 8($sp)
		lw $a1, 12($sp)
		lw $a3, 16($sp)
		lw $a2, 40($sp)
		
		# Check if flag set for black color
		lw $t4, flagcolor
		lw $a2, 8($t0)
		beqz $t4, contmario2	# If flag not set, skip
		li $a2, 0
		
		contmario2:
		# Set next coordinates
		lw $a0, 0($t0)
		lw $a1, 4($t0)
		lw $t5, up
		add $a1, $a1, $t5
		
		# Add to table
		addi $t0, $t0, 12
		# Decrement counter 
		addi $t1, $t1, -1
		
		# Check if done
		bnez $t1, DrawMarioLoop
		
	# Reload $a* and $ra
	lw $ra, 20($sp)
	lw $a0, 24($sp)
	lw $a1, 28($sp) 
	lw $a2, 32($sp)
	lw $a3, 36($sp)
	
	# De-allocate memory from stack
	addiu $sp, $sp, 44
	# Return
	jr $ra
	
	# Procedure: JumpMarioUP
	# Enabled by interrupt. Does jumping animation. Decreases y coord. by 3 pixels
	# Output: Mario jumping sequence
	JumpMarioUp:
		# Allocate memory to stack
		addiu $sp, $sp, -44
		# Save $a* and $ra
		sw $ra, 0($sp)
		sw $a0, 4($sp)
		sw $a1, 8($sp)
		sw $a2, 12($sp)
		sw $a3, 16($sp)
		# Initialize counter
		li $t4, 10
		JumpMarioLoopUP:
		
		# Save $a*
		sw $a0, 20($sp)
		sw $a1, 24($sp)
		sw $a2, 28($sp)
		sw $a3, 32($sp)
		sw $t4, 36($sp)
		sw $t0, 40($sp)
		
		# Load black color
		li $a2, 0
		lw $t6, up
		add $a1, $a1, $t6
		
		# Initialize values
		li $t9, 1
		sw $t9, flagcolor
		# Draw clear
		jal DrawMario
		
		# Load $a*
		lw $a0, 20($sp)
		lw $a1, 24($sp)
		lw $a2, 28($sp)
		lw $a3, 32($sp)
		lw $t0, 40($sp)
		lw $ra, 0($sp)
		
		# New color
		lw $a2, 8($t0)
		
		# Decrement y coordinate for 
		lw $t6, up
		addi $t6, $t6, -1536
		sw $t6, up
		add $a1, $a1, $t6
		
		# Save $a3
		sw $a3, 32($sp)
		
		# Reset black color flag
		li $t9, 0
		sw $t9, flagcolor
		
		# Draw next mario
		jal DrawMario
		
		# Load $a*
		lw $a0, 20($sp)
		lw $a1, 24($sp)
		lw $a2, 28($sp)
		lw $a3, 32($sp)
		lw $t4, 36($sp)
		
		# Load $a* and $ra
		lw $ra, 0($sp)
		lw $a0, 4($sp)
		lw $a1, 8($sp)
		lw $a2, 12($sp)
		lw $a3, 16($sp)
		
		# De-allocate memory from stack
		addiu $sp, $sp, 44
		
		# Return
		jr $ra
		
	
	# Procedure: JumpMarioDown
	# Enabled by interrupt. Does jumping down animation. Increases y coord by 3 pixels
	JumpMarioDown:
		# Allocate memory to stack
		addiu $sp, $sp, -44
		# Save $a* and $ra
		sw $ra, 0($sp)
		sw $a0, 4($sp)
		sw $a1, 8($sp)
		sw $a2, 12($sp)
		sw $a3, 16($sp)
		# Initialize counter
		li $t4, 10
		# Initialize values
		li $t9, 1
		sw $t9, flagcolor
		
		
	JumpMarioLoopDown:
		
		# Save $a*
		sw $a0, 20($sp)
		sw $a1, 24($sp)
		sw $a2, 28($sp)
		sw $a3, 32($sp)
		sw $t4, 36($sp)
		sw $t0, 40($sp)
		li $a2, 0
		lw $t6, up
		add $a1, $a1, $t6
		
		# Draw clear
		jal DrawMario
		
		# Load $a*
		lw $a0, 20($sp)
		lw $a1, 24($sp)
		lw $a2, 28($sp)
		lw $a3, 32($sp)
		lw $t0, 40($sp)
		lw $ra, 0($sp)
		
		# New color
		lw $a2, 8($t0)
		
		# Increment y coordinate for 
		lw $t6, up
		addi $t6, $t6, 1536
		sw $t6, up
		add $a1, $a1, $t6
		
		# Save $a3
		sw $a3, 32($sp)
		li $t9, 0
		sw $t9, flagcolor
		
		# Draw next mario
		jal DrawMario
		
		# Load $a*
		lw $a0, 20($sp)
		lw $a1, 24($sp)
		lw $a2, 28($sp)
		lw $a3, 32($sp)
		lw $t4, 36($sp)
		
		# Load $a* and $ra
		lw $ra, 0($sp)
		lw $a0, 4($sp)
		lw $a1, 8($sp)
		lw $a2, 12($sp)
		lw $a3, 16($sp)
		
		# De-allocate memory from stack
		addiu $sp, $sp, 44
		
		# Return
		jr $ra
	
	# Procedure: DrawBarrel
	# Uses DrawBox procedure to draw barrel coming at Mario.
	# Includes speed differences depending on score
	# Branch handles interruption from jumping
	# Output: Display barrel on bitmap display.
	DrawBarrel:
		# Allocate memory to stack
		addiu $sp, $sp, -40
		
		# Save registers
		sw $ra, 0($sp)
		sw $a0, 4($sp)
		sw $a1, 8($sp)
		sw $a2, 12($sp)
		sw $a3, 16($sp)
		
	DrawBarrelLoop:
		# Load size of box, $a1 and color
		li $a3, 12
		li $a1, 100
		li $a2, 7
		# Determine where to draw barrel next
		lw $a0, initx
		# Determine if speed must be added
		lw $t0, barrelspeed
		lw $t1, score
		# Determine end of box for loser condition
		lw $t6, endx
		bgt $t1, 4, nextlevel
		addi $t6, $t6, 2
		sw $t6, endx
		
		nextlevel:
		# Level 2 speed
		blt $t1,11, nomorespeed
		li $t0, 3
		sw $t0, barrelspeed
		addi $t6, $t6, 3
		sw $t6, endx
		
		
		nomorespeed:
		add $a0, $a0, $t0
		sw $a0, initx
		
		# Check if barrel hits Mario in resting position
		lw $t6, enabledup	
		bnez $t6, nomariolose		# If jumping up, continue
		lw $t6, enableddown	
		bnez $t6, nomariolose		# If jumping down, continue
		blt $a0, 102, nomariolose	# If barrel hasn't hit Mario, continue
		j Loser				# Proceed to loser sequence
		
		nomariolose:
		
		sw $a0, 20($sp)
		sw $a1, 24($sp)
		li $a3, 12
		lw $ra, 0($sp)
		li $a2, 7
		
		jal DrawBox
		
		# Erase box
		lw $a0, 20($sp)
		lw $a1, 24($sp)
		li $a2, 0
		lw $ra, 0($sp)
		
		jal DrawBox
		
		# Increment x by 4 pixels
		lw $a0, 20($sp)
		lw $a1, 24($sp)
		lw $ra, 0($sp)
		
		# Decrement how many barrels left to draw to finish line
		lw $t5, barrelcount
		addi $t5, $t5, -1
		sw $t5, barrelcount
		
		bgtz $t5, donotreset	# If not done, skip resetting variables
		
		# Reset variables
		li $t0, 25
		sw $t0, initx
		li $t0, 37
		sw $t0, endx
		# Determine level to then determine count
		li $t0, 45
		sw $t0, barrelcount
		# Generate random speed
		jal RandNum
		sw $a0, random
		# Check level at
		lw $t0, random
		# Correct barrel count for level 2
		blt $t0, 1, continuespeed
		li $t1, 30
		sw $t1, barrelcount
		li $t1, 3
		sw $t1, barrelspeed
		
		continuespeed:
		# If barrel successfully completes line, add 1 to score
		lw $t0, score
		addi $t0, $t0, 1
		sw $t0, score
		
		# Print score to screen
		lw $a0, score
		li $a1, 112
		jal DrawFromInteger
		
		donotreset:
		
		# Check if must jump to jumping mario
		lw $t6, enabledup
		bnez $t6, JumpingEnabled
		lw $t6, enableddown
		bnez $t6, JumpingDisabled
		
		bgtz $t5, DrawBarrelLoop	# If haven't finished barrel count, loop back
		
		# Load registers
		lw $ra, 0($sp)
		lw $a0, 4($sp)
		lw $a1, 8($sp)
		lw $a2, 12($sp)
		lw $a3, 16($sp)
		
		# De-Allocate memory to stack
		addiu $sp, $sp, 40
		
		# Return
		jr $ra
	
	#Procedure: DrawDK
	#Draws Donkey Kong
	#Output: Donkey Kong printed to screen
	DrawDK:
	# Allocate memory to stack
	addiu $sp, $sp, -44
	# Save $a* and $ra
	sw $ra, 20($sp)
	sw $a0, 24($sp)
	sw $a1, 28($sp) 
	sw $a2, 32($sp)
	sw $a3, 36($sp)
	
	# Counter of pixels
	li $t1, 218
	
	# Load address to table
	la $t0, DKTable
	
	DrawDKLoop:
		# Load DK table coordinates
		lw $a0, 0($t0)
		lw $a1, 4($t0)
		lw $a2, 8($t0)
		
		# Draw pixel
		lw $t5, base
		add $a0, $a0, $t5
		add $a1, $a0, $a1
		sw $a2, ($a1)
		
		# Add to table
		addiu $t0, $t0, 12
		
		# Decrement counter 
		addi $t1, $t1, -1
		
		# Check if done
		bnez $t1, DrawDKLoop
		
	# Reload $a* and $ra
	lw $ra, 20($sp)
	lw $a0, 24($sp)
	lw $a1, 28($sp) 
	lw $a2, 32($sp)
	lw $a3, 36($sp)
	
	# De-allocate memory from stack
	addiu $sp, $sp, 44
	# Return
	jr $ra
	
#########################      DRAWING PROCEDURES END        ###############################################
	
	# Procedure: Pause
	# Pauses for whatever amount of seconds
	# Input: $a0 however many milliseconds to pause for
	Pause:
		addiu $sp, $sp, -4
		sw $ra, 0($sp)
		

		move $t0, $a0	# Save timeout argument
		li $v0, 30
		syscall		# get time

		move $t1, $a0	# Save Start time

		ploop:
		syscall		# $t2 = current time-initial time
		subu $t2, $a0, $t1
		bltu $t2, $t0, ploop	# Loop if elapsed < timeout

		# Return
		lw $ra, 0($sp)
		addiu $sp, $sp, 4
		jr $ra
	
	# Procedure: DetermineLose
	# Executed during every drawn pixel of Mario. Depending on start and end x coordinates of barrel, initiate loser sequence.
	# No input
	# Output: If no lose, nothing. If lost, output quitprmt and poll keyboard for new game or not.
	DetermineLose:
		blt $a1, 49152, returnok 	# 128*4*96
		# Draw Mario falling off the map
		lw $t0, initx
		sll $t0, $t0, 2		# initx*4
		blt $a0, $t0, returnok
		lw $t0, endx
		sll $t0, $t0, 2		# endx*4
		bgt $a0, $t0, returnok
		
		# Only executes if Mario touches barrel
		Loser:
		# Reset all global variables
		li $t0, 45
		sw $t0, barrelcount
		li $t0, 1
		sw $t0, random
		sw $t0, start
		li $t0, 14
		sw $t0, count
		li $t0, 2
		sw $t0, barrelspeed
		li $t0, 25
		sw $t0, initx
		li $t0, 37
		sw $t0, endx
		li $t0, 0
		sw $t0, flagcolor
		sw $t0, end
		sw $t0, enabledup
		sw $t0, enableddown
		sw $t0, jumpcount
		sw $t0, score
		sw $t0, up
		sw $t0, down
		
		# Set flag for poll on keyboard
		li $t0, 1
		sw $t0, end
		
		# Display text
		la $a2, quitpmt
		li $a0, 8
		li $a1, 59
		jal OutText
		
		# Poll keyboard
		awaitinputend:
			lw $t0, end		# Changed by interrupt handler
			beq $t0, 1, awaitinputend
		
		# Read user's option
		lw $t0, end
		beq $t0, 'n', Main
		j Exitgame
		
		# Exit
		returnok:
			jr $ra
	
	# $a0 = integer to display
	# $a1 = x-offset
	DrawFromInteger:
	addiu $sp, $sp, -68
	sw $ra, 0($sp)
	sw $a1, 4($sp)
	li $t0, 10
	
	intLoop:
 		div $a0, $t0		# $a0/10
 		mflo $a1			# $a1 = quotient
 		move $a0, $a1			# $a0 = $a0 / 10
		mfhi $a2			# $a2 = remainder
 		addi $a2, $a2, 0x30	# convert to ASCII

		sw $a0, 8($sp)
		sw $a1, 12($sp)
		sw $a2, 16($sp)
		
		la $s2, dispscore
		sw $a2, ($s2)
		
		lw $a1, 4($sp)
		move $a0, $a1
		addiu $a0, $a0, -10
       	 	#li $a0, 1          # some test cases
        	li $a1, 2
        	sw $a0, 4($sp)
        	sw $t0, 20($sp)
        	sw $t1, 24($sp)
        	sw $t2, 28($sp)
        	sw $t3, 32($sp)
        	sw $t4, 36($sp)
        	sw $t5, 40($sp)
        	sw $t6, 44($sp)
        	sw $t7, 48($sp)
        	sw $t8, 52($sp)
        	sw $t9, 56($sp)
        	sw $a3, 60($sp)
        	la $a2, dispscore
		jal OutText
		lw $t0, 20($sp)
        	lw $t1, 24($sp)
        	lw $t2, 28($sp)
        	lw $t3, 32($sp)
        	lw $t4, 36($sp)
        	lw $t5, 40($sp)
        	lw $t6, 44($sp)
        	lw $t7, 48($sp)
        	lw $t8, 52($sp)
        	lw $t9, 56($sp)
        	lw $a3, 60($sp)
		
		lw $a0, 8($sp)
		lw $a1, 12($sp)
		lw $a2, 16($sp)
        	beqz $a1, endIntLoop
        	j intLoop
 	endIntLoop:
 	
	lw $ra, ($sp)
	addiu $sp, $sp, 68
	jr $ra
		
	# Procedure: kIsCharThere
	# Utilized to poll keyboard interface for timeout
	# Returns $v0 = 0 (no data) or 1 (character in buffer)
	IsCharThere:
		lui $t0, 0xFFFF
		lw $t1, ($t0)
		andi $v0, $t1, 1
		jr $ra
	
	# Procedure: GetChar
	# Utilized to poll keyboard interface for timeout. Converts input to ascii character
	# Returns $v0 = ascii character
	GetChar:
		addiu $sp, $sp, -8
		sw $ra, 0($sp)
		j check
	cloop:	li $a0, 1
		jal Pause
	check:	
		jal IsCharThere
		beq $v0, $0, cloop
		lui $t0, 0xffff
		lw $v0, 4($t0)
		# Return
		lw $ra, 0($sp)
		addiu $sp, $sp, 8
		jr $ra
############################################################################################################
#########################           EXCEPTION HANDLER CODE            ######################################

## Kernel data
		.kdata
	__start_msg_:   .asciiz "   "
	__end_msg_:     .asciiz " occurred and ignored\n"
	
	# Messages for each of the 5-bit exception codes
	__exc0_msg:     .asciiz "  [Interrupt] "
	__exc1_msg:     .asciiz "  [TLB]"
	__exc2_msg:     .asciiz "  [TLB]"
	__exc3_msg:     .asciiz "  [TLB]"
	__exc4_msg:     .asciiz "  [Address error in inst/data fetch] "
	__exc5_msg:     .asciiz "  "
	__exc6_msg:     .asciiz "  [Bad instruction address] "
	__exc7_msg:     .asciiz "  [Bad data address] "
	__exc8_msg:     .asciiz "  [Error in syscall] "
	__exc9_msg:     .asciiz "  [Breakpoint] "
	__exc10_msg:    .asciiz "  [Reserved instruction] "
	__exc11_msg:    .asciiz ""
	__exc12_msg:    .asciiz "  [Arithmetic overflow] "
	__exc13_msg:    .asciiz "  [Trap] "
	__exc14_msg:    .asciiz ""
	__exc15_msg:    .asciiz "  [Floating point] "
	__exc16_msg:    .asciiz ""
	__exc17_msg:    .asciiz ""
	__exc18_msg:    .asciiz "  [Coproc 2]"
	__exc19_msg:    .asciiz ""
	__exc20_msg:    .asciiz ""
	__exc21_msg:    .asciiz ""
	__exc22_msg:    .asciiz "  [MDMX]"
	__exc23_msg:    .asciiz "  [Watch]"
	__exc24_msg:    .asciiz "  [Machine check]"
	__exc25_msg:    .asciiz ""
	__exc26_msg:    .asciiz ""
	__exc27_msg:    .asciiz ""
	__exc28_msg:    .asciiz ""
	__exc29_msg:    .asciiz ""
	__exc30_msg:    .asciiz "  [Cache]"
	__exc31_msg:    .asciiz ""
	
	__level_msg:    .asciiz "Interrupt mask: "
	
	
	#########################################################################
	# Lookup table of exception messages
	__exc_msg_table:
		.word   __exc0_msg, __exc1_msg, __exc2_msg, __exc3_msg, __exc4_msg
		.word   __exc5_msg, __exc6_msg, __exc7_msg, __exc8_msg, __exc9_msg
		.word   __exc10_msg, __exc11_msg, __exc12_msg, __exc13_msg, __exc14_msg
		.word   __exc15_msg, __exc16_msg, __exc17_msg, __exc18_msg, __exc19_msg
		.word   __exc20_msg, __exc21_msg, __exc22_msg, __exc23_msg, __exc24_msg
		.word   __exc25_msg, __exc26_msg, __exc27_msg, __exc28_msg, __exc29_msg
		.word   __exc30_msg, __exc31_msg
	
	# Variables for save/restore of registers used in the handler
	save_v0:    .word   0
	save_a0:    .word   0
	save_at:    .word   0

.ktext  0x80000180
	
		# Save ALL registers modified in this handler, except $k0 and $k1
		# This includes $t* since the user code does not explicitly
		# call this handler.  $sp cannot be trusted, so saving them to
		# the stack is not an option.  This routine is not reentrant (can't
		# be called again while it is running), so we can save registers
		# to static variables.
		sw      $v0, save_v0
		sw      $a0, save_a0
		 # Allocate memory to stack
		 addiu $sp, $sp, -16
		 
		 sw $ra, 0($sp)
		 sw $t0, 4($sp)
		 sw $t1, 8($sp)
		 sw $t2, 12($sp)
	
		# $at is the temporary register reserved for the assembler.
		# It may be modified by pseudo-instructions in this handler.
		# Since an interrupt could have occurred during a pseudo
		# instruction in user code, $at must be restored to ensure
		# that that pseudo instruction completes correctly.
		.set    noat
		sw      $at, save_at
		.set    at
	
		# Determine cause of the exception
		mfc0    $k0, $13        # Get cause register from coprocessor 0
		srl     $a0, $k0, 2     # Extract exception code field (bits 2-6)
		andi    $a0, $a0, 0x1f
		
		# Check for program counter issues (exception 6)
		bne     $a0, 6, ok_pc
		nop
	
		mfc0    $a0, $14        # EPC holds PC at moment exception occurred
		andi    $a0, $a0, 0x3   # Is EPC word-aligned (multiple of 4)?
		beqz    $a0, ok_pc
		nop
	
		# Bail out if PC is unaligned
		# Normally you don't want to do syscalls in an exception handler,
		# but this is MARS and not a real computer
		li      $v0, 4
		la      $a0, __exc3_msg
		syscall
		li      $v0, 10
		syscall
	
	ok_pc:
		mfc0    $k0, $13
		srl     $a0, $k0, 2     # Extract exception code from $k0 again
		andi    $a0, $a0, 0x1f
		bnez    $a0, non_interrupt  # Code 0 means exception was an interrupt
		nop
	
		# External interrupt handler
		# Don't skip instruction at EPC since it has not executed.
		# Interrupts occur BEFORE the instruction at PC executes.
		# Other exceptions occur during the execution of the instruction,
		# hence for those increment the return address to avoid
		# re-executing the instruction that caused the exception.
		
		#Check if already jumping
		lw $a0, enabledup
		beq $a0, 1, return
		lw $a0, enableddown
		beq $a0, 1, return
		
		# Print interrupt prompt
		la $a0, working
		li $v0, 4
		syscall
		
	     # check if we are in here because of a character on the keyboard simulator
		 # go to nochar if some other interrupt happened
		
		 jal kIsCharThere
		 beqz $v0, nochar
		 jal kGetChar
		 bne $v0, ' ', nos
		 lw $v0, start
		 beq $v0, 1, nos
		 li $v0, 1
		 sw $v0, enabledup
		nos:
		j	return
	
nochar:
		# not a character
		# Print interrupt level
		# Normally you don't want to do syscalls in an exception handler,
		# but this is MARS and not a real computer
		li      $v0, 4          # print_str
		la      $a0, __level_msg
		syscall
		
		li      $v0, 1          # print_int
		mfc0    $k0, $13        # Cause register
		srl     $a0, $k0, 11    # Right-justify interrupt level bits
		syscall
		
		li      $v0, 11         # print_char
		li      $a0, 10         # Line feed
		syscall
		
		j       return
	
	non_interrupt:
		# Print information about exception.
		# Normally you don't want to do syscalls in an exception handler,
		# but this is MARS and not a real computer
		li      $v0, 4          # print_str
		la      $a0, __start_msg_
		syscall
	
		li      $v0, 1          # print_int
		mfc0    $k0, $13        # Extract exception code again
		srl     $a0, $k0, 2
		andi    $a0, $a0, 0x1f
		syscall
	
		# Print message corresponding to exception code
		# Exception code is already shifted 2 bits from the far right
		# of the cause register, so it conveniently extracts out as
		# a multiple of 4, which is perfect for an array of 4-byte
		# string addresses.
		# Normally you don't want to do syscalls in an exception handler,
		# but this is MARS and not a real computer
		li      $v0, 4          # print_str
		mfc0    $k0, $13        # Extract exception code without shifting
		andi    $a0, $k0, 0x7c
		lw      $a0, __exc_msg_table($a0)
		nop
		syscall
	
		li      $v0, 4          # print_str
		la      $a0, __end_msg_
		syscall
	
		# Return from (non-interrupt) exception. Skip offending instruction
		# at EPC to avoid infinite loop.
		mfc0    $k0, $14
		addiu   $k0, $k0, 4
		mtc0    $k0, $14
	
	return:
		# Restore registers and reset processor state
		lw      $v0, save_v0    # Restore other registers
		lw      $a0, save_a0
	
		.set    noat            # Prevent assembler from modifying $at
		lw      $at, save_at
		.set    at
	
		mtc0    $zero, $13      # Clear Cause register
	
		# Re-enable interrupts, which were automatically disabled
		# when the exception occurred, using read-modify-write cycle.
		mfc0    $k0, $12        # Read status register
		andi    $k0, 0xfffd     # Clear exception level bit
		ori     $k0, 0x0001     # Set interrupt enable bit
		mtc0    $k0, $12        # Write back
		
		# Reload registers
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $t1, 8($sp)
		lw $t2, 12($sp)
		
		 # Deallocate memory to stack
		 addiu $sp, $sp, 16
		# Return from exception on MIPS32:
		eret
	
	# Procedure: kGetChar
	# Utilized to poll keyboard interface for timeout. Converts input to ascii character
	# Returns $v0 = ascii character
	kGetChar:
		addiu $sp, $sp, -8
		sw $ra, 0($sp)
		j kcheck
	kcloop:	jal kPause
	kcheck:	
		jal kIsCharThere
		beq $v0, $0, kcloop
		lui $t0, 0xffff
		lw $v0, 4($t0)
		# Check if end flag enabled
		# Check if start flag enabled
		lw $t0, start
		beqz $t0, interruptcont
		bne $v0, '\n', interruptcont
		li $t0, 0			# reset flag
		sw $t0, start
		interruptcont:
		lw $t0, end	
		beqz $t0, interruptcont2	
		sw $v0, end	# Save char in end
		interruptcont2:
		# Return
		lw $ra, 0($sp)
		addiu $sp, $sp, 8
		jr $ra
	
	# Procedure: kPause
	# Pauses for whatever amount of seconds
	kPause:
		
		addiu $sp, $sp, -4
		sw $ra, 0($sp)
		li $a0, 1000
		move $t0, $a0	# Save timeout argument
		li $v0, 30
		syscall		# get time

		move $t1, $a0	# Save Start time

		kploop:
		syscall		# $t2 = current time-initial time
		subu $t2, $a0, $t1
		bltu $t2, $t0, kploop	# Loop if elapsed < timeout

		# Return
		lw $ra, 0($sp)
		addiu $sp, $sp, 4
		jr $ra
		
	# Procedure: kIsCharThere
	# Utilized to poll keyboard interface for timeout
	# Returns $v0 = 0 (no data) or 1 (character in buffer)
	kIsCharThere:
		lui $t0, 0xFFFF
		lw $t1, ($t0)
		andi $v0, $t1, 1
		jr $ra
	
	
	#########################################################################
	# Standard startup code.  Invoke the routine "main" with arguments:
	# main(argc, argv, envp)
	
		.text
		.globl __start
	__start:
		lw      $a0, 0($sp)     # argc = *$sp
		addiu   $a1, $sp, 4     # argv = $sp + 4
		addiu   $a2, $sp, 8     # envp = $sp + 8
		sll     $v0, $a0, 2     # envp += size of argv array
		addu    $a2, $a2, $v0
		jal     Main
		nop
	
		li      $v0, 10         # exit
		syscall
	
		.globl __eoth
	__eoth:
