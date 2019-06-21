#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>
#ifndef X
#define X x
#endif

int main()
{
	int		x = 5;
	char	name[10];
	char	gcc[33];
	char	exec[10];
	snprintf(name, 10, "Sully_%d.c", X);
	int	fd = open(name, O_CREAT | O_WRONLY | O_TRUNC, 0666);
	char data[] = "#include <stdio.h>%1$c#include <string.h>%1$c#include <stdlib.h>%1$c#include <fcntl.h>%1$c#ifndef X%1$c#define X x%1$c#endif%1$c%1$cint main()%1$c{%1$c	int		x = %5$d;%1$c	char	name[10];%1$c	char	gcc[33];%1$c	char	exec[10];%1$c	snprintf(name, 10, %2$cSully_%3$cd.c%2$c, X);%1$c	int	fd = open(name, O_CREAT | O_WRONLY | O_TRUNC, 0666);%1$c	char data[] = %2$c%4$s%2$c;%1$c	dprintf(fd, data, 10, 34, 37, data, X);%1$c	snprintf(gcc, 33, %2$cgcc -DX=x-1 -o Sully_%3$c1$d Sully_%3$c1$d.c%2$c, X);%1$c	system(gcc);%1$c	if (X > 0)%1$c	{%1$c		snprintf(exec, 10, %2$c./Sully_%3$cd%2$c, X);%1$c		system(exec);%1$c	}%1$c}%1$c";
	dprintf(fd, data, 10, 34, 37, data, X);
	snprintf(gcc, 33, "gcc -DX=x-1 -o Sully_%1$d Sully_%1$d.c", X);
	system(gcc);
	if (X > 0)
	{
		snprintf(exec, 10, "./Sully_%d", X);
		system(exec);
	}
}
