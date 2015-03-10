#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int	main()
{
  char		*s;
  char		*r;

  s = strdup("123456789");
  r = strdup("123456789");
  printf("LIBC: %d\n", strlen(s));
  printf("ASM: %d\n", my_strlen(s));
  printf("LIBC: %s\n", memset(s, 'Z', 5));
  printf("ASM: %s\n" ,my_memset(r, 'Z', 5));
  printf("LIBC: %p\n", strchr(s, '8'));
  printf("ASM: %p\n", my_strchr(s, '8'));
    printf("LIBC: %d\n", strlen(NULL));
  printf("ASM: %d\n", my_strlen(NULL));
  printf("ASM: %s\n" ,my_memset(r, 'Z', -5));
  printf("ASM: %p\n", my_strchr(NULL, '8'));
  return (0);
}
