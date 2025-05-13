#include <iostream>
#include <cuda_runtime.h>

int main() {
    int deviceCount = 0;
    cudaError_t error_id = cudaGetDeviceCount(&deviceCount);

    if (error_id != cudaSuccess) {
        std::cerr << "cudaGetDeviceCount returned " << static_cast<int>(error_id)
                  << ": " << cudaGetErrorString(error_id) << std::endl;
        return EXIT_FAILURE;
    }

    if (deviceCount == 0) {
        std::cout << "No CUDA-compatible devices found.\n";
        return 0;
    }

    std::cout << "Found " << deviceCount << " CUDA-compatible device(s):\n";

    for (int dev = 0; dev < deviceCount; ++dev) {
        cudaDeviceProp deviceProp;
        cudaGetDeviceProperties(&deviceProp, dev);

        std::cout << "\nDevice " << dev << ": " << deviceProp.name << "\n";
        std::cout << "  Compute capability: " << deviceProp.major << "." << deviceProp.minor << "\n";
        std::cout << "  Total global memory: " << deviceProp.totalGlobalMem / (1024 * 1024) << " MB\n";
        std::cout << "  Shared memory per block: " << deviceProp.sharedMemPerBlock / 1024 << " KB\n";
        std::cout << "  Registers per block: " << deviceProp.regsPerBlock << "\n";
        std::cout << "  Warp size: " << deviceProp.warpSize << "\n";
        std::cout << "  Max threads per block: " << deviceProp.maxThreadsPerBlock << "\n";
        std::cout << "  Max threads dim: [" 
                  << deviceProp.maxThreadsDim[0] << ", " 
                  << deviceProp.maxThreadsDim[1] << ", " 
                  << deviceProp.maxThreadsDim[2] << "]\n";
        std::cout << "  Max grid size: [" 
                  << deviceProp.maxGridSize[0] << ", " 
                  << deviceProp.maxGridSize[1] << ", " 
                  << deviceProp.maxGridSize[2] << "]\n";
        std::cout << "  Clock rate: " << deviceProp.clockRate / 1000 << " MHz\n";
        std::cout << "  Multiprocessor count: " << deviceProp.multiProcessorCount << "\n";
        std::cout << "  Memory clock rate: " << deviceProp.memoryClockRate / 1000 << " MHz\n";
        std::cout << "  Memory bus width: " << deviceProp.memoryBusWidth << " bits\n";
    }

    return 0;
}
