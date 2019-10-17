	.file	"divsf3.c"
	.option nopic
	.text
	.globl	__clzsi2
	.align	2
	.globl	__divsf3
	.type	__divsf3, @function
__divsf3:
	addi	sp,sp,-64
	srli	a5,a0,23
	sw	s2,48(sp)
	sw	s5,36(sp)
	sw	s7,28(sp)
	slli	s5,a0,9
	srli	s2,a0,31
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s6,32(sp)
	andi	a5,a5,0xff
	srli	s5,s5,9
	mv	s7,s2
	beqz	a5,.L2
	li	a4,255
	beq	a5,a4,.L3
	slli	s5,s5,3
	li	a4,67108864
	or	s5,s5,a4
	addi	s4,a5,-127
	li	s0,0
	li	s6,0
.L4:
	srli	a5,a1,23
	slli	s1,a1,9
	andi	a5,a5,0xff
	srli	s1,s1,9
	srli	s3,a1,31
	beqz	a5,.L5
	li	a4,255
	beq	a5,a4,.L6
	li	a4,67108864
	slli	s1,s1,3
	addi	a5,a5,-127
	or	s1,s1,a4
	sub	s4,s4,a5
	li	a4,0
.L7:
	or	s0,a4,s0
	lui	a5,%hi(.L11)
	addi	a5,a5,%lo(.L11)
	slli	s0,s0,2
	add	s0,s0,a5
	lw	a5,0(s0)
	xor	s2,s2,s3
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L11:
	.word	.L9
	.word	.L28
	.word	.L60
	.word	.L13
	.word	.L60
	.word	.L45
	.word	.L60
	.word	.L13
	.word	.L28
	.word	.L28
	.word	.L45
	.word	.L13
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L45
	.text
.L6:
	addi	s4,s4,-255
	bnez	s1,.L62
	li	a4,2
.L8:
	or	s0,a4,s0
	lui	a5,%hi(.L29)
	addi	a5,a5,%lo(.L29)
	slli	s0,s0,2
	add	s0,s0,a5
	lw	a5,0(s0)
	xor	s2,s2,s3
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L29:
	.word	.L28
	.word	.L28
	.word	.L60
	.word	.L30
	.word	.L60
	.word	.L45
	.word	.L60
	.word	.L30
	.word	.L28
	.word	.L28
	.word	.L45
	.word	.L30
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L45
	.text
.L45:
	li	s2,0
	li	a4,255
	li	a5,4194304
.L10:
	slli	a0,a5,9
	lw	ra,60(sp)
	lw	s0,56(sp)
	slli	a5,a4,23
	srli	a0,a0,9
	slli	s2,s2,31
	or	a0,a0,a5
	or	a0,a0,s2
	lw	s1,52(sp)
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	addi	sp,sp,64
	jr	ra
.L28:
	li	a4,255
	li	a5,0
	j	.L10
.L13:
	mv	s5,s1
	mv	s7,s3
	mv	s6,a4
.L12:
	li	a5,2
	beq	s6,a5,.L21
	li	a5,3
	beq	s6,a5,.L45
	li	a5,1
	beq	s6,a5,.L22
.L20:
	addi	a4,s4,127
	andi	s2,s7,1
	blez	a4,.L23
	andi	a5,s5,7
	beqz	a5,.L24
	andi	a5,s5,15
	li	a3,4
	beq	a5,a3,.L24
	addi	s5,s5,4
.L24:
	slli	a5,s5,4
	bgez	a5,.L25
	li	a5,-134217728
	addi	a5,a5,-1
	and	s5,s5,a5
	addi	a4,s4,128
.L25:
	li	a5,254
	bgt	a4,a5,.L28
	slli	a5,s5,6
	srli	a5,a5,9
	andi	a4,a4,0xff
	j	.L10
.L5:
	bnez	s1,.L63
	li	a4,1
	j	.L8
.L2:
	bnez	s5,.L64
	li	s0,4
	li	s4,0
	li	s6,1
	j	.L4
.L3:
	bnez	s5,.L33
	li	s0,8
	li	s4,255
	li	s6,2
	j	.L4
.L62:
	li	a4,3
	j	.L7
.L33:
	li	s0,12
	li	s4,255
	li	s6,3
	j	.L4
.L64:
	mv	a0,s5
	sw	a1,12(sp)
	call	__clzsi2
	addi	a5,a0,-5
	sll	s5,s5,a5
	li	a5,-118
	sub	s4,a5,a0
	li	s0,0
	li	s6,0
	lw	a1,12(sp)
	j	.L4
.L63:
	mv	a0,s1
	call	__clzsi2
	addi	a4,a0,-5
	add	a5,s4,a0
	sll	s1,s1,a4
	addi	s4,a5,118
	li	a4,0
	j	.L7
.L22:
	andi	s2,s7,1
.L60:
	li	a4,0
	li	a5,0
	j	.L10
.L9:
	li	a2,65536
	slli	a0,s1,5
	addi	a2,a2,-1
	srli	a5,a0,16
	and	a2,a0,a2
	bgeu	s5,s1,.L16
	divu	a1,s5,a5
	addi	s4,s4,-1
	mv	a3,s5
	li	a4,0
	mul	a6,a1,a2
.L17:
	remu	a3,a3,a5
	slli	a3,a3,16
	or	a4,a3,a4
	bgeu	a4,a6,.L18
	add	a4,a4,a0
	addi	a3,a1,-1
	bgtu	a0,a4,.L38
	bgeu	a4,a6,.L38
	addi	a1,a1,-2
	add	a4,a4,a0
.L18:
	sub	a4,a4,a6
	divu	a3,a4,a5
	remu	a4,a4,a5
	mul	s5,a3,a2
	slli	a5,a4,16
	bgeu	a5,s5,.L19
	add	a5,a5,a0
	addi	a4,a3,-1
	bgtu	a0,a5,.L40
	bleu	s5,a5,.L40
	addi	a3,a3,-2
	add	a5,a5,a0
.L19:
	slli	a1,a1,16
	sub	s5,a5,s5
	or	a1,a1,a3
	snez	s5,s5
	or	s5,a1,s5
	mv	s7,s2
	j	.L20
.L23:
	li	a3,1
	sub	a3,a3,a4
	beqz	a4,.L26
	li	a2,27
	li	a4,0
	li	a5,0
	bgt	a3,a2,.L10
.L26:
	addi	s4,s4,158
	sll	s4,s5,s4
	srl	a5,s5,a3
	snez	s5,s4
	or	a5,a5,s5
	andi	a4,a5,7
	beqz	a4,.L27
	andi	a4,a5,15
	li	a3,4
	beq	a4,a3,.L27
	addi	a5,a5,4
.L27:
	slli	a4,a5,5
	bltz	a4,.L44
	slli	a5,a5,6
	srli	a5,a5,9
	li	a4,0
	j	.L10
.L16:
	srli	a3,s5,1
	divu	a1,a3,a5
	slli	a4,s5,31
	srli	a4,a4,16
	mul	a6,a1,a2
	j	.L17
.L30:
	mv	s7,s3
	mv	s6,a4
	li	s5,0
	j	.L12
.L40:
	mv	a3,a4
	j	.L19
.L38:
	mv	a1,a3
	j	.L18
.L44:
	li	a4,1
	li	a5,0
	j	.L10
.L21:
	andi	s2,s7,1
	li	a4,255
	li	a5,0
	j	.L10
	.size	__divsf3, .-__divsf3
	.ident	"GCC: (GNU) 8.3.0"
