#include "functions.h"

void main(){
	int r=CANT;	//cantidad de datos
	int A[r],B[r],C[r],D[r],E[r];		//A es el original y no se modifica
										//B se ordena con burbuja
										//C se ordena con quicksort
										//D se ordena con random_quicksort
										//E se encuentra el i-esimo
	//int *m=A;
	int i;								//para contador
	srand(time(NULL));
	for(i=0;i<r;i++){
		A[i]=rand()%(maxi-mini+1)+mini;	//numero random
		
		B[i]=A[i];						//copia en todos los arrays los mismos numeros
		C[i]=A[i];
		D[i]=A[i];
		E[i]=A[i];
	}
	
	clock_t start_t, end_t,inicio,fin;				//para contar el tiempo


	printf("\nQUICKSORT:\n");
	start_t = clock();
	QUICKSORT(C,0,r);
	end_t = clock();
	//IMPRIMIR(C,r);
	IMP_MEDIANA(C,r);
	IMP_TIEMPO(start_t,end_t);	

	printf("\nRANDOM_QUICKSORT:\n");	
	inicio = clock();
	RANDOM_QUICKSORT(D,0,r);
	fin = clock();
	//IMPRIMIR(D,r);
	IMP_MEDIANA(D,r);
	IMP_TIEMPO(inicio,fin);
	
	
	printf("\nRANDOM_SELECCION:\n");
	inicio = clock();					//inicio
	int medi=RANDOM_SELECCION(E,0,r,(r+1)/2);
	fin = clock();						//fin
	//IMPRIMIR(E,r);
	printf("\n\tMediana: %d",medi);
	IMP_TIEMPO(inicio,fin);


	printf("\nBURBUJA:\n");
	inicio = clock();					//inicio
	BURBUJA(B,r);
	fin = clock();						//fin
	//IMPRIMIR(B,r);
	IMP_MEDIANA(B,r);
	IMP_TIEMPO(inicio,fin);
	
}