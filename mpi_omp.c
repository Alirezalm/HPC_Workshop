#include <mpi.h>
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]) {
    int rank, size, thread_id, num_threads;
    char processor_name[MPI_MAX_PROCESSOR_NAME];
    int name_len;

    // Initialize MPI
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Get_processor_name(processor_name, &name_len);

    // Parallel region with OpenMP
    #pragma omp parallel private(thread_id, num_threads)
    {
        thread_id = omp_get_thread_num();
        num_threads = omp_get_num_threads();
        
        // Each thread prints a message
        printf("Hello World from MPI rank %d (of %d) on %s, OpenMP thread %d (of %d)\n",
               rank, size, processor_name, thread_id, num_threads);
    }

    // Finalize MPI
    MPI_Finalize();
    return 0;
}