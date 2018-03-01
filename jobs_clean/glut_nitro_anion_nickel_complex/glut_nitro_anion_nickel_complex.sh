#!/bin/bash 

#SBATCH -N 1        # number of nodes

#SBATCH -n 5   # number of cores 

#SBATCH -p shared   # partition to submit to 

#SBATCH --mem=5120  # memory per node in MB (see also --mem-per-cpu)

#SBATCH -t 420 # expected runtime in minutes

#SBATCH -J g09_glut_nitro_anion_nickel_complex # name of this job

# This is a template script for submitting Gaussian jobs
# to SLURM.  Tags starting with @ will be replaced with
# a script.  Eugene Kwan, May 2014

# swap to local node
mkdir /scratch/dhuang9_glut_nitro_anion_nickel_complex/
export GAUSS_SCRDIR=/scratch/dhuang9_glut_nitro_anion_nickel_complex

# prevent core dumps on job failure
ulimit -c 0

# write out when and where the job started

echo "*************************************" > log.txt
echo "Running on host:"
hostname >> log.txt
echo "Job glut_nitro_anion_nickel_complex started at..." >> log.txt
date >> log.txt

# run job
g16 glut_nitro_anion_nickel_complex.gjf glut_nitro_anion_nickel_complex.out

# remove temporary directory
rm -rf /scratch/dhuang9_glut_nitro_anion_nickel_complex

# analyze the result
./analyze.sh glut_nitro_anion_nickel_complex.out >> log.txt

# add it to the master log
cat log.txt >> ../output/output.txt

# move completed job to output directory
mv glut_nitro_anion_nickel_complex.out "../output/"


