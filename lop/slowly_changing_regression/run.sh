#!/bin/bash

#SBATCH --array=0-99
#SBATCH --output=Array_test.%A_%a.out
#SBATCH --error=Array_test.%A_%a.error
#SBATCH --job-name=sgd



#SBATCH --mem=15G
#SBATCH --cpus-per-task=1
#SBATCH --time=0-2:59:59


#SBATCH --mail-user=<mesbahi@ualberta.ca>
#SBATCH --mail-type=ALL


cd ~/projects/def-amw8/mesbahi/los-of-plasticity/lop/slowly_changing_regression
module load python/3.9
source /home/mesbahi/projects/def-amw8/mesbahi/los-of-plasticity/venv/bin/activate

#run the models on them
python expr.py -c temp_cfg/$SLURM_ARRAY_TASK_ID.json 
