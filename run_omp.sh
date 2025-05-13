#!/bin/bash

#SBATCH --job-name=shared_memory_program    # Name of the job shown in the job queue
#SBATCH --account=project_2014289           # Billing account/project ID
#SBATCH --partition=small                   # Partition (queue) to submit the job to
#SBATCH --time=02:00:00                     # Maximum runtime (2 hours)
#SBATCH --nodes=1                           # Request 1 compute node
#SBATCH --ntasks-per-node=1                 # Launch 1 task (process) on the node
#SBATCH --ntasks=1                          # Total number of tasks = 1
#SBATCH --cpus-per-task=40                  # Allocate 40 CPUs (threads) to the task
#SBATCH --mem-per-cpu=2G                    # Allocate 2 GB memory per CPU (total = 80 GB)
#SBATCH --output=omp.txt                    # Standard output will be written to omp.txt

# Set the number of OpenMP threads to match allocated CPUs
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

# Run the application using srun (Slurm's parallel launcher)
srun omp_app
