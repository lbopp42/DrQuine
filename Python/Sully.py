import os

def main():
    i = 5
    if __debug__ == False:
        i = i - 1
    s = "import os{0:c}{0:c}def main():{0:c}    i = {1}{0:c}    if __debug__ == False:{0:c}        i = i - 1{0:c}    s = {2:c}{3:s}{2:c}{0:c}    if i >= 0:{0:c}        fd = open('Sully_' + str(i) + '.py', 'w+'){0:c}        print(s.format(0x0a, i, 0x22, s), file=fd){0:c}        fd.close(){0:c}        os.system('python3 -O Sully_' + str(i) + '.py'){0:c}{0:c}if __name__ == '__main__':{0:c}	main()"
    if i >= 0:
        fd = open('Sully_' + str(i) + '.py', 'w+')
        print(s.format(0x0a, i, 0x22, s), file=fd)
        fd.close()
        os.system('python3 -O Sully_' + str(i) + '.py')

if __name__ == '__main__':
	main()
