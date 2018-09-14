#ifndef FUNCTIONSH
#define FUNCTIONSH
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <math.h>

void IMP_TIEMPO(clock_t inicio,clock_t fin);
void IMPRIMIR(int A[],int r);
void IMP_MEDIANA(int A[],int r);
void CAMBIO (int *a,int *b);
void BURBUJA (int *A,int r);
int PARTICION (int *A,int p, int r);
void QUICKSORT (int *A,int p,int r);
int RANDOM_PARTICION (int *A,int p,int r);
void RANDOM_QUICKSORT (int *A,int p,int r);
int RANDOM_SELECCION (int *A,int p,int r,int i);

int mini = 1;
int maxi = 15000;					//32767 es el maximo
int CANT = 50001;					//103611 ese es el maximo, la computadora no ejecuta mas
#endif