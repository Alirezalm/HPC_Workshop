#!/bin/bash
#SBATCH --job-name=single_gpu
#SBATCH --account=project_2014289
#SBATCH --partition=gpusmall
#SBATCH --time=02:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2G
#SBATCH --gres=gpu:a100:2
#SBATCH --output=single_gpu.txt

srun gpu_info