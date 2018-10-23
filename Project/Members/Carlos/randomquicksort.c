#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<math.h>

int Q=10;

void IMPRIMIR(float A[],int p,int r){
	int i;
	printf("\n");
	for(i=p;i<r;i++){
		printf("%f\t",A[i]);
	}
	printf("\n");
}

void CAMBIO (float *a,float *b){
	float c=*a;
	*a=*b;
	*b=c;
}

int PARTICION (float *A,int p, int r){

	int k=rand()%(r-p)+p;
	CAMBIO(&A[k],&A[r-1]);


	float x=A[r-1]; //x es el pivote
	int i=p-1;
	int j;
	//printf("**%d**\n",i);
	for(j=p;j<r-1;j++){
		if(A[j] <= x){
			i=i+1;
			CAMBIO(&A[i],&A[j]);
		}
        //IMPRIMIR(A,p,r);//printf("**%d**",i);
	}
	//IMPRIMIR(A,r);
	CAMBIO(&A[i+1],&A[r-1]);
	return i+1;
}

void QUICKSORT (float *A,int p,int r){
	if(p<r){
		int q=PARTICION(A,p,r);printf("*%f*\n",A[q]);
        IMPRIMIR(A,p,r);
		QUICKSORT(A,p,q);
		QUICKSORT(A,q+1,r);
	}
	
}

int main(){
    int n=Q;
    float A[n];		//A es el original y no se modifica)
    srand(time(NULL));

    int i;

	int max = 10,min = 1;

    for(i=0;i<n;i++){
		A[i]=((float)rand()/(float)(RAND_MAX))*(max + min + 1)+min;
    }

    IMPRIMIR(A,0,n);
    printf("-------------\n");
    QUICKSORT(A,0,n);
    printf("-------------\n");
    IMPRIMIR(A,0,n);

    return 0;
}