#include "gemm.cuh"

/*
    Matrix multiplies take two matrices of dimensions
    
    ixj * mxn => in
    
    and as long as j == m, the outputted matrix dims are ixn.
    
    ---

    Example 1:

    x (3 x 2)
    y (2 x 4)
    produces
    z (3 x 4)

    x1 x4 y1 y3 y5 y7
    x2 x5 y2 y4 y6 y8
    x3 x6
    
    z1 z4 z7 z10
    z2 z5 z8 z11
    z3 z6 z9 z12
    
    ==
    
    x1*y1 + x4*y2 | x1*y3 + x4*y4 | x1*y5 + x4*y6 | x1*y7 + x4*y8
    x2*y1 + x5*y2 | x2*y3 + x5*y4 | x2*y5 + x5*y6 | x2*y7 + x5*y8
    x3*y1 + x6*y2 | x3*y3 + x6*y4 | x3*y5 + x6*y6 | x3*y7 + x6*y8
    
    for each row in x, do dot product of each column in y1 (kind of)
*/

/*
    Raw, first intuition of GEMM on CPU.
*/
template <typename T>
__global__ void cpuGEMM(const T *X, const size_t x_nrows, const size_t x_ncols,
                        const T *Y, const size_t y_nrows, const size_t y_ncols,
                        T *Z, const size_t z_nrows, const size_t z_ncols) {
    for (size_t rx = 0; rx < x_nrows; rx++) {
        for (size_t cx = 0; cx < x_ncols; cx++) {
            size_t idx = cx * x_nrows + rx;

            
        }
    }
}

template <typename T>
__global__ void kernelGEMMv0(const T *X, const size_t x_nrows, const size_t x_ncols,
                        const T *Y, const size_t y_nrows, const size_t y_ncols,
                        T *Z, const size_t z_nrows, const size_t z_ncols) {
    // Which row 
    int r = blockIdx.x * blockDim.x + threadIdx.x;
    int c = blockIdx.y * blockDim.y + threadIdx.y;
    
}