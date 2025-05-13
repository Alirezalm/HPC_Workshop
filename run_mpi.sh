#!/bin/bash
#SBATCH --job-name=mpi
#SBATCH --account=project_2014289
#SBATCH --partition=medium
#SBATCH --time=02:00:00
#SBATCH --nodes=20
#SBATCH --ntasks-per-node=1
#SBATCH --ntasks=20
#SBATCH --mem-per-cpu=1G
#SBATCH --output=mpi.txt
srun mpi