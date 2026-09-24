# Data Science Portfolio

Six end-to-end analyses in Python — classification on imbalanced data, a full scikit-learn pipeline, a neural
network, clustering, time-series forecasting and a price-prediction project — plus SQL queries. Each notebook states
the question, works through the data and ends with conclusions and their limitations.

**Context.** This is coursework from my self-study of the *AI Architect* curriculum (data analysis, statistics,
machine learning, neural networks, SQL), completed in 2025–2026; notebook 06 is its final project. The original
notebooks were written in Russian; for publication they were translated into English, cleaned up and re-executed from
top to bottom, so every number and chart below comes from the saved outputs.

## Projects

| # | Notebook | Question | Methods | Result |
|---|---|---|---|---|
| 01 | [Grant approval](notebooks/01_grant_approval_classification.ipynb) | Which research grant applications get approved? 4,113 applications, only 21% approved | Identifiers and codes treated as labels, split before preprocessing, train-only imputation, one-hot encoding, logistic regression vs. random forest, `GridSearchCV`, ROC-AUC, feature importance | ROC-AUC **0.910** on hold-out test (logistic regression: 0.866) |
| 02 | [Software defects](notebooks/02_software_defects_neural_network.ipynb) | Can code metrics predict defects? 101,763 modules | EDA, skewness and log transform, formula checks, missing-value flag, Keras MLP, BatchNorm, Dropout, early stopping, checkpointing | Found that 7.6% of rows hide missing values as zeros, with a **47.8% vs. 20.6%** defect rate; ROC-AUC 0.7908 → **0.7934**, with an honest discussion of why the ceiling is low |
| 03 | [Heart disease pipeline](notebooks/03_heart_disease_ml_pipeline.ipynb) | Predict heart disease with leakage-free preprocessing | `Pipeline` + `ColumnTransformer` (imputation, scaling, encoding), grid search over **80 combinations** of 3 model families and imputation strategy | ROC-AUC **0.936** in CV, **0.917** on a separate test set |
| 04 | [Activity clustering](notebooks/04_activity_clustering_pca.ipynb) | Can activities be separated from sensor data without labels? 7,352 × 561 | Variance threshold, standardisation, PCA, elbow method, silhouette, K-means, ARI/NMI, contingency tables | 504 features → **56 components** (90% variance); moving vs. static split with **17 errors in 7,352** |
| 05 | [Air passengers forecast](notebooks/05_air_passengers_forecasting.ipynb) | Describe and forecast a seasonal series | Decomposition, ADF test, ACF, lag and rolling features, time-ordered split, error analysis | MAE **12.0** on a three-year hold-out; traced the largest misses to a change in the seasonal pattern |
| 06 | [NYC taxi fares](notebooks/06_nyc_taxi_fare_regression.ipynb) | What will a taxi trip cost, before it starts? 50,000 New York trips | Cleaning dirty coordinates, feature engineering (haversine distance, airport flag, tariff change), time-based split, Mann–Whitney and Kruskal–Wallis tests, dummy baselines, Ridge / Random Forest / HistGradientBoosting / XGBoost, permutation importance, error analysis | XGBoost: RMSE **$3.84**, MAE $1.90, R² 0.873 on an unseen 2015 hold-out — **65% better** than the mean baseline; 1.2% of trips cause 42% of the squared error |

**SQL** — [`sql/`](sql): PostgreSQL filtering with `WHERE`, `LIKE` and combined `AND`/`OR` conditions, multi-key
`ORDER BY`, `GROUP BY` aggregation and a window function (`SUM(COUNT(*)) OVER ()`) for group shares.

## Skills demonstrated

* **Data preparation:** missing values (including disguised ones), type fixes, encoding, scaling, skewed features
* **Modelling:** logistic regression, random forest, gradient boosting (HistGradientBoosting, XGBoost), neural
  networks (Keras), K-means, regression for prices and time series
* **Evaluation:** ROC-AUC, RMSE/MAE/R², ARI/NMI, cross-validation, stratified and time-ordered splits, hold-out
  testing, dummy baselines, permutation importance, error analysis, data-leakage awareness
* **Statistics and EDA:** distributions, correlation, non-parametric hypothesis tests (Mann–Whitney,
  Kruskal–Wallis) with effect sizes, stationarity (ADF), autocorrelation, PCA
* **Tools:** Python, pandas, NumPy, scikit-learn, TensorFlow/Keras, statsmodels, matplotlib, SQL (PostgreSQL)

## Running the notebooks

```bash
pip install -r requirements.txt
```

Download the datasets listed in [`data/README.md`](data/README.md) into the `data/` folder, then run any notebook from
the `notebooks/` folder. The notebooks were executed with Python 3.12.
