from CRABClient.UserUtilities import config 
config = config()

config.section_('General')
config.General.requestName = 'MB_2017'
config.General.workArea = 'crab_projects'
config.General.transferOutputs = True
config.General.transferLogs = True

config.section_('JobType')
config.JobType.pluginName = 'PrivateMC'
config.JobType.psetName = 'MB_2017_cfg.py'
config.JobType.outputFiles = ['TkAlMinBias.root']
config.JobType.allowUndistributedCMSSW = True
config.JobType.maxMemoryMB = 3000

config.section_('Data')
config.Data.outputPrimaryDataset = 'MinBias'
config.Data.publication     = False
config.Data.splitting = 'EventBased'
NJOBS = 9999
config.Data.unitsPerJob = 100
config.Data.totalUnits = config.Data.unitsPerJob * NJOBS

config.Data.outLFNDirBase = '/store/user/tsusa/UL_TkAli/2017'
config.Data.outputDatasetTag  = config.General.requestName
#config.Data.outputPrimaryDataset = 'MinBias'

config.section_('Site')
config.Site.storageSite = 'T2_HU_Budapest'
