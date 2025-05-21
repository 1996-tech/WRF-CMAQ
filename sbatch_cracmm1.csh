#!/bin/bash
#SBATCH --job-name=CMAQ_run
#SBATCH --nodes=2                # Request 2 nodes
#SBATCH --ntasks-per-node=24     # 24 tasks per node (48 total)
#SBATCH --time=24:00:00          # Request 24 hours of runtime
#SBATCH --partition=kamiak       # Using the kamiak partition
#SBATCH --output=cmaq_%j.out     # Output file name (%j will be replaced by the job ID)
#SBATCH --error=cmaq_%j.err      # Error file name
#SBATCH --mail-type=BEGIN,END,FAIL # Send email when job begins, ends, or fails
#SBATCH --mail-user=a.zarrah@wsu.edu  # Replace with your email

# Load Intel compiler (which includes Intel MPI)
module purge
module load StdEnv intel/25.0 hdf5/1.8.16

# Go to the working directory
cd /data/lab/meng/priom_zarrah/CMAQv5.5/CMAQ_REPO/CCTM/scripts

# Print some information for debugging
echo "Job started at: $(date)"
echo "Running on host: $(hostname)"
echo "Using $(nproc) processors"

# Run the CMAQ script
./run_cctm_12US1_cracmm1.csh

# Print completion message
echo "Job finished at: $(date)"
