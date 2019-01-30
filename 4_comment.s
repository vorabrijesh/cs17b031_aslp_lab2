	.file	1 "4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	isprime
	.set	nomips16  					#the comment has been written 1 time for each new instruction
	.set	nomicromips
	.ent	isprime
	.type	isprime, @function
isprime:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16				#Add immediate unsigned (no overflow) ;$sp= sp-16
	sw	$fp,12($sp) 			 #The contents of $t is stored at the specified address. ;Memory[$sp+44]=$fp ; store word   
	move	$fp,$sp 			# $fp=$sp  
	sw	$4,16($fp)
	li	$2,2			# 0x2
	sw	$2,0($fp) 		
	sw	$0,4($fp)
	b	$L5 		# branch
	nop 		

$L5:
	li	$2,1			# 0x1
	sw	$2,4($fp) 
	b	$L4        #branch
	nop  			#used in pipelining 

$L12:
	nop
	lw	$3,16($fp) 			#Copy from memory to register;  $3=Memory[$fp+16]
	lw	$2,0($fp)
	teq	$2,$0,7  		
	div	$0,$3,$2
	mfhi	$2
	beq	$2,$0,$L5 
	nop

$L4:
	lw	$3,4($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L11
	nop

	lw	$2,0($fp)
	addiu	$2,$2,1
	sw	$2,0($fp)
$L2:
	lw	$3,0($fp)
	lw	$2,16($fp)
	slt	$2,$3,$2 				#set on less than  if($2<$3)$2=1; else $2=0
	bne	$2,$0,$L12 			#Test if registers are not equal; if($2!=$0) go to PC+4+$L12
	nop

	b	$L7
	nop

$L11:
	nop
$L7:
	lw	$2,4($fp)
	bne	$2,$0,$L9 			##Test if registers are not equal; if($2!=$0) go to PC+4+$L12
	nop  			#usd in pipelining

	li	$2,1			# 0x1
	b	$L10 			#beanch
	nop

$L9:
	move	$2,$0
$L10:
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	isprime
	.size	isprime, .-isprime
	.align	2
	.globl	nearestprime
	.set	nomips16
	.set	nomicromips
	.ent	nearestprime
	.type	nearestprime, @function
nearestprime:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	sw	$4,48($fp)
	lw	$2,48($fp)	
	sw	$2,28($fp)
	lw	$2,48($fp)
	sw	$2,32($fp)
	b	$L14
	nop

$L17:
	lw	$2,28($fp)
	addiu	$3,$2,1
	sw	$3,28($fp)
	move	$4,$2
	.option	pic0
	jal	isprime
	nop

	.option	pic2
	beq	$2,$0,$L15
	nop

	lw	$2,28($fp)
	sw	$2,36($fp)
	lw	$2,36($fp)
	b	$L16
	nop

$L15:
	lw	$2,32($fp)
	addiu	$3,$2,-1
	sw	$3,32($fp)
	move	$4,$2
	.option	pic0
	jal	isprime   			#jump and link jal  
	nop

	.option	pic2
	beq	$2,$0,$L14
	nop

	lw	$2,32($fp)
	sw	$2,36($fp)
	lw	$2,36($fp)
	b	$L16
	nop

$L14:
	lw	$2,32($fp)
	bne	$2,$0,$L17
	nop

	b	$L13
	nop

$L16:
$L13:
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	nearestprime
	.size	nearestprime, .-nearestprime
	.rdata
	.align	2
$LC0:
	.ascii	"1.for checking prime \012 2.for checking odd or even\012"
	.ascii	"3.nearestprime\000"
	.align	2
$LC1:
	.ascii	"%d is prime\000"
	.align	2
$LC2:
	.ascii	"%d is not prime\000"
	.align	2
$LC3:
	.ascii	"%d is even\000"
	.align	2
$LC4:
	.ascii	"%d is odd\000"
	.align	2
$LC5:
	.ascii	"%d nearestprime\000"
	.align	2
$LC6:
	.ascii	"Enter valid choice\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 16, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48
	sw	$31,44($sp)
	sw	$fp,40($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	li	$2,9			# 0x9
	sw	$2,28($fp)
	li	$2,3			# 0x3
	sw	$2,32($fp)
	lui	$2,%hi($LC0)				#load unsigned immediate
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(puts)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,puts
1:	jalr	$25
	nop

	lw	$28,16($fp)
	lw	$2,32($fp)
	li	$3,2			# 0x2
	beq	$2,$3,$L20
	nop

	li	$3,3			# 0x3
	beq	$2,$3,$L21
	nop

	li	$3,1			# 0x1
	bne	$2,$3,$L19
	nop

	lw	$4,28($fp)
	.option	pic0
	jal	isprime
	nop

	.option	pic2
	lw	$28,16($fp)
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L23
	nop

	lw	$5,28($fp)
	lui	$2,%hi($LC1)
	addiu	$4,$2,%lo($LC1)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L25
	nop

$L23:
	lw	$5,28($fp)
	lui	$2,%hi($LC2)
	addiu	$4,$2,%lo($LC2)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L25
	nop

$L20:
	lw	$2,28($fp)
	andi	$2,$2,0x1
	bne	$2,$0,$L26
	nop

	lw	$5,28($fp)
	lui	$2,%hi($LC3)
	addiu	$4,$2,%lo($LC3)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L25
	nop

$L26:
	lw	$5,28($fp)
	lui	$2,%hi($LC4)
	addiu	$4,$2,%lo($LC4)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	b	$L25
	nop

$L21:
	lw	$4,28($fp)
	.option	pic0
	jal	nearestprime
	nop

	.option	pic2
	lw	$28,16($fp)
	sw	$2,36($fp)
	lw	$5,36($fp)
	lui	$2,%hi($LC5)
	addiu	$4,$2,%lo($LC5)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
$L19:
	lui	$2,%hi($LC6)
	addiu	$4,$2,%lo($LC6)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25
	nop

	lw	$28,16($fp)
	nop
$L25:
	move	$2,$0
	move	$sp,$fp
	lw	$31,44($sp)
	lw	$fp,40($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
