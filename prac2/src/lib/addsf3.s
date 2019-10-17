	.file	"addsf3.c"
	.option nopic
	.text
	.globl	__clzsi2
	.align	2
	.globl	__addsf3
	.type	__addsf3, @function
__addsf3:
	addi	sp,sp,-16
	li	a4,8388608
	addi	a4,a4,-1
	srli	a6,a1,23
	sw	s1,4(sp)
	srli	s1,a0,23
	and	t1,a4,a0
	andi	s1,s1,0xff
	and	a3,a4,a1
	sw	s2,0(sp)
	andi	a6,a6,0xff
	srli	s2,a0,31
	sw	ra,12(sp)
	sw	s0,8(sp)
	srli	a1,a1,31
	mv	a5,t1
	mv	a0,s1
	mv	a2,s2
	slli	t3,t1,3
	slli	t4,a3,3
	sub	a7,s1,a6
	beq	s2,a1,.L101
	blez	a7,.L20
	beqz	a6,.L102
	li	a5,255
	beq	s1,a5,.L8
	li	a5,67108864
	or	t4,t4,a5
.L24:
	li	a5,27
	bgt	a7,a5,.L103
	li	a5,32
	sub	a5,a5,a7
	sll	a5,t4,a5
	srl	a7,t4,a7
	snez	a5,a5
	or	a5,a7,a5
.L47:
	sub	a5,t3,a5
.L23:
	slli	a4,a5,5
	bgez	a4,.L17
	li	s0,67108864
	addi	s0,s0,-1
	and	s0,a5,s0
.L36:
	mv	a0,s0
	call	__clzsi2
	addi	a0,a0,-5
	sll	a5,s0,a0
	bgt	s1,a0,.L37
	sub	a0,a0,s1
	addi	s0,a0,1
	li	a4,32
	sub	a4,a4,s0
	sll	a4,a5,a4
	snez	a4,a4
	srl	a5,a5,s0
	or	a5,a5,a4
	li	s1,0
.L33:
.L38:
	andi	a4,a5,7
	beqz	a4,.L39
.L51:
	andi	a4,a5,15
	li	a3,4
	beq	a4,a3,.L39
	addi	a5,a5,4
.L39:
	slli	a4,a5,5
	bgez	a4,.L40
	addi	s1,s1,1
	li	a4,255
	mv	a2,s2
	beq	s1,a4,.L18
	slli	a5,a5,6
	srli	a5,a5,9
	andi	a0,s1,0xff
.L16:
	lw	ra,12(sp)
	lw	s0,8(sp)
	slli	a5,a5,9
	slli	s1,a0,23
	srli	a0,a5,9
	or	a0,a0,s1
	slli	a2,a2,31
	lw	s1,4(sp)
	lw	s2,0(sp)
	or	a0,a0,a2
	addi	sp,sp,16
	jr	ra
.L20:
	bnez	a7,.L104
	addi	a4,s1,1
	andi	a4,a4,254
	bnez	a4,.L29
	bnez	s1,.L30
	beqz	t3,.L105
	beqz	t4,.L16
	sub	a5,t3,t4
	slli	a4,a5,5
	bgez	a4,.L32
	sub	a5,t4,t3
	mv	s2,a1
	j	.L38
.L101:
	blez	a7,.L3
	beqz	a6,.L106
	li	a5,255
	beq	s1,a5,.L8
	li	a5,67108864
	or	t4,t4,a5
.L9:
	li	a5,27
	bgt	a7,a5,.L107
	li	a5,32
	sub	a5,a5,a7
	sll	a5,t4,a5
	srl	a7,t4,a7
	snez	a5,a5
	or	a5,a7,a5
.L43:
	add	a5,a5,t3
.L7:
	slli	a4,a5,5
	bgez	a4,.L17
	addi	s1,s1,1
	li	a4,255
	beq	s1,a4,.L18
	li	a3,2113929216
	srli	a4,a5,1
	addi	a3,a3,-1
	andi	a5,a5,1
	and	a4,a4,a3
	or	a5,a4,a5
	j	.L38
.L102:
	beqz	t4,.L50
	addi	a7,a7,-1
	sub	a5,t3,t4
	beqz	a7,.L23
	li	a5,255
	bne	s1,a5,.L24
.L8:
	beqz	t1,.L108
.L65:
	li	a2,0
	li	a0,255
	li	a5,4194304
	j	.L16
.L104:
	sub	a4,a6,s1
	bnez	s1,.L26
	beqz	t3,.L58
	addi	a4,a4,-1
	beqz	a4,.L109
	li	a5,255
	bne	a6,a5,.L28
.L60:
	mv	s2,a1
.L98:
	mv	t1,a3
	j	.L8
.L106:
	beqz	t4,.L50
	addi	a7,a7,-1
	add	a5,t3,t4
	beqz	a7,.L7
	li	a5,255
	bne	s1,a5,.L9
	j	.L8
.L3:
	bnez	a7,.L110
	addi	s1,s1,1
	andi	a4,s1,254
	bnez	a4,.L14
	bnez	a0,.L15
	beqz	t3,.L55
	beqz	t4,.L16
	add	a5,t3,t4
	slli	a4,a5,5
	li	s1,0
	bgez	a4,.L17
	li	a4,-67108864
	addi	a4,a4,-1
	and	a5,a5,a4
	li	s1,1
.L17:
	andi	a4,a5,7
	bnez	a4,.L51
.L40:
	srli	t1,a5,3
.L50:
	li	a5,255
	beq	s1,a5,.L8
	slli	a5,t1,9
	srli	a5,a5,9
	andi	a0,s1,0xff
	mv	a2,s2
	j	.L16
.L108:
	mv	a2,s2
.L18:
	li	a0,255
	li	a5,0
	j	.L16
.L37:
	li	a4,-67108864
	addi	a4,a4,-1
	and	a5,a5,a4
	andi	a4,a5,7
	sub	s1,s1,a0
	bnez	a4,.L51
	j	.L40
.L29:
	sub	s0,t3,t4
	slli	a5,s0,5
	bltz	a5,.L111
	bnez	s0,.L36
	li	a2,0
	li	a0,0
	li	a5,0
	j	.L16
.L110:
	sub	a4,a6,s1
	beqz	s1,.L112
	li	a5,255
	beq	a6,a5,.L98
	li	a5,67108864
	or	t3,t3,a5
.L13:
	li	a5,27
	bgt	a4,a5,.L113
	li	a5,32
	sub	a5,a5,a4
	sll	a5,t3,a5
	srl	a4,t3,a4
	snez	a5,a5
	or	a5,a4,a5
.L45:
	add	a5,a5,t4
	mv	s1,a6
	j	.L7
.L26:
	li	a5,255
	beq	a6,a5,.L60
	li	a5,67108864
	or	t3,t3,a5
.L28:
	li	a5,27
	bgt	a4,a5,.L114
	li	a3,32
	sub	a3,a3,a4
	sll	a3,t3,a3
	srl	a5,t3,a4
	snez	a4,a3
	or	a5,a5,a4
.L49:
	sub	a5,t4,a5
	mv	s1,a6
	mv	s2,a1
	j	.L23
.L103:
	li	a5,1
	j	.L47
.L112:
	beqz	t3,.L52
	addi	a4,a4,-1
	add	a5,t3,t4
	mv	s1,a6
	beqz	a4,.L7
	li	a5,255
	bne	a6,a5,.L13
	mv	t1,a3
	j	.L8
.L58:
	mv	t1,a3
	mv	s1,a6
	mv	s2,a1
	j	.L50
.L15:
	beqz	t3,.L98
.L34:
	beqz	t4,.L8
	j	.L65
.L105:
	beqz	t4,.L62
	mv	a2,a1
	mv	a5,a3
	j	.L16
.L14:
	li	a5,255
	beq	s1,a5,.L18
	add	a5,t3,t4
	srli	a5,a5,1
	j	.L17
.L111:
	sub	s0,t4,t3
	mv	s2,a1
	j	.L36
.L30:
	bnez	t3,.L34
	beqz	t4,.L65
	mv	s2,a1
	j	.L98
.L107:
	li	a5,1
	j	.L43
.L114:
	li	a5,1
	j	.L49
.L32:
	bnez	a5,.L17
.L62:
	li	a2,0
	li	a5,0
	j	.L16
.L109:
	sub	a5,t4,t3
	mv	s1,a6
	mv	s2,a1
	j	.L23
.L55:
	mv	a5,a3
	j	.L16
.L52:
	mv	t1,a3
	mv	s1,a6
	j	.L50
.L113:
	li	a5,1
	j	.L45
	.size	__addsf3, .-__addsf3
	.ident	"GCC: (GNU) 8.3.0"
