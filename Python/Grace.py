#My comment
SRC = "#My comment{0:c}SRC = {2:c}{1:s}{2:c}{0:c}F = lambda fd: print(SRC.format(0x0a, SRC, 0x22), file=fd){0:c}OPEN = lambda: F(open('Grace_kid.py', 'w+')){0:c}OPEN()"
F = lambda fd: print(SRC.format(0x0a, SRC, 0x22), file=fd)
OPEN = lambda: F(open('Grace_kid.py', 'w+'))
OPEN()
