# KASE Stock Price Movement Classification — 5 Trading Days Horizon

**Project Type:** Applied Financial Analytics  
**Market:** Kazakhstan Stock Exchange (KASE)  
**Task:** Binary classification of stock price direction (Up / Not Up) over the next 5 trading days  
**My Role:** Data Collection, Data Cleaning, Feature Engineering, Exploratory Data Analysis and Visualization

---

## Project Overview

The goal of this project was to predict whether a liquid stock on the **Kazakhstan Stock Exchange (KASE)** will rise or not within the next **5 trading days**, using only historical OHLCV data.

I was responsible for the full **data pipeline** from raw market data to model-ready features, including:
- Programmatic data collection from KASE
- Data cleaning and validation
- Feature engineering focused on price dynamics
- Comprehensive Exploratory Data Analysis and visualizations

Two other team members focused on machine learning model development and evaluation.

---

## My Responsibilities as Data Analyst

### 1. Data Collection (Web Scraping)
- Developed a robust scraper using the KASE TV-charts API endpoint
- Collected approximately **1 year of daily OHLCV data** for 10 most liquid KASE stocks
- Implemented error handling, rate limiting, and data integrity checks
- Saved raw and processed data in structured CSV format for reproducibility

### 2. Data Cleaning & Validation
- Handled missing values and inconsistent formats
- Validated trading days and volume data
- Removed incomplete candles and ensured chronological order
- Created a unified dataset combining all tickers with proper metadata

### 3. Feature Engineering
- Created a **sliding window** dataset (30 candles ≈ 6 months history per sample)
- Engineered relative and dynamic features to remove price level bias:
  - Log-returns (close and open)
  - Candle body ratio
  - High–low range normalized by close
  - Log-change in trading volume
- Generated the target variable: binary direction of price movement over the next 5 trading days

### 4. Exploratory Data Analysis & Visualization
- Analyzed price trends, volatility, and volume dynamics for each ticker
- Investigated class distribution and temporal patterns
- Created informative visualizations to understand market behavior and feature importance
- Performed liquidity ranking and identified the most suitable stocks for modeling

---

## Technologies Used (Data Part)

- **Python**: pandas, numpy, requests, pathlib
- **Data Collection**: REST API scraping with proper headers and error handling
- **Visualization**: matplotlib, seaborn
- **Development Environment**: Jupyter Notebook

---
## Key Results of Data Work

- Successfully collected and cleaned **~2,420 samples** across 10 liquid stocks
- Created a high-quality feature set based on **relative price dynamics** (log-returns)
- Prepared a **time-based split** dataset to prevent leakage
- Provided clear visualizations and insights into market behavior on KASE

The prepared dataset was later used by team members for training machine learning and deep learning models (Logistic Regression, Random Forest, GRU, CNN+GRU, etc.).

---
