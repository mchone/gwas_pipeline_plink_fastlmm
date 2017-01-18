#!/bin/sh
#you must put original files(533.tfam,533.tped,list_533.txt),your phenotype data(phenotypes.txt) and scripts
#(split.R,sub_split.pl) in this directory, DO NOT change files' names. just type 'sh data_prepare.sh' to run
perl sub_split.pl phenotypes.txt list_533.txt
pt=$(ls phenotypes_*)
for i in ${pt}
do
j=`echo ${i} | cut -d \_ -f 2`
echo -e "#!/bin/bash\n#PBS -N ${j}\n#PBS -l nodes=node63:ppn=1\n#PBS -l walltime=480:00:00\n#PBS -e errlog_${j}\n" > ${j}.pbs
echo "cd \$PBS_O_WORKDIR" >> ${j}.pbs
echo -e "Rscript split.R ${i}" >> ${j}.pbs
echo -e "/public/home/hwu/mcbin/plink_1.9beta/plink --tfile ${j} --maf 0.05 --geno 0.25 --out ${j} --make-bed --noweb" >> ${j}.pbs
qsub ${j}.pbs
done
