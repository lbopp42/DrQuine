#include <stdio.h>

/*
   This is a comment
*/
void f()
{
	return ;
}

int main()
{
	/*
	   An other one
	*/
	char *s = "#include <stdio.h>%1$c%1$c/*%1$c   This is a comment%1$c*/%1$cvoid f()%1$c{%1$c	return ;%1$c}%1$c%1$cint main()%1$c{%1$c	/*%1$c	   An other one%1$c	*/%1$c	char *s = %2$c%s%2$c;%1$c	f();%1$c	printf(s, 10, 34, s);%1$c	return (0);%1$c}%1$c";
	f();
	printf(s, 10, 34, s);
	return (0);
}
