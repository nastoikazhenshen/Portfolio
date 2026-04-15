
# House Prices — Advanced Regression Techniques
**Author:** Daria Ivaykina 
**Date:** 2025

![Python](https://img.shields.io/badge/Language-Python-3776AB?style=flat-square&logo=python&logoColor=white)
![Scikit-learn](https://img.shields.io/badge/Library-scikit--learn-F7931E?style=flat-square&logo=scikit-learn&logoColor=white)
![Kaggle](https://img.shields.io/badge/Platform-Kaggle-20BEFF?style=flat-square&logo=kaggle&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=flat-square)

A machine learning project based on the Kaggle competition "House Prices: Advanced Regression Techniques". The objective is to predict residential property sale prices in Ames, Iowa using regression modeling.

---

## Dataset

- **Source:** Kaggle — House Prices: Advanced Regression Techniques
- **Training set:** 1,460 observations, 81 features
- **Test set:** 1,459 observations, 80 features
- **Target variable:** SalePrice

---

## Project Structure

```
house-prices-regression/
    house_prices_assignment_di.ipynb   — Main notebook
    train.csv                          — Training data
    test.csv                           — Test data
    submission.csv                     — Kaggle submission file
```

---

## Methodology

**Part 1 — Data Loading and Preprocessing**
- Loaded train and test datasets using pandas
- Identified 81 features including numeric and categorical types
- Analyzed missing values across all columns; features such as PoolQC, MiscFeature, and Alley had over 90% missing data
- Defined imputation strategy: median for numeric features, most frequent value for categorical features

**Part 2 — Exploratory Data Analysis**
- Visualized the distribution of SalePrice, which showed right skew — addressed later with log transformation
- Built a correlation heatmap to identify the strongest numeric predictors
- Top correlated features with SalePrice: OverallQual, GrLivArea, GarageCars, GarageArea, TotalBsmtSF, 1stFlrSF, FullBath, TotRmsAbvGrd, YearBuilt, YearRemodAdd

**Part 3 — Feature Engineering**
- Selected top 10 numeric features by correlation for the baseline model
- Applied OneHotEncoding to categorical features for the full model
- Applied log1p transformation to the target variable to normalize its distribution

**Part 4 — Baseline Model**
- Trained a Linear Regression model on the top 10 numeric features
- Evaluated using RMSE and R²

**Part 5 — Full Pipeline Model**
- Built a scikit-learn Pipeline with ColumnTransformer for separate numeric and categorical preprocessing
- Applied SimpleImputer and StandardScaler to numeric features
- Applied SimpleImputer and OneHotEncoder to categorical features
- Trained RidgeCV with cross-validated alpha selection (log-scale grid, 5-fold CV)
- Predicted on log-transformed target and inverted with expm1 for final evaluation

**Part 6 — Kaggle Submission**
- Retrained the full pipeline on the entire training set
- Generated predictions for the test set and exported to submission.csv

---

## Results

| Model | RMSE | R² |
|---|---|---|
| Linear Regression (top 10 numeric features) | 39,474 | 0.797 |
| RidgeCV — all features, log1p target | 25,819 | 0.913 |

The RidgeCV pipeline reduced RMSE by approximately 35% and improved R² from 0.797 to 0.913 by incorporating all features, proper imputation, encoding, and target transformation.

---

## Skills Demonstrated

- Exploratory data analysis with matplotlib and seaborn
- Missing value analysis and imputation strategy design
- Feature selection based on correlation analysis
- sklearn Pipeline and ColumnTransformer for reproducible preprocessing
- OneHotEncoding and StandardScaler for mixed-type feature sets
- Regression modeling: Linear Regression and Ridge with cross-validated regularization
- Log transformation of skewed target variables
- Model evaluation using RMSE and R²
- Kaggle competition submission workflow

---

## Tools and Libraries

- Python 3
- pandas, numpy
- matplotlib, seaborn
- scikit-learn (LinearRegression, RidgeCV, Pipeline, ColumnTransformer, SimpleImputer, OneHotEncoder, StandardScaler)
