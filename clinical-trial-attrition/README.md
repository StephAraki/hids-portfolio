# Prediction of Clinical Trial Attrition

**HIDS-6001, Massive Health Data Fundamentals — Fall 2024**
Team 3a: Stephanie Araki, Pari Shah, Samantha Zocher

Classification model predicting high vs. low patient attrition in clinical trials, built
on data pulled directly from the ClinicalTrials.gov API, with a geospatial view of where
attrition risk concentrates.

## Key result

Random Forest was the best-performing model: **69.4% accuracy, AUC-ROC 0.768** (vs. 0.691
for Logistic Regression and 0.634 for SVM). XGBoost feature importance identified actual
enrollment, trial duration, number of locations, and adverse event count as the strongest
attrition drivers.

## Pipeline

1. **`notebooks/01_build_ct_dataset.ipynb`** — Pulls trial-level fields (status, phase, purpose,
   enrollment, eligibility, locations, adverse events) from the ClinicalTrials.gov v2 API
   for 1,325 trials with known attrition rates, and merges in RUCA rural/urban geographic
   classification by facility location.
2. **`notebooks/02_train_attrition_model.ipynb`** — Encodes attrition rate as a binary label
   (split at the sample median), one-hot encodes categorical features, trains and compares
   Logistic Regression / Random Forest / SVM, extracts XGBoost feature importance, and
   builds a Folium map of trial facilities color-coded by attrition rate.
3. **`presentation/`** — Final presentation slides and written report submitted for the course.

## Data

Built from the public [ClinicalTrials.gov API](https://clinicaltrials.gov/data-api/api)
and a Rural-Urban Commuting Area (RUCA) zip-code classification table. No proprietary or
restricted data is used — the dataset can be fully rebuilt from `01_build_ct_dataset.py`
given a starting list of NCT IDs and attrition percentages.

## Environment

```
pip install requests pandas scikit-learn xgboost folium
```
