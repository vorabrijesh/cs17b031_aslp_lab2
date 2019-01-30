	.file	1 "3.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.rdata
	.align	2
$LC0:
	.ascii	"%d \000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips 				#the comment has been written 1 time for each new instruction
	.ent	main
	.type	main, @function
main:
	.frame	$fp,248,$31		# vars= 216, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-248		#Add immediate unsigned (no overflow) ;$sp= sp-248
	sw	$31,244($sp)			#The contents of $t is stored at the specified address. ;Memory[$sp+44]=$fp ; store word         
	sw	$fp,240($sp)
	move	$fp,$sp-248 		# $fp=$sp-48 
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2) 					#Copy from memory to register;  $2=Memory[$2+0]
	sw	$2,236($fp) 				
	li	$2,2			# 0x2
	sw	$2,24($fp)					#
	sw	$0,28($fp)
	b	$L2						
	nop

$L11:
	li	$2,2			# 0x2
	sw	$2,32($fp)
	b	$L3
	nop

$L6:
	li	$2,1			# 0x1
	sw	$2,28($fp)
	b	$L5
	nop

$L15:
	nop
	lw	$3,24($fp)			
	lw	$2,32($fp)
	teq	$2,$0,7
	div	$0,$3,$2 		#divide $0=$3/$2;
	mfhi	$2			#move from low $2=hi
	beq	$2,$0,$L6  		#Test bitwise equality; 
	nop

$L5:
	lw	$3,28($fp)
	li	$2,1			# 0x1
	beq	$3,$2,$L14  		#Test bitwise equality; 
	nop 					#used in pipelining

	lw	$2,32($fp)
	addiu	$2,$2,1
	sw	$2,32($fp)  		#The contents of $t is stored at the specified address. ;Memory[$sp+32]=$2 ; store word   
$L3:
	lw	$3,32($fp)
	lw	$2,24($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L15  		#Test if registers are not equal if($2!=$0) go to PC+4+$L5
	nop

	b	$L8
	nop

$L14:
	nop
$L8:
	lw	$2,28($fp)
	bne	$2,$0,$L10
	nop

	lw	$5,24($fp)
	lui	$2,%hi($LC0) 				#load upper immediate $2=%hi($LC0)x2^16
	addiu	$4,$2,%lo($LC0)
	lw	$2,%call16(printf)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,printf
1:	jalr	$25  				#$ra=PC+4; go to register $25
	nop

	lw	$28,16($fp)
$L10:
	sw	$0,28($fp)
	lw	$2,24($fp)
	addiu	$2,$2,1
	sw	$2,24($fp)
$L2:
	lw	$2,24($fp)
	slt	$2,$2,100		#set on less than  if($2<100)$2=1; else $2=0
	bne	$2,$0,$L11
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,236($fp)
	lw	$3,0($3)
	beq	$4,$3,$L13
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L13:
	move	$sp,$fp
	lw	$31,244($sp)
	lw	$fp,240($sp)
	addiu	$sp,$sp,248				
	j	$31				#jump
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
