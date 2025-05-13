#!/bin/bash
#SBATCH --job-name=multi_gpu
#SBATCH --account=project_2014289
#SBATCH --partition=gpumedium
#SBATCH --time=02:00:00
#SBATCH --ntasks=2
#SBATCH --ntasks-per-node=1
#SBATCH --nodes=2
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=2G
#SBATCH --gres=gpu:a100:4
#SBATCH --output=multi_gpu.txt

srun gpu_info