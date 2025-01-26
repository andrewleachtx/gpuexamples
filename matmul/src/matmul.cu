#include <iostream>
#include <cuda_runtime.h>
#include <Eigen/Dense>

using std::cout, std::endl;

// vary as needed
using scalar_t = float;
int main() {
    // Eigen to make human rebaedable
    // Test case in gemm.cuh
    Eigen::Matrix<scalar_t, 3, 2> X = Eigen::Matrix<scalar_t, 3, 2>::Zero();
    Eigen::Matrix<scalar_t, 2, 4> Y = Eigen::Matrix<scalar_t, 2, 4>::Zero();
    Eigen::Matrix<scalar_t, 3, 4> Z = Eigen::Matrix<scalar_t, 3, 4>::Zero();

    return 0;
}