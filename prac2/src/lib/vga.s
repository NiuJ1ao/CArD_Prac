	.file	"vga.c"
	.option nopic
	.text
	.align	2
	.globl	putpix
	.type	putpix, @function
putpix:
 #APP
# 32 "vga.c" 1
	csrw 0x07C4, a0
# 0 "" 2
# 33 "vga.c" 1
	csrw 0x07C5, a1
# 0 "" 2
# 34 "vga.c" 1
	csrw 0x07C7, 1
# 0 "" 2
 #NO_APP
	ret
	.size	putpix, .-putpix
	.align	2
	.globl	put_leds
	.type	put_leds, @function
put_leds:
 #APP
# 40 "vga.c" 1
	csrw 0x07C1, a0
# 0 "" 2
 #NO_APP
	ret
	.size	put_leds, .-put_leds
	.align	2
	.globl	put_ssd
	.type	put_ssd, @function
put_ssd:
 #APP
# 45 "vga.c" 1
	csrw 0x07C2, a0
# 0 "" 2
 #NO_APP
	ret
	.size	put_ssd, .-put_ssd
	.align	2
	.globl	get_btns
	.type	get_btns, @function
get_btns:
 #APP
# 50 "vga.c" 1
	csrr a0, 0xFC3
# 0 "" 2
 #NO_APP
	ret
	.size	get_btns, .-get_btns
	.align	2
	.globl	get_switches
	.type	get_switches, @function
get_switches:
 #APP
# 55 "vga.c" 1
	csrr a0, 0xFC2
# 0 "" 2
 #NO_APP
	ret
	.size	get_switches, .-get_switches
	.ident	"GCC: (GNU) 8.3.0"
