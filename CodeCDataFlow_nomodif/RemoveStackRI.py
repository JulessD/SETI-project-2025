#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Feb  7 09:48:30 2025

@author: jules
"""

with open('FIR.ll', 'r') as f:
    RI_lines = f.readlines()
    
function_num = 0
function_start_l = 0
function_en_l = 0

functions_s = []
functions_e = []
functions_n = []

#find function
for i, line in enumerate(RI_lines):
    if "define" in line:
        function_start_l = i
        functions_s.append(function_start_l)
        functions_n.append(line[line.find("@"):line.find("(")])
        
    
    if "ret" in line:
        function_en_l = i
        functions_e.append(function_en_l)


for k in range(len(functions_s)):
    print("########## FUNCTION ", functions_n[k], "##############")
    
    # little fix to avoid infinite loop, LLVM uses alloca to inst loop value
    # replace store by add if br in function
    br_register_bool = False
    for i in range(functions_s[k], functions_e[k]+1):
        line_br_search = RI_lines[i]
        if ("br" in line_br_search) and ("i1" in line_br_search):
            br_register_bool = True
            print("dangerous br found in function, not replacing")
            
    for i in range(functions_s[k], functions_e[k]+1):
        if br_register_bool:
            break
        function_line_alloca = RI_lines[i]
        
        # look for a register allocation 
        ptr_allocted = ""
        value_allocated = ""
        register_loaded = ""
        
        if "alloca" in function_line_alloca:
            stack_allocation_l = function_line_alloca.split()
            ptr_allocted = stack_allocation_l[0]
            #cleanup
            RI_lines[i] = " ; alloca removed -- " + function_line_alloca  # cleanup
            
            print("taking care of ptr", ptr_allocted)
            print(ptr_allocted)
            
            for j in range(functions_s[k], functions_e[k]+1):
                # TODO carefull stored value may vary during the function
                function_line_store = RI_lines[j]
                
                # look for the value allocated 
                if (";" not in function_line_store) and ("store" in function_line_store) and (ptr_allocted+',' in function_line_store):
                    stack_initstore_l = function_line_store.split()
                    value_allocated = stack_initstore_l[2]
                    
                    #cleanup
                    RI_lines[j] = " ; store removed -- " + function_line_store  # cleanup
                    print("value allocated : " ,value_allocated ," in ptr  "  , ptr_allocted, "at l", j+1)
                    
                function_line_load = RI_lines[j]
                
                # look for the register loaded with the ptr value  add a , to the ptr_allocated test so it does not think %22 is in it for alloca %2
                if (";" not in function_line_load) and ("load" in function_line_load) and (ptr_allocted+"," in function_line_load):
                
                    stack_load_l = function_line_load.split()
                    register_loaded = stack_load_l[0]
                    #cleanup
                    RI_lines[j] = " ; load removed -- " + function_line_load  # cleanup
                    print("load ptr ", ptr_allocted, " in register " , register_loaded, "    line is ", function_line_load)
                    
                function_line_op = RI_lines[j]
                 
                #handling op
                if (";" not in function_line_op) and ("load" not in function_line_op) and (register_loaded in function_line_op) and register_loaded != "" and value_allocated != "":
                    value_allocated = value_allocated.replace(",", "")
                    RI_lines[j] = function_line_op.replace(register_loaded, value_allocated)
                    print(register_loaded , " = "  , value_allocated)

with open('FIR.ll', 'w') as f:
    for line in RI_lines:
        f.write(f"{line}")
            
            
            
        
    
    
print(functions_s)
print(functions_e)
        
        
    
    