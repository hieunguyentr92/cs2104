#include <stdio.h>

int eax, ebx, ecx, edx, esi, edi, esp, ebp ;
unsigned char M[10000] ;

void exec() {
  esi = ebx ;
  eax = ecx ;
  eax -- ;
  eax <<= 2 ;
  edi = esi + eax ;
  again:
  if ( esi >= edi ) goto end ;
  eax = *(int*)&M[esi] ;
  edx = *(int*)&M[edi] ;
  *(int*)&M[esi] = edx ;
  *(int*)&M[edi] = eax ;
  esi += 4 ;
  edi -= 4 ;
  goto again ;
  end:{}
}

int main() {
  int i ;
  ebx = 0 ;
  ecx = 10 ;
  for (i=0;i<40;i+=4) *(int*)&M[i] = i ;
  exec() ;
  for (i=0;i<40;i+=4) printf("%d\n",*(int*)&M[i]);
  return 0 ;
}
