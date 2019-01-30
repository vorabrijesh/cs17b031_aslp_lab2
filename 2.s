	.file	1 "2.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,56,$31		# vars= 24, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-56
	sw	$31,52($sp)
	sw	$fp,48($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$10,%got(__stack_chk_guard)($28)
	lw	$10,0($10)
	sw	$10,44($fp)
	move	$10,$sp
	move	$12,$10
	li	$10,10			# 0xa
	sw	$10,28($fp)
	li	$10,4			# 0x4
	sw	$10,32($fp)
	lw	$10,28($fp)
	addiu	$11,$10,-1
	sw	$11,36($fp)
	move	$11,$10
	move	$9,$11
	move	$8,$0
	srl	$11,$9,27
	sll	$4,$8,5
	or	$4,$11,$4
	sll	$5,$9,5
	move	$4,$10
	move	$7,$4
	move	$6,$0
	srl	$4,$7,27
	sll	$2,$6,5
	or	$2,$4,$2
	sll	$3,$7,5
	move	$2,$10
	sll	$2,$2,2
	addiu	$2,$2,3
	addiu	$2,$2,7
	srl	$2,$2,3
	sll	$2,$2,3
	subu	$sp,$sp,$2
	addiu	$2,$sp,16
	addiu	$2,$2,3
	srl	$2,$2,2
	sll	$2,$2,2
	sw	$2,40($fp)
	sw	$0,24($fp)
	b	$L2
	nop

$L3:
	lw	$3,40($fp)
	lw	$2,24($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,24($fp)
	sw	$3,0($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$3,24($fp)
	lw	$2,28($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L3
	nop

	sw	$0,24($fp)
	b	$L4
	nop

$L5:
	lw	$3,40($fp)
	lw	$2,24($fp)
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	lw	$2,32($fp)
	addu	$3,$3,$2
	lw	$4,40($fp)
	lw	$2,24($fp)
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L4:
	lw	$2,24($fp)
	slt	$2,$2,10
	bne	$2,$0,$L5
	nop

	move	$sp,$12
	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,44($fp)
	lw	$3,0($3)
	beq	$4,$3,$L7
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L7:
	move	$sp,$fp
	lw	$31,52($sp)
	lw	$fp,48($sp)
	addiu	$sp,$sp,56
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
