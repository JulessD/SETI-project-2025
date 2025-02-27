#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  7 09:48:30 2025

@author: jules
"""
import sys 


register_convention =	{
  "x0": "x0",
  "ra":"x1" ,
  "sp":"x2" ,
  "gp":"x3" ,
  "tp":"x4" ,
  "t0":"x5" ,
  "t1":"x6" ,
  "t2":"x7" ,
  "s0":"x8" ,
  "s1":"x9" ,
  "a0":"x10" ,
  "a1":"x11" ,
  "a2":"x12" ,
  "a3":"x13" ,
  "a4":"x14" ,
  "a5":"x15" ,
  "a6":"x16" ,
  "a7":"x17" ,
  "s2":"x18" ,
  "s3":"x19" ,
  "s4":"x20" ,
  "s5":"x21" ,
  "s6":"x22" ,
  "s7":"x23" ,
  "s8":"x24" ,
  "s9":"x25" ,
  "s10":"x26" ,
  "s11":"x27" ,
  "t3":"x28" ,
  "t4":"x29" ,
  "t5":"x30" ,
  "t6":"x31" 
}
availabe_registers = ["a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t0", "t1", "t2", "t3", "t4", "t5", "t6" ]

def dename_reg(RI_lines, k):
    print("replacing all registers")
    # changing register numbers into base RISC 
    found=0
    for i in range(functions_s[k]+1, functions_e[k]+1):
        function_line = RI_lines[i]
        for reg in register_convention:
            if " "+reg in function_line:
                found+=1
                new_reg = "x" + str(int(register_convention[reg][1:]) + k*32)
                function_line = function_line.replace(" "+reg, " "+new_reg)
            if "("+reg in function_line:
                found+=1
                new_reg = "x" + str(int(register_convention[reg][1:]) + k*32)
                function_line = function_line.replace("("+reg, "("+new_reg)
            if "\t"+reg in function_line:
                found+=1
                new_reg = "x" + str(int(register_convention[reg][1:]) + k*32)
                function_line = function_line.replace("\t"+reg, "\t"+new_reg)
        RI_lines[i] = function_line      
    print("done : ", found, " reg changes")


def replace_nostack(RI_lines):
    # replacer
    print("replacing ...")
    for i in range(functions_s[k]+1, functions_e[k]+1):
        function_line = RI_lines[i]
        if "lw" in function_line:
            # look for stack index
            for index in stack_indexes:
                if index in function_line:
                    register_ld = function_line[(function_line.index(",")-2):(function_line.index(","))]
                    if register_ld == "ro":
                        register_ld = "zero"
                    RI_lines[i] = "\taddw\t" + register_ld + ", " + corr_table[index] + ", x0"  +  "\t\t           # replace --" + function_line
                    break
        elif "lui" in function_line:
            # look for stack index
            for index in stack_indexes:
                if index in function_line:
                    register_ld = function_line[(function_line.index(",")-2):(function_line.index(","))]
                    if register_ld == "ro":
                        register_ld = "zero"
                    RI_lines[i] = "\taddi\t" + register_ld + ", " + corr_table[index] + ", x0"  +  "\t\t             # replace --" + function_line
                    break
        elif "ld" in function_line:
            # look for stack index
            for index in stack_indexes:
                if index in function_line:
                    register_ld = function_line[(function_line.index(",")-2):(function_line.index(","))]
                    if register_ld == "ro":
                        register_ld = "zero"
                    RI_lines[i] = "\taddi\t" + register_ld + ", " + corr_table[index] + ", x0" +  "\t\t             # replace --" + function_line
                    break
        elif "sw" in function_line:
            # look for stack index
            for index in stack_indexes:
                if index in function_line:
                    register_ld = function_line[(function_line.index(",")-2):(function_line.index(","))]
                    if register_ld == "ro":
                        register_ld = "zero"
                    RI_lines[i] = "\taddw\t"  + corr_table[index] + ", "  + register_ld + ", x0"  +  "\t\t             # replace --" + function_line
                    break
        elif "sd" in function_line and "# 8-byte Folded Spill" not in function_line :
            # look for stack index
            for index in stack_indexes:
                if index in function_line:
                    register_ld = function_line[(function_line.index(",")-2):(function_line.index(","))]
                    if register_ld == "ro":
                        register_ld = "zero"
                    RI_lines[i] = "\taddi\t" + corr_table[index]  + ", " + register_ld + ", x0"  +  "\t\t             # replace --" + function_line
                    break
        elif "sui" in function_line:
            # look for stack index
            for index in stack_indexes:
                if index in function_line:
                    register_ld = function_line[(function_line.index(",")-2):(function_line.index(","))]
                    if register_ld == "ro":
                        register_ld = "zero"
                    RI_lines[i] = "\taddi\t" + corr_table[index] + ", " + register_ld + ", x0"  +  "\t\t             # replace --" + function_line
                    break
    
    print("done")
    
def replace_nostack_v2(RI_lines):
    # replacer
    print("replacing ...")
    for i in range(functions_s[k]+1, functions_e[k]+1):
        function_line = RI_lines[i]
        if "lw" in function_line or "lui" in function_line or "ld" in function_line:
            # look for stack index
            for index in stack_indexes:
                if index in function_line:
                    register_ld = function_line[(function_line.index(",")-2):(function_line.index(","))]
                    if register_ld == "ro":
                        register_ld = "zero"
                    RI_lines[i] = "\tmv\t" + register_ld + ", " + corr_table[index]  + "\t\t           # replace --" + function_line
                    break
        elif "sw" in function_line or ("sd" in function_line and "# 8-byte Folded Spill" not in function_line) or "sui" in function_line:
            # look for stack index
            for index in stack_indexes:
                if index in function_line:
                    register_ld = function_line[(function_line.index(",")-2):(function_line.index(","))]
                    if register_ld == "ro":
                        register_ld = "zero"
                    RI_lines[i] = "\tmv\t"  + corr_table[index] + ", "  + register_ld  + "\t\t             # replace --" + function_line
                    break
    
    print("done")

    
    
with open('FIR.s', 'r') as f:
    RI_lines = f.readlines()
    
function_num = 0
function_start_l = 0
function_en_l = 0

functions_s = [] #start
functions_e = [] #stop
functions_n = [] #name

#find function
for i, line in enumerate(RI_lines):
    if "@function" in line:
        function_start_l = i
        functions_s.append(function_start_l)
        indexf = line.rindex("@function")
        indexs = line.rindex('\t')
        name = line[indexs:indexf]
        functions_n.append(name)
        
    if "ret" in line:
        function_en_l = i
        functions_e.append(function_en_l)
        
for k in range(len(functions_s)):
    
    print("\n\nhandling function ", functions_n[k])
    stack_indexes = []
    availabe_registers = ["a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7", "s8", "s9", "s10", "s11", "t0", "t1", "t2", "t3", "t4", "t5", "t6" ]
  #  availabe_registers = ["t0", "t1", "t2", "t3", "t4", "t5", "t6", "a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7" ]

    corr_table = {}
    
    #get stack size
    stack_size_line = RI_lines[functions_s[k]+3]
    stack_size = stack_size_line[stack_size_line.index("-")+1:]
    print("stack size : ", stack_size)
    
    # get all index stack usage in the func
    for i in range(functions_s[k]+1, functions_e[k]+1):
        function_line = RI_lines[i]

        # look for all allocation
        if "(s0)" in function_line and "sp" not in function_line:
            stack_index = function_line[function_line.rindex(" "):function_line.index("(s0)")]
            if stack_index not in stack_indexes:
                stack_indexes.append(stack_index)
     
    
    #get available registers 
    for i in range(functions_s[k]+1, functions_e[k]+1):
        function_line = RI_lines[i]
        for reg in availabe_registers:
            if reg in function_line:
                availabe_registers.remove(reg)  
                
    print(len(stack_indexes), " stack indexes found")
    print(len(availabe_registers), " register available")


    if len(availabe_registers) < len(stack_indexes):
        print("ERROR : too many stack index, not enough registers")
        sys.exit()
        
        
    # build corr table
    print("correspondance table : ")
    for j in range(len(stack_indexes)):
        corr_table[stack_indexes[j]] = availabe_registers[j]
        
        print(stack_indexes[j], " = ", availabe_registers[j], " ")
        
    
    replace_nostack_v2(RI_lines)
    dename_reg(RI_lines, k)
    
    
print("-------------------")
print("writing ASM")
with open('FIR.s', 'w') as f:
    for line in RI_lines:
        f.write(f"{line}")
print("done")
            
        
        
    
    