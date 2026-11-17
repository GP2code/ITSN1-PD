#!/usr/bin/env Rscript
# OG Code by Mary Makarious, adapted by Sheila Yeboah to run parallel


# Load parallelization packages
library(doParallel)
library(foreach)

# Load RNG for reproducibility
library(doRNG)

# Load SKAT package
library(SKAT)

#######################################
# dataset:  which dataset the values are coming from
# ancestry: genetic ancestry cohort
# n_cases: number of cases in group
# n_controls: number of controls in group
# n_variants: output table
# bonf:    the seed for set.seed
#######################################
# create swarm file
# awk -F, 'NR>1 {print "Rscript run_power_calc_swarm_parallel.R", $1, $2, $3, $4, $6, $7}' params.csv > power_calc.swarm

# swarmfile runline
# swarm -f power_calc.swarm --time=5:00:00 --gres=lscratch:5 --merge-output -t 6 -g 15 --module R/4.4 --logdir swarm_log/ --sbatch "--mail-type=FAIL"

# capture command line arguments
args <- commandArgs(trailingOnly = TRUE)
dataset <- args[1]
ancestry <-args[2]
n_cases <- as.numeric(args[3])
n_controls <- as.numeric(args[4])
n_variants <- as.numeric(args[5])
bonf <- as.numeric(args[6])

# Define key sample size components
total_n <- n_cases + n_controls
case_n <- n_cases # Weighted proxy cases
control_n <- n_controls
case_prop <- case_n / total_n
alpha <- bonf  # Bonferroni + dual test correction
prevalence <- 0.01  # PD prevalence

# define vectors for Minor Allele Frequency (MAF) and causal percentage
maf_vec <- c(0.0002, 0.0005, 0.001, 0.005, 0.01, 0.03, 0.05)
causal_percent_vec <- c(0.1, 0.05, 0.03, 0.01, 0.005)

# choose cores and start cluster
ncores <- 5
cl <- makeCluster(ncores)
registerDoParallel(cl)

# set seed for reproducibility
registerDoRNG(12345)

# export necessary variables
.export_vars <- c("prevalence", "alpha", "case_prop", "total_n",
                  "case_n", "control_n")
.pkgs <- c("SKAT")


# Parallel foreach:
# - outer iterator over causal_percent_vec produces one ROW per causal percent
# - inner iterator over maf_vec produces one element (column) per MAF
res <- foreach(i = causal_percent_vec, .combine = 'rbind') %dopar% {
  
     # inner loop runs sequentially on the worker
    inner_res <- foreach(j = maf_vec, .combine = 'c', .export = .export_vars, .packages = .pkgs) %do% {
    
    # compute sample size
    N_sample <- floor(500 * (1 + i * 10) * (1 + j * 100))
    
      # run the simulation 
      result <- Power_Logistic(
        Haplotypes = NULL,
        SNP.Location = NULL,
        SubRegion.Length = -1,
        Prevalence = prevalence,
        Case.Prop = case_prop,
        Causal.Percent = i * 100,
        Causal.MAF.Cutoff = j,
        alpha = alpha,
        N.Sample.ALL = N_sample,
        Weight.Param = c(1, 25),
        N.Sim = 100,
        OR.Type = "Log",
        MaxOR = 3,
        Negative.Percent = 0)
        # return scalar
        result$Power
        
    }
    inner_res
  }
# stop cluster
stopCluster(cl)
registerDoSEQ()

# format matrix 
power_matrix <- round(res * 100, 3) 
rownames(power_matrix) <- paste0(causal_percent_vec * 100, "%")
colnames(power_matrix) <- paste0(maf_vec * 100, "%")


# save final power matrix to a CSV file
write.csv(power_matrix, paste0("power_matrix_",ancestry,"_", dataset,".csv"))


