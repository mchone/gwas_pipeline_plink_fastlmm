# gwas_pipeline_plink_fastlmm

本流程使用plink将格式化的tped文件和tfam文件转化为可以使用的二进制bfiles，再使用fastlmm做gwas

1.准备phenotypes.txt，两列，第一列为533编号（格式如C001，W220），第二列为表型数据，tab分隔，注意不要改本文件文件名也不要加表头。

2.将原始snps数据533.tped与list_533.txt拷贝到当前文件夹。

3.将四个运行脚本data_prepare.sh、split.R、sub_split.pl、run_fastlmm.sh拷贝到当前文件夹。

4.运行data_prepare.sh，可以生成all、japall、tej、trj、indall、indI、indII、aus八类的二进制文件bfile。注意，该命令提交的作业均在胖节点上运行，如果在普通节点上可能会因为内存不足而报错。

5.运行run_fastlmm.sh开始八分类的gwas分析。
