#!/bin/bash

cd ~/projects/def-amw8/mesbahi/loss-of-plasticity/lop/slowly_changing_regression
module load python/3.9
source /home/mesbahi/projects/def-amw8/mesbahi/loss-of-plasticity/venv/bin/activate



#create 100 json files in env_temp_cfg
mkdir env_temp_cfg temp_cfg
/home/mesbahi/projects/def-amw8/mesbahi/loss-of-plasticity/venv/bin/python3.9 multi_param_expr.py -c cfg/prob.json 

#generate dataset for the json files
for i in {0..99}
do
    /home/mesbahi/projects/def-amw8/mesbahi/loss-of-plasticity/venv/bin/python3.9 slowly_changing_regression.py -c env_temp_cfg/$i.json 
done

#create 100 json files for learning models
/home/mesbahi/projects/def-amw8/mesbahi/loss-of-plasticity/venv/bin/python3.9 multi_param_expr.py -c cfg/sgd/bp/relu.json 