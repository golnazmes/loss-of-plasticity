#!/bin/bash

cd ~/projects/def-amw8/mesbahi/los-of-plasticity/lop/slowly_changing_regression
module load python/3.9
source /home/mesbahi/projects/def-amw8/mesbahi/los-of-plasticity/venv/bin/activate


#create 100 json files in env_temp_cfg
mkdir env_temp_cfg temp_cfg
python multi_param_expr.py -c cfg/prob.json 

#generate dataset for the json files
for i in {0..99}
do
    python slowly_changing_regression.py -c env_temp_cfg/$i.json 
done

#create 100 json files for learning models
python multi_param_expr.py -c cfg/sgd/bp/relu.json 