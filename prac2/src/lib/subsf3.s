	.file	"subsf3.c"
	.option nopic
	.text
	.globl	__clzsi2
	.align	2
	.globl	__subsf3
	.type	__subsf3, @function
__subsf3:
	li	a4,8388608
	addi	sp,sp,-16
	addi	a4,a4,-1
	srli	a3,a0,23
	srli	a6,a1,23
	and	a5,a4,a0
	andi	a3,a3,0xff
	srli	t4,a0,31
	and	a2,a4,a1
	sw	s1,4(sp)
	sw	s2,0(sp)
	andi	a6,a6,0xff
	sw	ra,12(sp)
	sw	s0,8(sp)
	li	t1,255
	mv	t3,a5
	mv	s2,a3
	mv	s1,t4
	slli	t5,a5,3
	srli	a1,a1,31
	slli	a0,a2,3
	sub	a7,a3,a6
	beq	a6,t1,.L103
.L2:
	xori	a1,a1,1
	beq	t4,a1,.L104
	blez	a7,.L22
	bnez	a6,.L23
	beqz	a0,.L52
	addi	a7,a7,-1
	sub	a5,t5,a0
	beqz	a7,.L25
	li	a5,255
	beq	a3,a5,.L10
.L26:
	li	a5,27
	bgt	a7,a5,.L105
	li	a4,32
	sub	a4,a4,a7
	sll	a4,a0,a4
	srl	a5,a0,a7
	snez	a4,a4
	or	a5,a5,a4
.L49:
	sub	a5,t5,a5
.L25:
	slli	a4,a5,5
	bgez	a4,.L19
	li	s0,67108864
	addi	s0,s0,-1
	and	s0,a5,s0
.L38:
	mv	a0,s0
	call	__clzsi2
	addi	a0,a0,-5
	sll	a5,s0,a0
	bgt	s2,a0,.L39
	sub	a0,a0,s2
	addi	s0,a0,1
	li	a4,32
	sub	a4,a4,s0
	sll	a4,a5,a4
	snez	a4,a4
	srl	a5,a5,s0
	or	a5,a5,a4
	li	s2,0
.L35:
.L40:
	andi	a4,a5,7
	beqz	a4,.L41
.L53:
	andi	a4,a5,15
	li	a3,4
	beq	a4,a3,.L41
	addi	a5,a5,4
.L41:
	slli	a4,a5,5
	bgez	a4,.L42
	addi	a3,s2,1
	li	a4,255
	andi	t4,s1,1
	beq	a3,a4,.L20
	slli	a5,a5,6
	srli	a5,a5,9
	andi	a3,a3,0xff
.L18:
	slli	a5,a5,9
	lw	ra,12(sp)
	lw	s0,8(sp)
	srli	a0,a5,9
	slli	a3,a3,23
	slli	a5,t4,31
	or	a0,a0,a3
	lw	s1,4(sp)
	lw	s2,0(sp)
	or	a0,a0,a5
	addi	sp,sp,16
	jr	ra
.L22:
	bnez	a7,.L106
	addi	a4,a3,1
	andi	a4,a4,254
	bnez	a4,.L31
	bnez	a3,.L32
	beqz	t5,.L107
	beqz	a0,.L18
	sub	a5,t5,a0
	slli	a4,a5,5
	bgez	a4,.L34
	sub	a5,a0,t5
	li	s2,0
	mv	s1,a1
	j	.L40
.L103:
	beqz	a0,.L2
	beq	t4,a1,.L5
	blez	a7,.L22
.L23:
	li	a5,255
	beq	a3,a5,.L10
	li	a5,67108864
	or	a0,a0,a5
	j	.L26
.L104:
	blez	a7,.L5
	beqz	a6,.L108
	li	a5,255
	beq	a3,a5,.L10
	li	a5,67108864
	or	a0,a0,a5
.L11:
	li	a5,27
	bgt	a7,a5,.L109
	li	a4,32
	sub	a4,a4,a7
	sll	a4,a0,a4
	srl	a5,a0,a7
	snez	a4,a4
	or	a5,a5,a4
.L45:
	add	a5,a5,t5
.L9:
	slli	a4,a5,5
	bgez	a4,.L19
	addi	s2,s2,1
	li	a4,255
	beq	s2,a4,.L20
	li	a3,2113929216
	srli	a4,a5,1
	addi	a3,a3,-1
	andi	a5,a5,1
	and	a4,a4,a3
	or	a5,a4,a5
	j	.L40
.L106:
	sub	a4,a6,a3
	bnez	a3,.L28
	beqz	t5,.L60
	addi	a4,a4,-1
	beqz	a4,.L110
	li	a5,255
	bne	a6,a5,.L30
.L62:
	mv	s1,a1
.L100:
	mv	t3,a2
.L10:
	beqz	t3,.L111
.L67:
	li	t4,0
	li	a3,255
	li	a5,4194304
	j	.L18
.L108:
	beqz	a0,.L52
	addi	a7,a7,-1
	add	a5,t5,a0
	beqz	a7,.L9
	li	a5,255
	bne	a3,a5,.L11
	j	.L10
.L5:
	bnez	a7,.L112
	addi	s2,a3,1
	andi	a4,s2,254
	bnez	a4,.L16
	bnez	a3,.L17
	beqz	t5,.L57
	beqz	a0,.L18
	add	a5,t5,a0
	slli	a4,a5,5
	li	s2,0
	bgez	a4,.L19
	li	a4,-67108864
	addi	a4,a4,-1
	and	a5,a5,a4
	li	s2,1
.L19:
	andi	a4,a5,7
	bnez	a4,.L53
.L42:
	srli	t3,a5,3
.L52:
	li	a5,255
	beq	s2,a5,.L10
	slli	a5,t3,9
	srli	a5,a5,9
	andi	a3,s2,0xff
	andi	t4,s1,1
	j	.L18
.L111:
	andi	t4,s1,1
.L20:
	li	a3,255
	li	a5,0
	j	.L18
.L39:
	li	a4,-67108864
	addi	a4,a4,-1
	and	a5,a5,a4
	andi	a4,a5,7
	sub	s2,s2,a0
	bnez	a4,.L53
	j	.L42
.L31:
	sub	s0,t5,a0
	slli	a5,s0,5
	bltz	a5,.L113
	bnez	s0,.L38
	li	t4,0
	li	a3,0
	li	a5,0
	j	.L18
.L112:
	sub	a4,a6,a3
	beqz	a3,.L114
	li	a5,255
	beq	a6,a5,.L100
	li	a5,67108864
	or	t5,t5,a5
.L15:
	li	a5,27
	bgt	a4,a5,.L115
	li	a5,32
	sub	a5,a5,a4
	sll	a5,t5,a5
	srl	a4,t5,a4
	snez	a5,a5
	or	a4,a4,a5
.L47:
	add	a5,a4,a0
	mv	s2,a6
	j	.L9
.L28:
	li	a5,255
	beq	a6,a5,.L62
	li	a5,67108864
	or	t5,t5,a5
.L30:
	li	a5,27
	bgt	a4,a5,.L116
	li	a5,32
	sub	a5,a5,a4
	sll	a5,t5,a5
	srl	a4,t5,a4
	snez	a5,a5
	or	a5,a4,a5
.L51:
	sub	a5,a0,a5
	mv	s2,a6
	mv	s1,a1
	j	.L25
.L105:
	li	a5,1
	j	.L49
.L114:
	beqz	t5,.L54
	addi	a4,a4,-1
	add	a5,t5,a0
	mv	s2,a6
	beqz	a4,.L9
	li	a5,255
	bne	a6,a5,.L15
	mv	t3,a2
	j	.L10
.L60:
	mv	t3,a2
	mv	s2,a6
	mv	s1,a1
	j	.L52
.L17:
	beqz	t5,.L100
.L36:
	beqz	a0,.L10
	j	.L67
.L107:
	beqz	a0,.L64
	mv	t4,a1
	mv	a5,a2
	j	.L18
.L16:
	li	a5,255
	beq	s2,a5,.L20
	add	a5,t5,a0
	srli	a5,a5,1
	j	.L19
.L113:
	sub	s0,a0,t5
	mv	s1,a1
	j	.L38
.L32:
	bnez	t5,.L36
	beqz	a0,.L67
	mv	s1,a1
	j	.L100
.L109:
	li	a5,1
	j	.L45
.L116:
	li	a5,1
	j	.L51
.L34:
	li	s2,0
	bnez	a5,.L19
.L64:
	li	t4,0
	li	a5,0
	j	.L18
.L110:
	sub	a5,a0,t5
	mv	s2,a6
	mv	s1,a1
	j	.L25
.L57:
	mv	a5,a2
	j	.L18
.L54:
	mv	t3,a2
	mv	s2,a6
	j	.L52
.L115:
	li	a4,1
	j	.L47
	.size	__subsf3, .-__subsf3
	.ident	"GCC: (GNU) 8.3.0"
