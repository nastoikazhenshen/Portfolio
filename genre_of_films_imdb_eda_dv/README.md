# IMDb Film Genres Analysis: Why Do Some Genres Consistently Receive the Highest Ratings?

**Author:** Daria Ivaykina  
**Date:** 2025

### Project Overview
This project investigates why certain film genres consistently achieve the highest IMDb ratings. The central research question is:

> What measurable factors (budget, country of production, and director) can help explain the differences in average IMDb ratings across genres?

Through a complete end-to-end analysis — from data collection and cleaning to visualization and interpretation — the study reveals that **narrative depth, emotional impact, and directorial quality** play a much stronger role than large production budgets.

**Key Findings:**
- **Medical Drama** and **Satire** are the highest-rated genres, with average IMDb scores above 8.7.
- High ratings show little to no correlation with big budgets.
- These genres typically focus on psychological conflict, ethical dilemmas, and social commentary, creating stronger audience engagement.
- Talented directors (e.g., Miloš Forman in Medical Drama) significantly contribute to elevated quality.
- Outstanding films with high ratings come from both major Hollywood productions and smaller film industries worldwide.

### What Was Done

1. **Data Acquisition**  
   - Automated download of the Kaggle dataset using `kagglehub`.  
   - Dataset: `imdb_films.csv` (over 400,000 records).

2. **Data Cleaning & Preparation**  
   - Converted `Rating`, `Year`, `Budget`, and `Fees` columns to numeric format.  
   - Extracted the primary genre from the multi-genre `Genres` column.  
   - Handled missing values and data type issues.

3. **Exploratory Data Analysis (EDA)**  
   - Examined the overall distribution of IMDb ratings.  
   - Calculated average ratings by primary genre.  
   - Compared top genres by frequency, budget levels, and country of origin.

4. **Data Visualization**  
   - Histogram showing the distribution of IMDb ratings (`viz1_rating_dist.png`).  
   - Bar chart displaying average rating by genre (`viz2_avg_rating_genre.png`).

5. **Insights & Conclusions**  
   - Formulated clear, actionable insights about what drives high audience and critic appreciation in cinema.

### Technologies & Skills Used

- **Python** – pandas, numpy, matplotlib  
- **Data Wrangling & Cleaning**  
- **Exploratory Data Analysis (EDA)**  
- **Data Visualization** – clear, high-resolution charts  
- **Automated Data Retrieval** – kagglehub / Kaggle API  
- **Jupyter Notebook** – structured and reproducible workflow  
- **Insight Generation** – transforming raw data into meaningful conclusions


### How to Run the Project
1. Clone the repository.
2. Install the required libraries:
   ```bash
   pip install pandas matplotlib numpy kagglehub
