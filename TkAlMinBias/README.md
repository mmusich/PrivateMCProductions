# PrivateMCProductions: TkAlZMuMu

```
cmsrel CMSSW_10_2_0
cd CMSSW_10_2_0/src
git clone git@github.com:mmusich/PrivateMCProductions.git
cd PrivateMCProductions/TkAlMinBias/
mkdir outfiles
./submitAllSeeds.sh
```

this will create 2.5M events (250 jobs for 10k Z->mu,mu events each). N.B. efficiency is not 100%, so you'll see many less reconstruction-level events.
