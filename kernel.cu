/******************************************************************************
 *cr
 *cr            (C) Copyright 2010 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ******************************************************************************/

#include <stdio.h>
    

__global__ void VecAdd(int n, const float *A, const float *B, float* C) {

    /********************************************************************
     *
     * Compute C = A + B
     *   where A is a (1 * n) vector
     *   where B is a (1 * n) vector
     *   where C is a (1 * n) vector
     *
     ********************************************************************/

    // INSERT KERNEL CODE HERE
	//float *d_A,*d_B,*d_C;
	//int size = n*sizeof(float);

	/*cudaError_t err =*/// cudaMalloc(&d_A,size);
	/*if (err != cudaSuccess) {
		 printf(“%s in %s at line %d\n”, __LINE__); exit(EXIT_FAILURE);
	}
	err =*/// cudaMalloc(&d_B,size);
	/*if (err != cudaSuccess) {
		 printf(“%s in %s at line %d\n”, __LINE__); exit(EXIT_FAILURE);
	}	
//	err = */    // cudaMalloc(&d_C,size);
	/*if (err != cudaSuccess) {
		 printf(“%s in %s at line %d\n”, __LINE__); exit(EXIT_FAILURE);
	}*/
//	cudaMemcpy(d_A, A, size, cudaMemcpyHostToDevice);
//	cudaMemcpy(d_B, B, size, cudaMemcpyHostToDevice);
	
//	int i = 0;
//	for(i=0;i<n;i++){
//		d_C[i] = d_A[i] + d_B[i];
//	}






	int i = blockIdx.x*blockDim.x + threadIdx.x;
	if(i<n) C[i] = A[i] + B[i];	
}


void basicVecAdd( float *A,  float *B, float *C, int n)
{

    // Initialize thread block and kernel grid dimensions ---------------------

    const unsigned int BLOCK_SIZE = 256; //changed from 512 

    //INSERT CODE HERE
		

	dim3 DimGrid((n-1)/BLOCK_SIZE + 1, 1,1);
	dim3 DimBlock(BLOCK_SIZE,1,1);	
	
	

	
	
	
		
	VecAdd<<<DimGrid,DimBlock>>>(n,A,B,C);

	
	
		

	//dim3 DimGrid(ceil(n/256),1,1);
	//dim3 DimBlock(256,1,1);
	//vecAddKernel<<<DimGrid,DimBlock>>(d_A,d_B,d_C,n);

}

