import random


lengthRegisters = [
    ["rax", "eax", "ax", "al"],
    ["rbx", "ebx", "bx", "bl"],
    ["rcx", "ecx", "cx", "cl"],
    ["rdx", "edx", "dx", "dl"],
    ["rsi", "esi", "si", "sil"],
    ["rdi", "edi", "di", "dil"],
    ["rbp", "ebp", "bp", "bpl"],
    ["rsp", "esp", "sp", "spl"],
    ["r8", "r8d", "r8w", "r8b"],
    ["r9", "r9d", "r9w", "r9b"],
    ["r10", "r10d", "r10w", "r10b"],
    ["r11", "r11d", "r11w", "r11b"],
    ["r12", "r12d", "r12w", "r12b"],
    ["r13", "r13d", "r13w", "r13b"],
    ["r14", "r14d", "r14w", "r14b"],
    ["r15", "r15d", "r15w", "r15b"]
]

def randomTempRegister(register, availibleRegister):
    for r in lengthRegisters:
        if register.lower() in r:
            registerPose = r.index(register.lower())
            break
    tempRegister = availibleRegister[random.randint(0, len(availibleRegister)-1)]
    for r in lengthRegisters:
        if tempRegister.lower() in r:
            return r[registerPose]


def replaceMov(instruction, availibleRegister):
    a = instruction[1]
    b = instruction[2]
    instructionReturn = []
    if "0x" in b.lower():
        bNumber = int(b,16)
        randBNumber  = random.randint(0,16)
        instructionReturn.append(
            ["MOV",a,str(bNumber + randBNumber)]
        )
        instructionReturn.append(
            ["SUB",a,str(randBNumber)]
        )
    else:
        temp = randomTempRegister(a, availibleRegister)
        instructionReturn.append(
            ["MOV",temp,b]
        )
        instructionReturn.append(
            ["MOV",a,temp]
        )
    return instructionReturn

def replaceXor(instruction, availibleRegister):
    a = instruction[1]
    instructionReturn = []

    if random.randint(0,1):
        instructionReturn.append(
            ["MOV", a, "0x01"],
        )
        instructionReturn.append(
            ["SUB", a, "0x01"]
        )
    else:
        temp = randomTempRegister(a, availibleRegister)
        instructionReturn.append(
            ["XOR", temp, temp],
        )
        instructionReturn.append(
            ["MOV", a, temp]
        )
    return instructionReturn


def replaceAdd(instruction, availibleRegister):
    a = instruction[1]
    if "0x" in instruction[2]:
        b = int(instruction[2], 16)
    else:
        b = int(instruction[2])


    instructionReturn = []
    randBNumber  = random.randint(0,16)
    instructionReturn.append(
        ["ADD", a, str(b + randBNumber)],
    )
    instructionReturn.append(
        ["SUB", a, str(randBNumber)],

    )
    return instructionReturn

def replaceSub(instruction, availibleRegister):
    a = instruction[1]
    if "0x" in instruction[2]:
        b = int(instruction[2], 16)
    else:
        b = int(instruction[2])

    instructionReturn = []
    randBNumber  = random.randint(0,16)
    instructionReturn.append(
        ["SUB", a, str(b + randBNumber)],
    )
    instructionReturn.append(
        ["ADD", a, str(randBNumber)],
    )
    return instructionReturn




shellCodeAlternatives = {
    tuple(["MOV", "A", "B"]) : replaceMov,
    tuple(["XOR", "A", "A"]) : replaceXor,
    tuple(["ADD", "A", "0x"]): replaceAdd,
    tuple(["SUB", "A", "0x"]): replaceSub,
}