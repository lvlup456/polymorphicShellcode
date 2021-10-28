from bdd import shellCodeAlternatives

def compareSingleUpcode(code1, code2):
    if len(code1) == len(code2):
        if len(code1) == 1 or len(code1) == 2:
            return code1[0].lower() == code2[0].lower()
        elif len(code1) == 3:
            if code1[0].lower() == code2[0].lower():
                if code2[1] == code2[2]:
                    return code1[1] == code1[2]
                else:
                    return code1[1] != code1[2]
            else:
                return False
    else:
        return False

def findAndReplace(instructions, availibleRegister):
    i = 0
    while i < len(instructions):
        for iAlternatives in shellCodeAlternatives.keys():
            if compareSingleUpcode(instructions[i], list(iAlternatives)):
                altern = shellCodeAlternatives[iAlternatives](instructions[i], availibleRegister)
                del instructions[i]
                for j in range(i, i+len(altern)):
                    instructions.insert(j, altern[j-i])
                i = i + len(altern)
                break
        i += 1