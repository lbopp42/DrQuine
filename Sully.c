#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <fcntl.h>

int main()
{
	int		x = 5;
	char	name[10];
	snprintf(name, 10, "Sully_%d.c", x);
	int	fd = open(name, O_CREAT | O_WRONLY, 0666);
	char data[] = "#include <stdio.h>%1$c#include <string.h>%1$c#include <stdlib.h>%1$c#include <fcntl.h>%1$c%1$cint main()%1$c{%1$c	int		x = 5;%1$c	char	name[10];%1$c	snprintf(name, 10, %2$cSully_%3$cd.c%2$c, x);%1$c	int	fd = open(name, O_CREAT | O_WRONLY, 0666);%1$c	char data[] = %2$c%4$s%2$c;%1$c	dprintf(fd, data, 10, 34, 37, data);%1$c}%1$c";
	dprintf(fd, data, 10, 34, 37, data);
}
