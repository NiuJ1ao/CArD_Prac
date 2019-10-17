	.file	"floatunsisf.c"
	.option nopic
	.text
	.globl	__clzsi2
	.align	2
	.globl	__floatunsisf
	.type	__floatunsisf, @function
__floatunsisf:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	beqz	a0,.L8
	mv	s0,a0
	call	__clzsi2
	li	a5,158
	sub	a4,a5,a0
	li	a5,150
	bgt	a4,a5,.L3
	li	a3,8
	andi	a5,a4,0xff
	ble	a0,a3,.L17
	addi	a0,a0,-8
	sll	s0,s0,a0
.L17:
	slli	s0,s0,9
	srli	s0,s0,9
	slli	s0,s0,9
	srli	a0,s0,9
	lw	ra,12(sp)
	lw	s0,8(sp)
	slli	a5,a5,23
	or	a0,a0,a5
	addi	sp,sp,16
	jr	ra
.L8:
	li	s0,0
	slli	s0,s0,9
	srli	a0,s0,9
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a5,0
	slli	a5,a5,23
	or	a0,a0,a5
	addi	sp,sp,16
	jr	ra
.L3:
	li	a5,153
	ble	a4,a5,.L5
	addi	a5,a0,27
	li	a3,5
	sll	a5,s0,a5
	sub	a3,a3,a0
	snez	a5,a5
	srl	s0,s0,a3
	or	s0,a5,s0
.L5:
	li	a5,5
	ble	a0,a5,.L6
	addi	a5,a0,-5
	sll	s0,s0,a5
.L6:
	li	a3,-67108864
	addi	a3,a3,-1
	andi	a5,s0,7
	and	a2,s0,a3
	beqz	a5,.L7
	andi	a5,s0,15
	li	a1,4
	beq	a5,a1,.L7
	addi	a2,a2,4
	slli	a5,a2,5
	bgez	a5,.L7
	li	a5,159
	and	a2,a2,a3
	sub	a4,a5,a0
.L7:
	slli	s0,a2,6
	srli	s0,s0,9
	slli	s0,s0,9
	srli	a0,s0,9
	lw	ra,12(sp)
	lw	s0,8(sp)
	andi	a5,a4,0xff
	slli	a5,a5,23
	or	a0,a0,a5
	addi	sp,sp,16
	jr	ra
	.size	__floatunsisf, .-__floatunsisf
	.ident	"GCC: (GNU) 8.3.0"
