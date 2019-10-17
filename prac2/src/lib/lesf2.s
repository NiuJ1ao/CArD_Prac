	.file	"lesf2.c"
	.option nopic
	.text
	.align	2
	.globl	__lesf2
	.type	__lesf2, @function
__lesf2:
	srli	a3,a0,23
	li	a5,8388608
	addi	a5,a5,-1
	srli	a2,a1,23
	andi	a3,a3,0xff
	li	a6,255
	and	a7,a5,a0
	srli	a4,a0,31
	and	a5,a5,a1
	andi	a2,a2,0xff
	srli	a0,a1,31
	beq	a3,a6,.L52
	beq	a2,a6,.L53
.L5:
	bnez	a3,.L18
	bnez	a2,.L9
	bnez	a5,.L9
	li	a0,0
	bnez	a7,.L8
.L1:
	ret
.L53:
	beqz	a5,.L5
.L31:
	li	a0,2
	ret
.L9:
	beqz	a7,.L54
	beq	a4,a0,.L55
.L8:
	li	a0,1
	beqz	a4,.L1
.L44:
	li	a0,-1
	ret
.L52:
	bnez	a7,.L31
	beq	a2,a3,.L56
.L18:
	bnez	a2,.L7
	beqz	a5,.L8
.L7:
	bne	a4,a0,.L8
	ble	a3,a2,.L10
	bnez	a0,.L44
	li	a0,1
	ret
.L54:
	beqz	a0,.L44
	ret
.L56:
	beqz	a5,.L7
	j	.L31
.L55:
	li	a3,0
.L10:
	bgt	a2,a3,.L47
	bgtu	a7,a5,.L8
	li	a0,0
	bgeu	a7,a5,.L1
.L47:
	beqz	a4,.L44
	mv	a0,a4
	ret
	.size	__lesf2, .-__lesf2
	.globl	__ltsf2
	.set	__ltsf2,__lesf2
	.ident	"GCC: (GNU) 8.3.0"
