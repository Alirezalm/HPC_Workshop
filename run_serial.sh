#!/bin/bash
#SBATCH --job-name=serial_program   #Job name
#SBATCH --account=project_2014289   #billing project, use csc-projects
#SBATCH --partition=small           #Partition name
#SBATCH --time=02:00:00             #Max duration of the job
#SBATCH --mem-per-cpu=2G            #Memory per CPU core
#SBATCH --output=serial.txt         #Output file


srun serial_app                          #Run program using requested resources