# Load required packages
if (!requireNamespace("Hmisc", quietly = TRUE)) install.packages("Hmisc")
adnimerge_path <- "./data/ADNIMERGE_0.0.1.tar.gz"
if (!requireNamespace("ADNIMERGE", quietly = TRUE)) install.packages(ADNIMERGE_PATH, repos = NULL, type = "source")

library(Hmisc)
library(ADNIMERGE)
library(readr)
library(dplyr)

# Load datasets
adni <- ADNIMERGE::adnimerge # core demographic and clinical info
asl <- ADNIMERGE::ucsfaslfs # UCSF ASL Perfusion CBF by FreeSurfer ROI 
roster <- ADNIMERGE::inventory # inventory of all ADNI assessments and samples

# Pull baseline data
adni_baseline <- adni %>%
  filter(VISCODE == "bl") %>%
  select(
    RID,              # participant roster ID
    PTID,             # participant subject ID (last 4 digits are roster ID)
    SITE,             # site
    COLPROT,          # collection protocol
    EXAMDATE,         # exam date
    AGE,              # age at baseline
    PTGENDER,         # gender
    PTEDUCAT,         # years of education
    PTETHCAT,         # ethnicity
    PTRACCAT,         # race
    DX.bl,            # baseline diagnosis (CN, MCI, AD)
    APOE4,            # APOE-e4 allele count (0/1/2)
    ABETA,            # CSF AB42
    PTAU,             # PTAU
    PTAU.bl,          # PTAU baseline
    FDG,              # FDG (Hypometabolism indicator)
    AV45,             # AV45 (Amyloid PET SUVR)
    MMSE,             # mini mental state exam
    CDRSB,            # Clinical Dementia Rating Sum of Boxes
    MOCA,             # Montreal Cognitive Assessment
    ADAS11, ADAS13,   # Alzheimer's Disease Assessment Scale
    FAQ,              # Functional Activities Questionnaire
    LDELTOTAL,        # Logical Memory Delayed Recall
    EcogPtTotal,      # Everyday Cognition -  Patient total
    EcogSPTotal       # Everyday Cognition -  Study Partner total
  )

# Preview the baseline data
glimpse(adni_baseline)
summary(adni_baseline)

# Pull longitudinal diagnosis information
# Use `DX`, `DXCHANGE`, `RID`, `VISCODE`, and `EXAMDATE`
adni_longitudinal_dx <- adni %>%
  select(
    RID,
    VISCODE,        # visit code (e.g., "bl", "m12", "m24", etc.)
    DX,             # legacy diagnostic code
    EXAMDATE        # useful for tracking when changes occur
  )


# Save datasets for downstream Python processing
saveto_path <- "./data"
tryCatch({
  write_csv(adni_baseline, file.path(saveto_path, "adni_baseline.csv"))
  write_csv(adni_longitudinal_dx, file.path(saveto_path, "adni_longitudinal_dx.csv"))
  write_csv(asl, file.path(saveto_path, "adni_asl.csv"))
  write_csv(roster, file.path(saveto_path, "adni_inventory.csv"))
}, error = function(e) {
  message("Error: ", e$message)
})

