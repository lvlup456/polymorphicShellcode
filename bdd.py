import random

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
            ["SUB",a,randBNumber]
        )
    else:
        temp = availibleRegister[random.randint(0,len(availibleRegister)-1)]
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
        temp = availibleRegister[random.randint(0,len(availibleRegister)-1)]
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
        ["SUB", "A", randBNumber],

    )

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
        ["ADD", "A", randBNumber],
    )
    return instructionReturn


shellCodeAlternatives = {
    tuple(["MOV", "A", "B"]) : replaceMov,
    tuple(["XOR", "A", "A"]) : replaceXor,
    tuple(["ADD", "A", "0x"]): replaceAdd,
    tuple(["SUB", "A", "0x"]): replaceSub,
}