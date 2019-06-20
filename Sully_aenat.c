#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/stat.h>
#ifndef DEC
#define DEC
#endif
#define A(x) char *s = #x; int i = 5; int main(){x}
A(char *buff; if(i <= 0) return 0; DEC asprintf(&buff, "Sully_%d.c", i); int fd = open(buff, O_WRONLY|O_CREAT|O_TRUNC,S_IRWXU); free(buff); if(fd<=2) return 1; dprintf(fd, "#include <unistd.h>\n#include <fcntl.h>\n#include <stdio.h>\n#include <stdlib.h>\n#include <sys/stat.h>\n#ifndef DEC\n#define DEC\n#endif\n#define A(x) char *s = #x; int i = %d; int main(){x}\nA(%s)\n",i,s); close(fd); asprintf(&buff, "clang -DDEC='--i;' Sully_%1$d.c -o Sully_%1$d && ./Sully_%1$d", i); system(buff); free(buff);)
