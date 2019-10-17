	.file	"floatsisf.c"
	.option nopic
	.text
	.globl	__clzsi2
	.align	2
	.globl	__floatsisf
	.type	__floatsisf, @function
__floatsisf:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	beqz	a0,.L9
	srai	a5,a0,31
	xor	s0,a5,a0
	sub	s0,s0,a5
	mv	s1,a0
	mv	a0,s0
	call	__clzsi2
	li	a5,158
	sub	a4,a5,a0
	li	a5,150
	srli	s1,s1,31
	bgt	a4,a5,.L4
	li	a3,8
	andi	a5,a4,0xff
	ble	a0,a3,.L18
	addi	a0,a0,-8
	sll	s0,s0,a0
.L18:
	slli	s0,s0,9
	srli	s0,s0,9
	j	.L2
.L9:
	li	s1,0
	li	a5,0
	li	s0,0
.L2:
	slli	s0,s0,9
	srli	a0,s0,9
	lw	ra,12(sp)
	lw	s0,8(sp)
	slli	a5,a5,23
	slli	s1,s1,31
	or	a0,a0,a5
	or	a0,a0,s1
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L4:
	li	a5,153
	ble	a4,a5,.L6
	addi	a5,a0,27
	li	a3,5
	sll	a5,s0,a5
	sub	a3,a3,a0
	srl	s0,s0,a3
	snez	a5,a5
	or	s0,s0,a5
.L6:
	li	a5,5
	ble	a0,a5,.L7
	addi	a5,a0,-5
	sll	s0,s0,a5
.L7:
	li	a3,-67108864
	addi	a3,a3,-1
	andi	a5,s0,7
	and	a2,s0,a3
	beqz	a5,.L8
	andi	a5,s0,15
	li	a1,4
	beq	a5,a1,.L8
	addi	a2,a2,4
	slli	a5,a2,5
	bgez	a5,.L8
	li	a5,159
	and	a2,a2,a3
	sub	a4,a5,a0
.L8:
	slli	s0,a2,6
	srli	s0,s0,9
	andi	a5,a4,0xff
	j	.L2
	.size	__floatsisf, .-__floatsisf
	.ident	"GCC: (GNU) 8.3.0"
