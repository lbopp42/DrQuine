#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>
/*
   My comment
*/
#define useless 1
#define x "#include <stdio.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c/*%1$c   My comment%1$c*/%1$c#define useless 1%1$c#define x %2$c%3$s%2$c%1$c#define FT() int main(){int fd = open(%2$cGrace_kid.c%2$c, O_WRONLY | O_CREAT);dprintf(fd, x, 10, 34, x);close(fd);return (0);}%1$c%1$cFT();%1$c"
#define FT() int main(){int fd = open("Grace_kid.c", O_WRONLY | O_CREAT);dprintf(fd, x, 10, 34, x);close(fd);return (0);}

FT();
