# Data-Analytics-with-R
**🏃‍♂️ Runkeeper Data Analysis**
This project involves a comprehensive data analysis of personal fitness activities using data exported from Runkeeper. The scripts demonstrate data cleaning, transformation, statistical summaries, time series analysis, and visualization.

**📁 Dataset**

All scripts use cardioActivities.csv located in the datasets/ folder. The dataset includes various physical activities (Running, Cycling, Walking) with attributes like distance, speed, heart rate, and elevation.

**📜 Scripts Overview**

🔹 Task2.py – Data Cleaning & Summary
Loads and filters the dataset.

Drops irrelevant columns.

Renames activity type Other to Unicycling.

Displays activity counts and missing values.

🔹 Task3.py – Heart Rate Imputation
Calculates and imputes missing heart rate data based on activity type.

Differentiates between Running, Cycling, and Walking.

🔹 Task4.py – Running Trends Visualization
Filters running data between 2013–2018.

Plots trends for speed, distance, heart rate, and pace.

🔹 Task5.py – Summary Statistics
Shows annual and weekly means from 2015–2018.

Calculates average number of weekly workouts.

🔹 Task6.py – Distance vs. Heart Rate
Plots weekly distances and overlays average heart rate.

🔹 Task7.py – Annual Distance
Calculates and plots annual running distance with visual bands for thresholds.

🔹 Task8.py – Time Series Decomposition
Decomposes weekly running distance into trend and seasonal components.

🔹 Task9.py – Heart Rate Distribution
Creates a histogram of heart rate zones and training intensity distribution.

🔹 Task10.py – Activity Summary
Aggregates and summarizes distance, climb, and speed for each activity type.

🔹 Task11.py – Fun Fact Calculation
Fun comparison of shoe usage between the user and Forrest Gump.


**📊 Dependencies**

Make sure to install the following Python packages:

bash
Copy
Edit
pip install pandas matplotlib statsmodels
📌 How to Run
Place cardioActivities.csv in the datasets/ directory.

Run any script via:

bash
Copy
Edit
python TaskX.py
Replace X with the appropriate task number (2–11).

**🧠 Insights & Applications**

This project applies a mix of data preprocessing (X), statistical analysis (Y), and time series decomposition and visualization (Z) techniques to derive meaningful insights from fitness activity data.

**✅ Key Insights:**

**X — Data Cleaning & Imputation**

Irrelevant columns (e.g., notes, GPX files) were dropped for a focused dataset.

Missing heart rate values were imputed using conditional averages based on activity type (Running, Cycling, Walking) — ensuring more accurate analysis without discarding data.

**Y — Descriptive Statistics & Aggregation**

Annual and weekly averages revealed the user's changing performance levels and consistency across years.

Summary tables highlighted which activities (e.g., Running vs. Cycling) contributed most to overall fitness efforts in terms of distance and elevation.

Calculated average number of weekly sessions, providing a measure of training discipline.

**Z — Time Series Decomposition & Trend Analysis**

Applied seasonal decomposition to weekly running distances, which separated trends from seasonal and irregular variations — uncovering sustained improvements and potential regressions over time.

Created historical distance and heart rate plots that help correlate training volume with cardiovascular endurance.

**Z — Visual Thresholds & Zone Mapping**

Defined heart rate zones and mapped training intensity using histograms — helping users understand time spent in moderate vs. high-effort workouts.

Annual distance plots used visual spans (green/yellow thresholds) to categorize training volumes, identifying "strong" vs. "light" training years.

Fun Benchmarking

A playful comparison with Forrest Gump helped translate fitness accomplishments into relatable real-world analogies, like shoe usage based on total kilometers.

**📈 Application:**

These insights can help:

Identify plateaus or spikes in fitness activity.

Optimize training plans for cardiovascular gains.

Detect overtraining or inconsistency using seasonality.

Improve athlete self-awareness and goal setting.



**📌 License**
This project is for educational and personal analysis purposes. Please attribute appropriately if reused.
