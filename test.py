#!/bin/python
#
# Author: iit tirupati assembly course
#
# Description: To identify the operation of a given intel instruction (x86 and IA32).
#
# Execution: ./instruction_compare.py your.asm x86_list.txt your_description.asm
# 1) your.asm: is an input assembly program file.
# 2) x86_list.txt: is a list of intel instruction with description of functionality
# 3) your_description.asm: an output file which consists of the given assembly program with corresponding
# description for each instruction.
#
# Date: 11th Jan, 2019
# Place: IIT Tirupati
#---------------------------------------------------------------------------------------------

import sys
  
input_file1 = sys.argv[1]
if_ptr1 = open(input_file1, 'r')

input_file2 = sys.argv[2]
if_ptr2 = open(input_file2, 'r')

output_file1 = sys.argv[3]
of_ptr1 = open(output_file1, 'w')
count=0
for line1 in if_ptr1:
    inst_from_asm = line1.split()[0]
    match_flag = 0
    for line2 in if_ptr2:
        inst_from_list = line2.split()[0]
	if_ptr2 = open(input_file2, 'r')       
	if inst_from_list.lower() == inst_from_asm.lower(): 
           of_ptr1.write(line1.strip("\n") + "\t\t;" + line2[len(inst_from_list)+1:len(line2)] + "\n")
           match_flag = 1
	   count+=1
           break
    #if_ptr2.close()
    if match_flag == 0:
       of_ptr1.write(line1.strip("\n") + "\t\t;" + "This is not an instruction" + "\n")

print(count)

