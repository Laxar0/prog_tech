def support_my_format(s):
    if s[0].isdigit() and s[1]==':' and int (s[0])==len (s)-2:
        return True
    return False

def transform_into_my_format(classical_s):
    if len(classical_s) > 9:
        raise ValueError ("myFormat is not supported for this string")
    return str(len (classical_s))+':'+classical_s

def concat(s1, s2):
    return str(int (s1[0])+int (s2[0]))+':'+s1[2:]+s2[2:]