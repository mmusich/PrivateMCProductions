#!/bin/bash

mySeed=$1
nEvts=$2
globalTag=$3
JobName=step1_UndergroundCosmicSPLooseMu_${nEvts}_evts_seed_$mySeed

echo  "Job started at " `date`

CMSSW_DIR=$4
LXBATCH_DIR=$PWD

cd ${CMSSW_BASE}/src
eval `scramv1 runtime -sh`
cd $LXBATCH_DIR

cp ${CMSSW_DIR}/UndergroundCosmicSPLooseMu_cfi_py_GEN_SIM_DIGI_L1_DIGI2RAW_RAW2DIGI_L1Reco_RECO_ALCA_Templ.py .
echo "cmsRun ${CMSSW_DIR}/UndergroundCosmicSPLooseMu_cfi_py_GEN_SIM_DIGI_L1_DIGI2RAW_RAW2DIGI_L1Reco_RECO_ALCA_Templ.py"

cmsRun UndergroundCosmicSPLooseMu_cfi_py_GEN_SIM_DIGI_L1_DIGI2RAW_RAW2DIGI_L1Reco_RECO_ALCA_Templ.py myseed=${mySeed} maxEvents=${nEvts} >& ${JobName}.out

echo "Content of working directory is: " `ls -lrt`

eos mkdir -p /eos/cms/store/group/alca_trackeralign/$USER/test_out/Cosmics2018MCProd/

for payloadOutput in $(ls *root ); do xrdcp -f $payloadOutput root://eoscms.cern.ch//eos/cms/store/group/alca_trackeralign/$USER/test_out/Cosmics2018MCProd/step1_UndergroundCosmicSPLooseMu_${globalTag}_${nEvts}_evts_seed_${mySeed}.root ; done

mv ${JobName}.out ${CMSSW_DIR}/outfiles
mv ${JobName}.err ${CMSSW_DIR}/outfiles
mv ${JobName}.log ${CMSSW_DIR}/outfiles

echo  "Job ended at " `date`

exit 0