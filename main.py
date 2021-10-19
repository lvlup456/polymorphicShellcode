import argparse
import os
from replace import findAndReplace
from time import sleep

#Set arguments with argpars
parser  = argparse.ArgumentParser(description="Modify shellcode")
parser.add_argument('-file' , help = "Input file", required= True)
parser.add_argument('-output' , help = "Output name", required= False)


#Get args
args = parser.parse_args()
file_input  = args.file
file_output = args.output

#Instructions tab
instructions = []

#Read input file
f = open(file_input,"r")
lines = f.readlines()
f.close()


#Get _start instructions and parse them to put each line in a list
testStart = False
for line in lines :
    if ("_start:" not in line and not testStart): continue
    else:
        testStart = True
        line = line.replace("\n","").replace(","," ").split(" ")
        line = [string for string in line if string != ""]
        if len(line) != 0 :
            instructions.append(line)

#Remove ";" of lines
for line in instructions:
    for text in line:
        if '_start:' in text:
            line[0:len(line)] = []
        if ';' in text :
            index = line.index(text)
            if (text.index(";") != 0):
                index+=1
            text = text.replace(";","")
            line[index:len(line)]= []

#Remove empty list
instructions = [lin for lin in instructions if len(lin) != 0]



#Count which registers are used in the program
countRegisters = {}
for line in instructions:
    if (len(line) == 2 ):
        if (line[1] != "word" and "0x" not in line[1] and '"' not in line[1] and not isinstance(line[1], int)  == False):
            if (line[1] in countRegisters):
                countRegisters[line[1]]+=1
            else:
                countRegisters[line[1]] =1
    elif (len(line) ==3):
        if (line[1] != "word" and "0x" not in line[1] and '"' not in line[1] and isinstance(line[1], int)  == False):
            if (line[1] in countRegisters):
                countRegisters[line[1]]+=1
            else:
                countRegisters[line[1]] =1
        if (line[2] != "word" and "0x" not in line[2] and '"' not in line[2] and not isinstance(line[2], int)  == False):
            if (line[2] in countRegisters):
                countRegisters[line[2]]+=1
            else:
                countRegisters[line[2]] =1


#List of non volatile registers
registers = ["r8","r9","r10","r11","r12","r13","r14","r15"]
        
#Get available registers to use
availableRegisters = [string for string in registers if string not in countRegisters]


findAndReplace(instructions,availableRegisters)


#Commands to compile and get OPCODEs
compileAsm = "nasm -f elf64 -F stabs "+file_output +" && ld -o "+file_output.split(".")[0]+" "+file_output.split(".")[0]+".o"
getOpcode = "objdump -d "+file_output.split(".")[0]+" | grep -Po '\s\K[a-f0-9]{2}(?=\s)' | sed 's/^/\\\\x/g' | perl -pe 's/\\r?\\n//' | sed 's/$/\\n/'"

#Write new asm file
testStart = False
f = open(file_output.split(".")[0]+".asm","w")
for line in lines :
    if ("_start:" not in line and not testStart): 
        f.write(line)
    else:
        testStart = True
f.write("_start: \n")
for line in instructions:
    if (len(line) == 3):
        if ("word" in line or "dword" in line):
            f.write(" ".join(line)+"\n")
        else:
            f.write( line[0].lower()+" " +",".join(line[1:len(line)])+"\n")
    else:
        f.write(" ".join(line)+"\n")
f.close()


#Execute commands
os.popen(compileAsm)
sleep(1)
payload = os.popen(getOpcode).read()

print(payload)
    
    









