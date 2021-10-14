

def compareSingleUpcode(code1, code2):
    if len(code1) == len(code2):
        if len(code1) == 1 or len(code1) == 2:
            return code1[0] == code2[0]
        elif len(code1) == 3:
            if code1[0] == code2[0]:
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
            return code1[0] == code2[0], asso
        elif len(code1) == 2:

            if not (code1[1] in asso and asso[code1[1]] == code2[1] ):
                if not code1[1] in asso and not code2[1] in asso2:
                    asso[code1[1]] = code2[1]
                else:
                    return False, asso 

            if asso[code1[1]] == code2[1]:
                return code1[0] == code2[0], asso
            else:
                return False, asso 
        elif len(code1) == 3:
            if not (code1[1] in asso and asso[code1[1]] == code2[1] ):
                if not code1[1] in asso and not code2[1] in asso2:
                    asso[code1[1]] = code2[1]
                    asso2 = []
                    for i in asso:
                        asso2.append(asso[i])
                else:
                    return False, asso 

            if not (code1[2] in asso and asso[code1[2]] == code2[2] ):
                if not code1[2] in asso and not code2[2] in asso2:
                    asso[code1[2]] = code2[2]
                else:
                    return False, asso 

            if asso[code1[1]] == code2[1] and asso[code1[2]] == code2[2]:
                return code1[0] == code2[0], asso
            else:
                return False, asso 
    else:
        return False, asso 


def compareUpcode(code1, code2):
    if type(code1[0]) != type(code2[0]):
        return False
    elif isinstance(code1[0], str):
        return compareSingleUpcode(code1,code2)
    elif isinstance(code1[0], list):
        asso = {}
        for i in range(0, len(code1)):
            test, asso = compareSingleUpcodeWithMatching(code1[i],code2[i], asso)
            if test == False:
                return False
        return True


code1 = ["XOR", 'A', 'A']
code2 = ["XOR", 'r1', 'r1']


code3 =[
            ["XOR", "A", "A"],
            ["XOR", "A", "A"],
            ["MOV", "C", "C"]
        ]

code4 =[
            ["XOR", "C", "C"],
            ["XOR", "C", "C"],
            ["MOV", "A", "A"]
        ]


print(compareUpcode(code3, code4))

