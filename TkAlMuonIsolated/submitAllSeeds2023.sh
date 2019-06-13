#!/bin/bash

eval `scramv1 runtime -sh`
CMSSW_DIR=${CMSSW_BASE}/src/PrivateMCProductions/TkAlMuonIsolated
cd $CMSSW_DIR

if [ -d $CMSSW_DIR/outfiles ]; then
    echo "$CMSSW_DIR/outfiles already exists, skipping"
else
    mkdir $CMSSW_DIR/outfiles
fi

for i in {1..250}; do   
    echo "------ submitting job with seed = $i"
    condor_submit par1=${i} par2=10000 par3=106X_mcRun3_2023_realistic_Candidate_2019_06_07_21_52_54 submit.sub par4=${CMSSW_DIR}
done
