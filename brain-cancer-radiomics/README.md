# Brain Cancer Radiomics Analysis

**HIDS-7009, Imaging Informatics — Spring 2026**
Team: Stephanie Araki, Atluri, Peot, Shorish

Machine learning pipeline classifying brain tumor subtype (glioblastoma, oligodendroglioma,
astrocytoma) from radiomic features extracted from T1-weighted MRI, trained on TCGA and
externally validated on the independent REMBRANDT cohort.

## Key result

An SVM baseline achieved 89.7% internal cross-validation accuracy on TCGA but dropped to
38% on the external REMBRANDT set — a textbook dataset-shift problem. SMOTE class balancing,
GridSearchCV hyperparameter tuning, a 4-model voting ensemble, and Bayesian-optimized voting
weights brought external accuracy up to 57%.

## Pipeline

1. **`notebooks/01_radiomics_feature_extraction.ipynb`** — Extracts 112 radiomic features
   (first-order, shape, GLCM, GLRLM) from REMBRANDT T1-weighted MRI + segmentation masks
   using PyRadiomics. TCGA features were provided precomputed in the same format.
2. **`notebooks/02_model_training_and_external_validation.ipynb`** — Aligns TCGA/REMBRANDT
   feature spaces, selects the top 14 features via mutual information, benchmarks five
   baseline classifiers, then builds the tuned SMOTE + ensemble + Bayesian-optimization
   pipeline described above.
3. **`presentation/`** — Final presentation slides and written report submitted for the course.

## Data

This project used:
- **TCGA** glioma radiomics features (149 patients) — [The Cancer Genome Atlas](https://www.cancer.gov/ccg/research/genome-sequencing/tcga)
- **REMBRANDT** MRI cohort (64 patients, 58 after preprocessing) — [NCI Cancer Imaging Archive](https://www.cancerimagingarchive.net/collection/rembrandt/)

Both datasets require registration/data use agreements through their respective repositories
and are not redistributed in this repo. Place downloaded feature matrices under `data/`
(see script docstrings for expected filenames) to reproduce.

## Environment

```
python 3.9  # PyRadiomics is most stable on 3.7–3.10
pip install pyradiomics pandas numpy scikit-learn imbalanced-learn scikit-optimize
```

## Team contribution note

This was a 4-person team project. The notebook in this repo reflects my individual
contribution (Step 1: REMBRANDT feature extraction); the modeling script is a cleaned-up
reflection of our team's Step 3–4 methodology as documented in our shared final report.
