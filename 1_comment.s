	.file	1 "1.c"
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
	.ent	.-main 								#the comment has been written 1 time for each new instruction
	.type	main, @function
main:
	.frame	$fp,48,$31		# vars= 40, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48  		#Add immediate unsigned (no overflow) ;$sp= sp-48
	sw	$fp,44($sp)				#The contents of $t is stored at the specified address. ;Memory[$sp+44]=$fp ; store word
	move	$fp,$sp-48          # $fp=$sp-48  
	li	$2,20			# 0x1	#Loads immediate value into register # $2=20
	sw	$2,4($fp)
	li	$2,10			# 0xa
	sw	$2,8($fp)
	lw	$3,4($fp)				#Copy from memory to register;  $3=Memory[$fp+4]
	lw	$2,8($fp)
	addu	$2,$3,$2			#Add unsigned (no overflow) ;$2=$2+$3
	sw	$2,12($fp)			
	lw	$3,4($fp)
	lw	$2,8($fp)
	subu	$2,$3,$2			#Subtract unsigned; $2=$3-$2
	sw	$2,16($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	mul	$2,$3,$2 				#Multiply (without overflow) $2=$3*$2
	sw	$2,20($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	teq	$2,$0,7					#Test bitwise equality; 
	div	$0,$3,$2				#divide $0=$3/$2;
	mfhi	$2					#Copy from special register hi to general register; $2=hi
 	mflo	$2					#Copy from special register lo to general register ; $2=$lo
	sw	$2,24($fp)		
	lw	$3,4($fp)
	lw	$2,8($fp) 
	and	$2,$3,$2			#Bitwise AND ; $2=$3 & $2
	sw	$2,28($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	or	$2,$3,$2 			#Bitwise OR ; $2=$3 | $2
	sw	$2,32($fp)
	lw	$3,4($fp)
	lw	$2,8($fp)
	xor	$2,$3,$2	   		#Bitwise XOR; $2=$3 ^ $2
	sw	$2,36($fp)
	move	$2,$0
	move	$sp,$fp
	lw	$fp,44($sp)
	addiu	$sp,$sp,48
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
