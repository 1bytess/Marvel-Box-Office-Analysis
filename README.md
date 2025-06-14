# Marvel Studios Movie Analysis
This project performs an in-depth analysis of Marvel Studios movies, focusing on financial performance. By examining data on budget, domestic, and international revenue, the analysis aims to answer common questions about the franchise's profitability, the relationship between production cost and profit, and key market performance.

### 📋 Table of Contents
- [Introduction](#-introduction)
- [File Structure](#-file-structure)
- [Methodology](#️-methodology)
- [Key Findings](#-key-findings)
- [How to Run](#-how-to-run)
- [Conclusion](#-conclusion)

### 📖 Introduction
Superhero movies, particularly those from Marvel Studios, have become a dominant force in the global box office. This study analyzes a dataset of Marvel movies to uncover insights into their financial success. We explore which films generated the most and least profit, track financial performance over the years, and build a regression model to predict a movie's profit based on its budget.

### 📁 File Structure
The project repository is organized as follows:
```
.
├── README.md
├── Data
│   └── marvel.xlsx
├── Plot
├── report
│   └── 2021012800_베네딕터스 에스라 헤르노오.pdf
├── 통계소프트웨어1.Rproj
└── 통계소프트웨어 기말고사.R
```

### 🛠️ Methodology
The analysis was performed in R, leveraging several data science packages.

1. **Data Collection**: The data was sourced from the "Marvel Movie Dataset" on Kaggle. It contains information on 64 movies, including release dates, budget, and revenue.

2. **Data Preprocessing**:
    - Loaded the dataset and necessary libraries (`tidyverse`, `dplyr`, `lubridate`).
    - Cleaned the data by converting date columns to Date objects and numeric columns (like `Budget` and `NorthAmerica` revenue) to numeric types, removing commas.
    - Engineered new features, `total_revenue` and `profits`, to facilitate analysis.

3. **Exploratory Data Analysis (EDA)**:
    - Identified the top 5 most and least profitable movies.
    - Aggregated and plotted total budget and profit on a yearly basis to observe trends over time.
    - Compared total domestic (North America) revenue against worldwide revenue using a pie chart.

4. **Modeling**:
    - Calculated the Pearson correlation coefficient between Budget and profits.
    - Developed a simple linear regression model using the lm() function to predict profits based on Budget.

### 📈 Key Findings
The analysis yielded several key insights into Marvel's financial performance.

- **Top & Bottom Performers**:
    - The most profitable movie was **Avengers: Endgame**, earning a staggering profit of over $5.2 billion.

    - The least profitable movie in the dataset was **The New Mutants**.

- **Budget vs. Profit Correlation**:
    - A strong positive correlation (**r = 0.74**) exists between a movie's budget and its profits. This suggests that higher investment in production is generally associated with higher returns.

- **Predictive Model**:
    - The linear regression model to predict profit from budget is: `Profits = -402,331,187.66 + 10.21 * Budget`

    - This indicates that for every dollar increase in budget, the profit is expected to increase by approximately **$10.21**.

- **Market Importance**:

    - The revenue from North America is nearly equal to the revenue from all other territories combined, highlighting the US as the single largest and most critical market for Marvel Studios.

### 🚀 How to Run
To replicate this analysis, please follow these steps:
1. **Clone the repository**:

    ```
    git clone https://github.com/1bytess/Marvel-Box-Office-Analysis.git
    ```
2. **Install necessary packages in R**:
    ```
    install.packages(c("tidyverse", "dplyr", "lubridate", "cluster"))
    ```
3. **Run the script**:
    - Open the `통계소프트웨어 기말고사.R` file in RStudio.
    - Ensure the `marvel.csv` file is located in the `data` subfolder as specified in the script.
    - Execute the script to perform the analysis and generate plots.

### ✨ Conclusion
This project confirms the immense financial success of the Marvel Studios franchise. The findings show a clear, positive relationship between production budget and profit, with blockbuster films like *Avengers: Endgame* delivering massive returns. The analysis also underscores the strategic importance of the North American market. The developed regression model provides a quantitative tool for estimating potential profits based on production investment.