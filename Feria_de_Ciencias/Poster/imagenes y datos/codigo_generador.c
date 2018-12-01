#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<math.h>


int mini=1;
int maxi=15000;					//32767 es el maximo

void CAMBIO (float *a,float *b){
	float c=*a;
	*a=*b;
	*b=c;
}

int PARTICION (float *A,int p, int r){
	float x=A[r-1];
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


int RANDOM_PARTICION (float *A,int p,int r){
	//srand(time(NULL));
	int i=rand()%(r-p)+p;
	CAMBIO(&A[i],&A[r-1]);
	//printf("\n--\n random:%d",i);
	//IMPRIMIR(A,r);
	return PARTICION(A,p,r);
}

float RANDOM_SELECCION (float *A,int p,int r,int i){
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

float SELECCION (float *A,int p,int r,int i){
	if(p==r-1){
		return A[p];
	}
	//printf("\n-");
	int q=PARTICION(A,p,r);
	//printf("\n---\n");
	int k=q-p+1;
	if(i==k){
		return A[q];
	}
	else{
		if(i<k){
			return SELECCION(A,p,q,i);
		}
		else{
			return SELECCION(A,q+1,r,i-k);
		}
	}
}

void radixsort(float *a, int n)
{
  int i, m = 0, exp = 1, j=0;
  float b[n];
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
      bucket[(int)a[i] / exp % 10]++;
    for (i = 1; i < 10; i++)
         bucket[i] += bucket[i - 1];
    for (i = n - 1; i >= 0; i--)
    {
       b[--bucket[(int)a[i] / exp % 10]] = a[i];
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
	int r=0;	//cantidad de datos
	float *A,*B,*C,*E;		//A es el original y no se modifica
										//B se ordena con burbuja
										//C se ordena con quicksort
										//D se ordena con random_quicksort
										//E se encuentra el i-esimo
	//int *m=A;
	int i,j,k;								//para contador
	srand(time(NULL));

	clock_t start_t, end_t,inicio,fin;				//para contar el tiempo
	//IMPRIMIR(A,r);
	float total1=0,total2=0,total3=0,medi;

	r=1;
	A = calloc(r,sizeof(float));
	B = calloc(r,sizeof(float));
	C = calloc(r,sizeof(float));
	E = calloc(r,sizeof(float));

	printf("QUICKSELECT\t");

	printf("RANDOM QUICKSELECT\t");

	printf("RADIX\n\n");

	for(k=10;k<100;k++){
		r=5000*k;
		A = realloc(A,r*sizeof(float));
		B = realloc(B,r*sizeof(float));
		C = realloc(C,r*sizeof(float));
		E = realloc(E,r*sizeof(float));
		//printf("\n%d\n",r);

		for(j=0;j<5;j++){
			for(i=0;i<r;i++){
				A[i]=((float)rand()/(float)(RAND_MAX))*(maxi-mini+1)+mini;
				//A[i]=rand()%(maxi-mini+1)+mini;	//numero random
			
				B[i]=A[i];						//copia en todos los arrays los mismos numeros
				C[i]=A[i];
				E[i]=A[i];
			}
	
			inicio = clock();
			medi=SELECCION(E,0,r,(r+1)/2);
			fin = clock();	
			total1 = total1 + (double)(fin - inicio)/CLOCKS_PER_SEC;
			//printf("%f\t",(double)(fin - inicio)/CLOCKS_PER_SEC);
	

			inicio = clock();
			medi=RANDOM_SELECCION(C,0,r,(r+1)/2);
			fin = clock();	
			total2 = total2 + (double)(fin - inicio)/CLOCKS_PER_SEC;
			//printf("%f\t",total2);
	
	
			inicio = clock();
			radixsort(B,r);
			fin = clock();	
			total3 = total3 + (double)(fin - inicio)/CLOCKS_PER_SEC;
			//printf("%f\n",total3);
		}
		total1=total1/5;
		printf("%f\t",total1);
		total2=total2/5;
		printf("%f\t",total2);
		total3=total3/5;
		printf("%f\n",total3);
	}
}

