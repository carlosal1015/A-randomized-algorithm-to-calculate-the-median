#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<math.h>


int mini=1;
int maxi=1500;					//32767 es el maximo
int CANT=5001;					//103611 ese es el maximo, la computadora no ejecuta mas, 

void IMP_TIEMPO(clock_t inicio,clock_t fin){
	float total = (double)(fin - inicio)/CLOCKS_PER_SEC;
	printf("\n\t--------------------\n");
	printf("\tTiempo %.10e",total);
	printf("\n\t--------------------\n");
}


void IMPRIMIR(int A[],int r){
	int i;
	printf("\n");
	for(i=0;i<r;i++){
		printf("%d\t",A[i]);
	}
	printf("\n");
}

void IMP_MEDIANA(int A[],int r){
	if(r%2==1){
		printf("\n\tMediana: %d",A[(r-1)/2]);
	}
	else{
		printf("\n\tMediana: %d",(A[r/2]+A[(r/2)-1])/2);
	}
}

void CAMBIO (int *a,int *b){
	int c=*a;
	*a=*b;
	*b=c;
}

void BURBUJA (int *A,int r){
	int i,j;
	for(i=0;i<r-1;i++){
		for(j=i+1;j<r;j++){
			if(A[j] < A[i]){
				CAMBIO(&A[i],&A[j]);
			}
		}
	}

}

int PARTICION (int *A,int p, int r){
	int x=A[r-1];
	int i=p-1;
	int j;
	
	for(j=p;j<r-1;j++){
		if(A[j] <= x){
			i=i+1;
			CAMBIO(&A[i],&A[j]);
		}
	}
	//IMPRIMIR(A,r);
	CAMBIO(&A[i+1],&A[r-1]);
	return i+1;
}

void QUICKSORT (int *A,int p,int r){
	if(p<r){
		int q=PARTICION(A,p,r);
		QUICKSORT(A,p,q);
		QUICKSORT(A,q+1,r);
	}
	
}

int RANDOM_PARTICION (int *A,int p,int r){
	//srand(time(NULL));
	int i=rand()%(r-p)+p;
	CAMBIO(&A[i],&A[r-1]);
	//printf("\n--\n random:%d",i);
	//IMPRIMIR(A,r);
	return PARTICION(A,p,r);
}

void RANDOM_QUICKSORT (int *A,int p,int r){
	if(p<r){
		int q=RANDOM_PARTICION(A,p,r);
		RANDOM_QUICKSORT(A,p,q);
		RANDOM_QUICKSORT(A,q+1,r);
	}
}

int RANDOM_SELECCION (int *A,int p,int r,int i){
	if(p==r-1){
		return A[p];
	}
	//printf("\n-");
	int q=RANDOM_PARTICION(A,p,r);
	//printf("\n---\n");
	int k=q-p+1;
	if(i==k){
		return A[q];
	}
	else{
		if(i<k){
			return RANDOM_SELECCION(A,p,q,i);
		}
		else{
			return RANDOM_SELECCION(A,q+1,r,i-k);
		}
	}
}

void radixsort(int *a, int n)
{
  int i, b[CANT], m = 0, exp = 1, j=0;
  for (i = 0; i < n; i++) 
  {
    if (a[i] > m)  
      m = a[i]; 
  }
  while (m / exp > 0)  
  {
    int bucket[10];
    for (i = 0; i < 10; i++)
      bucket[i]=0;

    for (i = 0; i < n; i++)
      bucket[a[i] / exp % 10]++;
    for (i = 1; i < 10; i++)
         bucket[i] += bucket[i - 1];
    for (i = n - 1; i >= 0; i--)
    {
       b[--bucket[a[i] / exp % 10]] = a[i];
    }
    for (i = 0; i < n; i++)
      a[i] = b[i];
    #ifdef SHOWPASS
      j++;
      printf("\nt %d  : ",j);
      print(a, n);
      printf("%d",exp);
    #endif
    exp *= 10; //incremento de 1 10 100 1000 etc
  }
}

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
	//IMPRIMIR(A,r);

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
	float rqs=(double)(fin - inicio)/CLOCKS_PER_SEC;

/*
	printf("\nBURBUJA:\n");
	inicio = clock();					//inicio
	BURBUJA(B,r);
	fin = clock();						//fin
	//IMPRIMIR(B,r);
	IMP_MEDIANA(B,r);
	IMP_TIEMPO(inicio,fin);
*/

	
	printf("\nRADIX:\n");
	inicio = clock();					//inicio
	radixsort(B,r);
	fin = clock();						//fin
	//IMPRIMIR(B,r);
	IMP_MEDIANA(B,r);
	IMP_TIEMPO(inicio,fin);
	float rad=(double)(fin - inicio)/CLOCKS_PER_SEC;

	if(rqs<rad){
		printf("\nQUICKSELECT\n\n");
	}
	else if(rqs=rad){
		printf("\nIGUALES\n\n");
	}
	else{
		printf("\nRADIX\n\n");
	}



}

