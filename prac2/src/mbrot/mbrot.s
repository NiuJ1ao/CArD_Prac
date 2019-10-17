	.file	"mbrot.c"
	.option nopic
	.text
	.align	2
	.globl	fill
	.type	fill, @function
fill:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	mv	s2,a0
	li	s0,0
	li	s1,65536
.L2:
	mv	a0,s0
	mv	a1,s2
	addi	s0,s0,1
	call	putpix
	bne	s0,s1,.L2
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	fill, .-fill
	.globl	__subsf3
	.globl	__mulsf3
	.globl	__addsf3
	.globl	__divsf3
	.globl	__floatunsisf
	.globl	__gtsf2
	.align	2
	.globl	mbrot
	.type	mbrot, @function
mbrot:
	lui	a3,%hi(MinRe_tab)
	slli	a5,a0,2
	addi	a3,a3,%lo(MinRe_tab)
	lui	a4,%hi(MaxRe_tab)
	addi	sp,sp,-96
	add	a3,a5,a3
	addi	a4,a4,%lo(MaxRe_tab)
	sw	s10,48(sp)
	add	a4,a5,a4
	lw	s10,0(a3)
	lw	a0,0(a4)
	lui	a4,%hi(MinIm_tab)
	addi	a4,a4,%lo(MinIm_tab)
	add	a5,a5,a4
	mv	a1,s10
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	lw	s1,0(a5)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	sw	s7,60(sp)
	sw	s8,56(sp)
	sw	s9,52(sp)
	sw	s11,44(sp)
	call	__subsf3
	lui	a5,%hi(.LC0)
	lw	a1,%lo(.LC0)(a5)
	mv	s2,a0
	lui	s0,%hi(.LC2)
	call	__mulsf3
	lui	a5,%hi(.LC1)
	lw	a1,%lo(.LC1)(a5)
	call	__mulsf3
	mv	a1,s1
	call	__addsf3
	lw	a1,%lo(.LC2)(s0)
	mv	s3,a0
	sw	a0,16(sp)
	mv	a0,s2
	call	__divsf3
	sw	a0,4(sp)
	mv	a1,s1
	mv	a0,s3
	call	__subsf3
	lw	a1,%lo(.LC2)(s0)
	call	__divsf3
	sw	a0,20(sp)
 #APP
# 79 "mbrot.c" 1
	csrr s0, 0x0C01
# 0 "" 2
 #NO_APP
	call	get_switches
	srli	a5,a0,1
	andi	a5,a5,1
	addi	a5,a5,1
	li	a4,100
	mul	a5,a5,a4
	sw	zero,12(sp)
	li	s7,30
	sw	a5,24(sp)
	lui	a5,%hi(.LC3)
	lw	s6,%lo(.LC3)(a5)
	li	a5,50
	sub	a5,a5,s0
	sw	a5,28(sp)
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	sw	a5,8(sp)
.L11:
	lw	s0,12(sp)
	li	s8,0
	mv	a0,s0
	call	__floatunsisf
	lw	a1,20(sp)
	call	__mulsf3
	mv	a1,a0
	lw	a0,16(sp)
	call	__subsf3
	slli	a5,s0,8
	mv	s5,a0
	sw	a5,0(sp)
.L10:
	mv	a0,s8
	call	__floatunsisf
	lw	a1,4(sp)
	mv	s0,s5
	li	s1,0
	call	__mulsf3
	mv	a1,s10
	call	__addsf3
	lw	a5,0(sp)
	mv	s4,a0
	mv	s11,a0
	add	s9,a5,s8
	j	.L8
.L21:
	mv	a0,s11
	call	__addsf3
	mv	a1,s0
	call	__mulsf3
	mv	a1,s5
	call	__addsf3
	mv	a1,s3
	mv	s0,a0
	mv	a0,s2
	call	__subsf3
	mv	a1,s4
	call	__addsf3
	addi	s1,s1,1
	mv	s11,a0
	beq	s1,s7,.L20
.L8:
	mv	a1,s11
	mv	a0,s11
	call	__mulsf3
	mv	s2,a0
	mv	a1,s0
	mv	a0,s0
	call	__mulsf3
	mv	a1,a0
	mv	s3,a0
	mv	a0,s2
	call	__addsf3
	mv	a1,s6
	call	__gtsf2
	mv	a1,s11
	blez	a0,.L21
	lw	a5,8(sp)
	slli	s1,s1,2
	mv	a0,s9
	add	s1,a5,s1
	lw	a1,0(s1)
	call	putpix
.L12:
	addi	s8,s8,1
	li	a5,256
	bne	s8,a5,.L10
 #APP
# 114 "mbrot.c" 1
	csrr a0, 0x0C01
# 0 "" 2
 #NO_APP
	lw	a5,28(sp)
	add	a0,a0,a5
	lw	a5,24(sp)
	divu	a0,a0,a5
	lw	a5,12(sp)
	addi	a5,a5,1
	mv	s0,a5
	sw	a5,12(sp)
	call	put_ssd
	bne	s0,s8,.L11
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	li	a0,0
	addi	sp,sp,96
	jr	ra
.L20:
	li	a1,0
	mv	a0,s9
	call	putpix
	j	.L12
	.size	mbrot, .-mbrot
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s1,20(sp)
	sw	s3,12(sp)
	sw	s2,16(sp)
	call	get_switches
	srli	s0,a0,1
	andi	s0,s0,1
	li	a5,100
	addi	s0,s0,1
	li	a0,0
	mul	s0,s0,a5
	li	s1,0
	call	put_ssd
	li	s3,100
.L24:
	li	a0,0
	call	fill
	mv	a0,s1
	call	put_leds
 #APP
# 134 "mbrot.c" 1
	csrr s2, 0x0C01
# 0 "" 2
 #NO_APP
	mv	a0,s1
	call	mbrot
 #APP
# 136 "mbrot.c" 1
	csrr a0, 0x0C01
# 0 "" 2
 #NO_APP
	addi	a0,a0,50
	sub	a0,a0,s2
	divu	a0,a0,s0
	call	put_ssd
.L23:
	call	get_btns
	andi	a0,a0,8
	beqz	a0,.L23
	call	get_switches
	andi	s1,a0,1
	call	get_switches
	srli	s0,a0,1
	andi	s0,s0,1
	addi	s0,s0,1
	mul	s0,s0,s3
	j	.L24
	.size	main, .-main
	.globl	MinIm_tab
	.globl	MaxRe_tab
	.globl	MinRe_tab
	.globl	cmap
	.comm	py,1,1
	.comm	px,1,1
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cmap, @object
	.size	cmap, 128
cmap:
	.word	4329246
	.word	2626574
	.word	1645063
	.word	1123075
	.word	601857
	.word	407555
	.word	280836
	.word	153605
	.word	25607
	.word	423700
	.word	821804
	.word	1219388
	.word	1618258
	.word	2670692
	.word	3789181
	.word	3791768
	.word	6284725
	.word	8843189
	.word	11335888
	.word	13891820
	.word	14867434
	.word	15843305
	.word	16027608
	.word	16277449
	.word	16461753
	.word	16711850
	.word	15007893
	.word	13369472
	.word	11665515
	.word	10027351
	.word	8454982
	.word	6947636
	.section	.srodata,"a"
	.align	2
	.type	MinIm_tab, @object
	.size	MinIm_tab, 8
MinIm_tab:
	.word	3214514586
	.word	1039159710
	.type	MaxRe_tab, @object
	.size	MaxRe_tab, 8
MaxRe_tab:
	.word	1065353216
	.word	3208818369
	.type	MinRe_tab, @object
	.size	MinRe_tab, 8
MinRe_tab:
	.word	3221225472
	.word	3209421143
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC0:
	.word	1132462080
.LC1:
	.word	998244352
.LC2:
	.word	1132396544
.LC3:
	.word	1082130432
	.ident	"GCC: (GNU) 8.3.0"
