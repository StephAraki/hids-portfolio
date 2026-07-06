# Alzheimer's Diagnosis from Perfusion MRI

**HIDS-7006, AI for Health Applications — Spring 2025**
Stephanie Araki (solo project)

Machine learning models classifying cognitively normal (CN), mild cognitive impairment
(MCI), and Alzheimer's disease (AD) using cerebral blood flow (CBF) features from
Arterial Spin Labeling (ASL) MRI, combined with demographic, genetic, and cognitive
assessment data from the Alzheimer's Disease Neuroimaging Initiative (ADNI).

## Key result

Random Forest, after SMOTE oversampling and hyperparameter tuning, achieved **86% test
accuracy** across the three diagnostic classes. SHAP analysis showed both cognitive test
scores (MMSE, CDR-SB, ADAS) and CBF patterns in memory/temporal-processing brain regions
carried predictive value.

## Pipeline

1. **`scripts/01_build_adni_dataset.R`** — Pulls baseline demographic, clinical, and ASL
   perfusion (CBF) data from the ADNIMERGE R package and exports clean CSVs for downstream
   Python processing.
2. **`notebooks/02_train_classify_alzheimers.ipynb`** — Merges ASL features (130 FreeSurfer ROIs)
   with clinical data, builds a group-aware train/test split (to prevent the same patient's
   repeat visits from leaking across folds), compares six classifiers via 5-fold CV, and
   trains a tuned, SMOTE-balanced Random Forest with SHAP interpretability.
3. **`presentation/`** — Final presentation slides and written report submitted for the course.

## Data

This project used the ADNIGO/ADNI2 cohorts (666 subjects) from the
[Alzheimer's Disease Neuroimaging Initiative](https://adni.loni.usc.edu/). ADNI data
requires an approved data use agreement and is not redistributed in this repo — place
your own exports under `data/` (see script docstrings for expected filenames) to reproduce.

## Environment

```
R: Hmisc, ADNIMERGE, readr, dplyr
Python 3.9+: pandas, scikit-learn, imbalanced-learn, xgboost, shap
```
