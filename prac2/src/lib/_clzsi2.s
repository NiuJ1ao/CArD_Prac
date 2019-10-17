	.file	"_clzsi2.c"
	.option nopic
	.text
	.align	2
	.globl	__clzsi2
	.type	__clzsi2, @function
__clzsi2:
	li	a4,5
	li	a5,16
	li	a2,32
	li	a1,1
.L5:
	sra	a3,a0,a5
	addi	a4,a4,-1
	beqz	a3,.L2
	beq	a5,a1,.L11
	sub	a2,a2,a5
	mv	a0,a3
.L2:
	srai	a5,a5,1
	bnez	a4,.L5
	sub	a0,a2,a0
	ret
.L11:
	addi	a0,a2,-2
	ret
	.size	__clzsi2, .-__clzsi2
	.ident	"GCC: (GNU) 8.3.0"
