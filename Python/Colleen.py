#Comment

def f():
    s = "#Comment{1:c}{1:c}def f():{1:c}    s = {2:c}{0}{2:c}{1:c}    print(s.format(s, 0x0a, 0x22, 0x5c)){1:c}{1:c}def main():{1:c}    #Comment in main{1:c}    f(){1:c}{1:c}if __name__ == '__main__':{1:c}    main()"
    print(s.format(s, 0x0a, 0x22, 0x5c))

def main():
    #Comment in main
    f()

if __name__ == '__main__':
    main()
