#!/bin/sh
Cur_Dir=$(pwd)
pt=$(ls phenotypes_*)
for i in ${pt}
do
j=`echo ${i} | cut -d \_ -f 2`
echo -e "#!/public/home/hwu/mcbin/python2.7.12/bin/python2.7\nfrom fastlmm.association import single_snp\nimport matplotlib.pyplot as plt\nimport numpy as np\n" > runfastlmm_${j}.py
echo -e "bed_prefix = '$Cur_Dir/${j}'\nphenotypes = '$Cur_Dir/phenotypes_${j}'\noutput_pvalues = '$Cur_Dir/pvalues_${j}.txt'\nresults_df = single_snp(bed_prefix, phenotypes,output_file_name=output_pvalues)" >> runfastlmm_${j}.py
#covar = covariates
echo -e "#!/bin/bash\n#PBS -N run_fastlmm_${j}\n#PBS -l nodes=node62:ppn=1\n#PBS -l walltime=480:00:00\n#PBS -e errlog_rf_${j}\n" > fastlmm_${j}.pbs
echo "cd \$PBS_O_WORKDIR" >> fastlmm_${j}.pbs
echo -e "\npython runfastlmm_${j}.py" >> fastlmm_${j}.pbs
qsub fastlmm_${j}.pbs
done
