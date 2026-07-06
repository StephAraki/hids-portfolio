# Stephanie Araki — Health Informatics & Data Science Portfolio
 
Graduate coursework projects from Georgetown's MS in Health Informatics & Data Science (2024–2026), spanning machine learning, imaging informatics, biostatistics, digital health design, and clinical data standards.
 
**Contact:** araki.stephaniep@gmail.com · [linkedin.com/in/stephanie-araki](https://linkedin.com/in/stephanie-araki)
 
---
 
## Contents
 
1. [Brain Cancer Radiomics Analysis](#1-brain-cancer-radiomics-analysis) -- code available
2. [Memory Circle: Memory Care Management App](#2-memory-circle-memory-care-management-app)
3. [Liver Cancer Gene Expression & Immune Profiling](#3-liver-cancer-gene-expression--immune-profiling)
4. [Critical Appraisal & Replication: Cleveland Heart Disease Dataset](#4-critical-appraisal--replication-cleveland-heart-disease-dataset)
5. [Alzheimer's Diagnosis from Perfusion MRI](#5-alzheimers-diagnosis-from-perfusion-mri) -- code available
6. [Pediatric Health Data Commons](#6-pediatric-health-data-commons)
7. [Streamlining STEMI Care with EMR Integration](#7-streamlining-stemi-care-with-emr-integration)
8. [Prediction of Clinical Trial Attrition](#8-prediction-of-clinical-trial-attrition) -- code available
---
 
## 1. Brain Cancer Radiomics Analysis
**HIDS-7009, Imaging Informatics — Spring 2026**
Team: Stephanie Araki, Atluri, Peot, Shorish
**Code:** [github.com/StephAraki/brain-cancer-radiomics](https://github.com/StephAraki/hids-portfolio/brain-cancer-radiomics)
 
Built and externally validated a machine learning pipeline to classify brain tumor subtype (glioblastoma, oligodendroglioma, astrocytoma) from T1-weighted MRI radiomic features.
 
- Trained on TCGA (149 patients), externally validated on the independent REMBRANDT cohort (58 patients) to test true generalizability
- Extracted 112 radiomic features (first-order, shape, GLCM, GLRLM) with PyRadiomics on GlisterBoost tumor segmentations
- Diagnosed a severe dataset-shift problem: an SVM baseline dropped from 89.7% internal CV accuracy to 38% external accuracy, driven by class imbalance and cross-cohort imaging protocol differences
- Improved external accuracy to 57% using SMOTE class balancing, GridSearchCV tuning, a VotingClassifier ensemble (RF + GBC + SVM + LR), and Bayesian-optimized voting weights
- Linked top predictive features (sphericity, skewness, texture entropy) to known tumor biology (infiltrative growth, necrotic cores)
**Tech:** Python, scikit-learn, PyRadiomics, imbalanced-learn (SMOTE), scikit-optimize (Bayesian optimization)
 
---
 
## 2. Memory Circle: Memory Care Management App
**HIDS-7007, Digital Health Applications — Spring 2026**
Team: Stephanie Araki, Nathan Peot, Amina Shorish, Ronak Singh
 
A human-centered design project: conceived and prototyped a multi-stakeholder digital health platform connecting patients, caregivers, and providers to close the gap between clinical visits for memory care patients. The app itself was not built; the deliverable was the design and validation process.
 
- Conducted stakeholder interviews and built patient, caregiver, and provider personas to ground the design in real user needs
- Designed patient-facing cognitive assessments (daily Mini-Cog-style games) and low-burden mood check-ins
- Designed caregiver tools for orientation benchmarking and one-tap safety reporting
- Designed a SMART on FHIR-integrated provider dashboard concept for longitudinal decline tracking and automated alerts
- Built an interactive prototype in Figma and ran usability testing to refine the flows across all three user types
- Proposed an AI pipeline concept for mapping unstructured caregiver notes to structured clinical vocabularies (SNOMED-CT, LOINC)
**Design & research tools:** Figma, stakeholder interviews, usability testing, persona development

 
---
 
## 3. Liver Cancer Gene Expression & Immune Profiling
**HIDS-7003, Precision Health Informatics — Fall 2025**
Team: Stephanie Araki, Sonia Shah, Nathan Peot
 
Analyzed TCGA liver hepatocellular carcinoma (LIHC) RNA-seq data across four clinical cancer stages to identify stage-specific biomarkers and immune remodeling patterns.
 
- Ran differential gene expression analysis in iDEP (DESeq2) on 156 tumor samples, filtering ~60,600 genes down to ~28,000 after preprocessing
- Performed pathway enrichment analysis (enrichR) against Gene Ontology and Reactome databases
- Ran immune deconvolution with CIBERSORT (LM22 signature) to estimate proportions of 22 immune cell types per stage
- Found the largest transcriptional shift between Stage I and Stage II, with progressively smaller changes in later-stage transitions — suggesting most reprogramming happens early in progression
**Tech:** R, iDEP, DESeq2, enrichR, CIBERSORT
 
---
 
## 4. Critical Appraisal & Replication: Cleveland Heart Disease Dataset
**HIDS-6004, Evidence-Based Data Analysis in Population Health — Fall 2025**
Team: Stephanie Araki, Amina Eman Shorish
 
Critically appraised and replicated another team's statistical analysis of the Cleveland Heart Disease dataset (303 patients) to test methodological soundness and reproducibility.
 
- Applied the JBI Critical Appraisal Tool for cross-sectional studies to evaluate bias, confounding, and measurement validity
- Replicated three hypothesis tests (two-sample t-test, chi-square, one-way ANOVA) examining cholesterol, exercise-induced angina, and blood pressure by heart disease status and chest pain type
- Stress-tested robustness via outlier removal, non-parametric alternatives (Wilcoxon, Kruskal-Wallis), and adjustment for confounders (age, sex)
**Tech:** R, R Markdown, statistical hypothesis testing
 
---
 
## 5. Alzheimer's Diagnosis from Perfusion MRI
**HIDS-7006, AI for Health Applications — Spring 2025**
Solo project
**Code:** [github.com/StephAraki/alzheimers-perfusion-mri](https://github.com/StephAraki/hids-portfolio/alzheimers-perfusion-mri)
 
Built machine learning models to classify cognitively normal, mild cognitive impairment (MCI), and Alzheimer's patients using cerebral blood flow (CBF) features from Arterial Spin Labeling (ASL) MRI, combined with demographic, genetic, and cognitive data.
 
- Used ADNI data (666 subjects), merging ASL perfusion features across 130 brain regions with clinical and demographic variables
- Compared six classifiers (Logistic Regression, SVM, KNN, Random Forest, Gradient Boosting, XGBoost) via 5-fold group-aware cross-validation to prevent subject leakage across visits
- Achieved 86% test accuracy with Random Forest after SMOTE oversampling and hyperparameter tuning
- Applied SHAP analysis to interpret feature importance — both cognitive test scores and CBF patterns in memory/temporal-processing regions carried predictive value
**Tech:** Python, scikit-learn, XGBoost, SHAP, imbalanced-learn
 
---
 
## 6. Pediatric Health Data Commons
**HIDS-7005, Advanced Health Informatics — Spring 2025**
Team: Stephanie Araki, Hanane Bousfoul, Jay Nagabhairu, Sam Zocher
 
Proposed a cloud-based, open-access data platform to help under-resourced nonprofit organizations conduct evidence-based pediatric health research.
 
- Designed data standardization around the OMOP Common Data Model and HL7 FHIR, with automated ETL pipelines mapping to SNOMED, LOINC, and RxNorm
- Specified researcher access via a Python SDK, RESTful and FHIR APIs, and containerized cloud research workspaces (GCP/AWS)
- Addressed governance and compliance: HIPAA-eligible hosting, fine-grained IAM access controls, and a community-governed oversight model
**Tech:** OMOP CDM, HL7 FHIR, cloud architecture (GCP/AWS), Python SDK design
 
---
 
## 7. Streamlining STEMI Care with EMR Integration
**HIDS-6002, Utilizing Data in Electronic Medical Records — Fall 2024**
Team: Stephanie Araki, Maxwell Lewis, Jay Nagabhairu, Pari Shah
 
Designed a clinical workflow intervention to reduce door-to-balloon (DTB) time for STEMI patients toward the 90-minute clinical guideline.
 
- Built automated OpenEMR alerts notifying cardiology, the cath lab, and pharmacy at each stage of the STEMI workflow
- Designed compliance-tracking timestamps with escalating alerts (passive to modal) for cases at risk of missing the 90-minute benchmark
- Built a Tableau dashboard visualizing simulated pre/post-intervention DTB times and 3-month mortality outcomes
**Tech:** OpenEMR, SQL, Tableau
 
---
 
## 8. Prediction of Clinical Trial Attrition
**HIDS-6001, Massive Health Data Fundamentals — Fall 2024**
Team: Stephanie Araki, Pari Shah, Samantha Zocher
**Code:** [github.com/StephAraki/clinical-trial-attrition](https://github.com/StephAraki/hids-portfolio/clinical-trial-attrition)
 
Built a classification model predicting high vs. low patient attrition in clinical trials using data pulled live from the ClinicalTrials.gov API (1,325 trials).
 
- Compared Logistic Regression, Random Forest, and SVM classifiers; Random Forest performed best (69.4% accuracy, AUC-ROC 0.768)
- Used XGBoost feature importance to identify top attrition drivers: actual enrollment, trial duration, number of locations, and adverse event count
- Mapped clinical trial facility locations geographically with Folium, color-coded by attrition rate, to identify geographic attrition hotspots
**Tech:** Python, scikit-learn, XGBoost, Folium, ClinicalTrials.gov API
 
