#!/bin/bash 

#SBATCH -N 1        # number of nodes

#SBATCH -n 4   # number of cores 

#SBATCH -p shared   # partition to submit to 

#SBATCH --mem=4096  # memory per node in MB (see also --mem-per-cpu)

#SBATCH -t 300 # expected runtime in minutes

#SBATCH -J g09_nickel_phenanthroline_freeze # name of this job

# This is a template script for submitting Gaussian jobs
# to SLURM.  Tags starting with @ will be replaced with
# a script.  Eugene Kwan, May 2014

# swap to local node
mkdir /scratch/dhuang9_nickel_phenanthroline_freeze/
export GAUSS_SCRDIR=/scratch/dhuang9_nickel_phenanthroline_freeze

# prevent core dumps on job failure
ulimit -c 0

# write out when and where the job started

echo "*************************************" > log.txt
echo "Running on host:"
hostname >> log.txt
echo "Job nickel_phenanthroline_freeze started at..." >> log.txt
date >> log.txt

# run job
g16 nickel_phenanthroline_freeze.gjf nickel_phenanthroline_freeze.out

# remove temporary directory
rm -rf /scratch/dhuang9_nickel_phenanthroline_freeze

# analyze the result
./analyze.sh nickel_phenanthroline_freeze.out >> log.txt

# add it to the master log
cat log.txt >> ../output/output.txt

# move completed job to output directory
mv nickel_phenanthroline_freeze.out "../output/"


