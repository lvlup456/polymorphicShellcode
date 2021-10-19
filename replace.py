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

def compareSingleUpcodeWithMatching(code1, code2, asso):
    asso2 = []
    for i in asso:
        asso2.append(asso[i])
    if len(code1) == len(code2):
        if len(code1) == 1 :
            return code1[0].lower() == code2[0].lower(), asso
        elif len(code1) == 2:
            if not (code1[1] in asso and asso[code1[1]] == code2[1] ):
                if "0x" in code1[1] or "0x" in code1[1]:
                    pass
                elif not code1[1] in asso and not code2[1] in asso2:
                    asso[code1[1]] = code2[1]
                else:
                    return False, asso 
            if asso[code1[1]] == code2[1]:
                return code1[0].lower() == code2[0].lower(), asso
            else:
                return False, asso 
        elif len(code1) == 3:
            if not (code1[1] in asso and asso[code1[1]] == code2[1] ):
                if "0x" in code1[1] or "0x" in code1[1]:
                    pass
                elif not code1[1] in asso and not code2[1] in asso2:
                    asso[code1[1]] = code2[1]
                    asso2 = []
                    for i in asso:
                        asso2.append(asso[i])
                else:
                    return False, asso 

            if not (code1[2] in asso and asso[code1[2]] == code2[2] ):
                if "0x" in code1[2] or "0x" in code1[2]:
                    pass
                elif not code1[2] in asso and not code2[2] in asso2:
                    asso[code1[2]] = code2[2]
                else:
                    return False, asso 

            if asso[code1[1]] == code2[1] and asso[code1[2]] == code2[2]:
                return code1[0].lower() == code2[0].lower(), asso
            else:
                return False, asso 
    else:
        return False, asso 


def compareUpcode(code1, code2):
    if isinstance(code1[0], str):
        return compareSingleUpcode(code1,code2)
    elif isinstance(code1[0], list):
        asso = {}
        for i in range(0, len(code1)):
            test, asso = compareSingleUpcodeWithMatching(code1[i],code2[i], asso)
            if test == False:
                return False
        return True



def findAndReplace(instructions, availibleRegister):
    i = 0
    while i < len(instructions):
        for iAlternatives in shellCodeAlternatives.keys():
            if compareUpcode(instructions[i], list(iAlternatives)):
                altern = shellCodeAlternatives[iAlternatives](instructions[i], availibleRegister)
                del instructions[i]
                for j in range(i, i+len(altern)):
                    instructions.insert(j, altern[j-i])
                i = i + len(altern)
                break
        i += 1