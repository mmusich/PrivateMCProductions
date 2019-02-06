#!/bin/bash

eval `scramv1 runtime -sh`
CMSSW_DIR=${CMSSW_BASE}/src/PrivateMCProductions/TkAlMinBias

if [ -d $CMSSW_DIR/outfiles ]; then
    echo "$CMSSW_DIR/outfiles already exists, skipping"
else
    mkdir $CMSSW_DIR/outfiles
fi

condor_submit par1=100 par2=102X_upgrade2018_realistic_v10 par3=${CMSSW_DIR} multisub.sub

# for i in {1..10}; do   
#     echo "------ submitting job with seed = $i"
#     condor_submit par1=${i} par2=10000 par3=102X_upgrade2018_realistic_v10 submit.sub par4=${CMSSW_DIR}
# done

