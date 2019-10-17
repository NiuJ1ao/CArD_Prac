	.file	"mulsf3.c"
	.option nopic
	.text
	.globl	__clzsi2
	.align	2
	.globl	__mulsf3
	.type	__mulsf3, @function
__mulsf3:
	addi	sp,sp,-48
	sw	s0,40(sp)
	srli	s0,a0,23
	sw	s3,28(sp)
	sw	s4,24(sp)
	slli	s3,a0,9
	sw	ra,44(sp)
	sw	s1,36(sp)
	sw	s2,32(sp)
	sw	s5,20(sp)
	sw	s6,16(sp)
	andi	s0,s0,0xff
	srli	s3,s3,9
	srli	s4,a0,31
	beqz	s0,.L2
	li	a5,255
	beq	s0,a5,.L3
	slli	a5,s3,3
	li	a4,67108864
	or	s3,a5,a4
	addi	s0,s0,-127
	li	s1,0
	li	s6,0
.L4:
	srli	a4,a1,23
	slli	s5,a1,9
	andi	a4,a4,0xff
	srli	s5,s5,9
	srli	s2,a1,31
	beqz	a4,.L5
.L52:
	li	a5,255
	beq	a4,a5,.L6
	slli	s5,s5,3
	addi	a4,a4,-127
	li	a5,67108864
	or	s5,s5,a5
	add	s0,s0,a4
	li	a3,0
.L7:
	xor	a0,s4,s2
	li	a5,15
	mv	a4,a0
	addi	a2,s0,1
	bgtu	s1,a5,.L10
	lui	a5,%hi(.L12)
	addi	a5,a5,%lo(.L12)
	slli	s1,s1,2
	add	s1,s1,a5
	lw	a5,0(s1)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L12:
	.word	.L10
	.word	.L49
	.word	.L49
	.word	.L14
	.word	.L15
	.word	.L15
	.word	.L29
	.word	.L14
	.word	.L15
	.word	.L29
	.word	.L15
	.word	.L14
	.word	.L13
	.word	.L13
	.word	.L13
	.word	.L29
	.text
.L6:
	addi	s0,s0,255
	bnez	s5,.L9
	ori	s1,s1,2
	li	a3,2
	j	.L7
.L29:
	li	a0,0
	li	a4,255
	li	a5,4194304
.L11:
	lw	ra,44(sp)
	lw	s0,40(sp)
	slli	a5,a5,9
	slli	a4,a4,23
	srli	a5,a5,9
	slli	a0,a0,31
	or	a5,a5,a4
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	or	a0,a5,a0
	addi	sp,sp,48
	jr	ra
.L14:
	mv	a4,s2
.L49:
	mv	s3,s5
	mv	s6,a3
.L15:
	li	a5,2
	beq	s6,a5,.L19
.L53:
	li	a5,3
	beq	s6,a5,.L29
	li	a5,1
	mv	a0,a4
	bne	s6,a5,.L20
	li	a4,0
	li	a5,0
	j	.L11
.L2:
	bnez	s3,.L51
	srli	a4,a1,23
	slli	s5,a1,9
	andi	a4,a4,0xff
	li	s1,4
	li	s0,0
	li	s6,1
	srli	s5,s5,9
	srli	s2,a1,31
	bnez	a4,.L52
.L5:
	bnez	s5,.L8
	ori	s1,s1,1
	li	a3,1
	j	.L7
.L3:
	bnez	s3,.L27
	li	s1,8
	li	s0,255
	li	s6,2
	j	.L4
.L8:
	mv	a0,s5
	call	__clzsi2
	addi	a5,a0,-5
	sub	s0,s0,a0
	sll	s5,s5,a5
	addi	s0,s0,-118
	li	a3,0
	j	.L7
.L27:
	li	s1,12
	li	s0,255
	li	s6,3
	j	.L4
.L51:
	mv	a0,s3
	sw	a1,12(sp)
	call	__clzsi2
	addi	a5,a0,-5
	li	s0,-118
	sll	s3,s3,a5
	sub	s0,s0,a0
	li	s1,0
	li	s6,0
	lw	a1,12(sp)
	j	.L4
.L9:
	ori	s1,s1,3
	li	a3,3
	j	.L7
.L13:
	li	a5,2
	mv	a4,s4
	bne	s6,a5,.L53
.L19:
	mv	a0,a4
	li	a5,0
	li	a4,255
	j	.L11
.L10:
	li	t1,65536
	addi	a3,t1,-1
	srli	a1,s3,16
	srli	a7,s5,16
	and	a5,s3,a3
	and	s5,s5,a3
	mul	a6,a5,s5
	mul	s3,a7,a5
	srli	a4,a6,16
	mul	s5,a1,s5
	add	s3,s3,s5
	add	a4,a4,s3
	mul	a1,a1,a7
	bleu	s5,a4,.L17
	add	a1,a1,t1
.L17:
	li	a5,65536
	addi	a5,a5,-1
	and	a3,a4,a5
	and	a6,a6,a5
	slli	a3,a3,16
	add	a3,a3,a6
	slli	s3,a3,6
	srli	a5,a4,16
	snez	s3,s3
	srli	a3,a3,26
	add	a5,a5,a1
	slli	a5,a5,6
	or	a3,s3,a3
	or	s3,a5,a3
	slli	a5,s3,4
	bgez	a5,.L18
	srli	a4,s3,1
	andi	a5,s3,1
	or	s3,a4,a5
	mv	s0,a2
.L18:
	addi	a4,s0,127
	blez	a4,.L21
	andi	a5,s3,7
	beqz	a5,.L22
	andi	a5,s3,15
	li	a3,4
	beq	a5,a3,.L22
	addi	s3,s3,4
.L22:
	slli	a5,s3,4
	bgez	a5,.L23
	li	a5,-134217728
	addi	a5,a5,-1
	and	s3,s3,a5
	addi	a4,s0,128
.L23:
	li	a5,254
	bgt	a4,a5,.L30
	slli	a5,s3,6
	srli	a5,a5,9
	andi	a4,a4,0xff
	j	.L11
.L21:
	li	a5,1
	sub	a3,a5,a4
	beqz	a4,.L24
	li	a2,27
	li	a4,0
	li	a5,0
	bgt	a3,a2,.L11
.L24:
	addi	a4,s0,158
	sll	a4,s3,a4
	snez	a4,a4
	srl	a5,s3,a3
	or	a5,a5,a4
	andi	a4,a5,7
	beqz	a4,.L25
	andi	a4,a5,15
	li	a3,4
	beq	a4,a3,.L25
	addi	a5,a5,4
.L25:
	slli	a4,a5,5
	bltz	a4,.L32
	slli	a5,a5,6
	srli	a5,a5,9
	li	a4,0
	j	.L11
.L30:
	li	a4,255
	li	a5,0
	j	.L11
.L20:
	mv	s0,a2
	j	.L18
.L32:
	li	a4,1
	li	a5,0
	j	.L11
	.size	__mulsf3, .-__mulsf3
	.ident	"GCC: (GNU) 8.3.0"
