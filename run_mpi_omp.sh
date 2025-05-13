#!/bin/bash
#SBATCH --job-name=mpi_omp
#SBATCH --account=project_2014289
#SBATCH --partition=medium
#SBATCH --time=02:00:00
#SBATCH --nodes=5
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=10
#SBATCH --ntasks=5
#SBATCH --mem-per-cpu=1G
#SBATCH --output=mpi_openmp.txt

# set the number of threads based on --cpus-per-task
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

srun mpi_omp