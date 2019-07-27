#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#include <unistd.h>
#ifndef X
#define X x
#endif

int main()
{
	int		x = 5;
	char	*name;
	char	*gcc;
	char	*exec;
	char data[] = "#include <stdio.h>%1$c#include <string.h>%1$c#include <stdlib.h>%1$c#include <fcntl.h>%1$c#include <unistd.h>%1$c#ifndef X%1$c#define X x%1$c#endif%1$c%1$cint main()%1$c{%1$c	int		x = %5$d;%1$c	char	*name;%1$c	char	*gcc;%1$c	char	*exec;%1$c	char data[] = %2$c%4$s%2$c;%1$c	if (x > 0)%1$c	{%1$c		asprintf(&name, %2$cSully_%3$cd.c%2$c, X);%1$c		int	fd = open(name, O_CREAT | O_WRONLY | O_TRUNC, 0666);%1$c		free(name);%1$c		if (fd >= 0)%1$c		{%1$c			dprintf(fd, data, 10, 34, 37, data, X);%1$c			close(fd);%1$c			asprintf(&gcc, %2$cgcc -DX=x-1 -o Sully_%3$c1$d Sully_%3$c1$d.c%2$c, X);%1$c			system(gcc);%1$c			asprintf(&exec, %2$c./Sully_%3$cd%2$c, X);%1$c			system(exec);%1$c			free(gcc);%1$c			free(exec);%1$c		}%1$c	}%1$c}%1$c";
	if (x > 0)
	{
		asprintf(&name, "Sully_%d.c", X);
		int	fd = open(name, O_CREAT | O_WRONLY | O_TRUNC, 0666);
		free(name);
		if (fd >= 0)
		{
			dprintf(fd, data, 10, 34, 37, data, X);
			close(fd);
			asprintf(&gcc, "gcc -DX=x-1 -o Sully_%1$d Sully_%1$d.c", X);
			system(gcc);
			asprintf(&exec, "./Sully_%d", X);
			system(exec);
			free(gcc);
			free(exec);
		}
	}
}
