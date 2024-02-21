# Derived data

This document provides a detailed overview of the process involved in handling and cleaning the raw data. It includes steps such as removing unnecessary variables, reclassifying data, and ensuring the dataset is well structured for generating plots efficiently. we used `dylpr` package for data processing, which could be downloaded by `install.packages()` function.

## U.S. level

We want to plot a facet line plots to compare different percentiles of total compensation between all workers and prime-age workers from 2005 to 2019. We took following steps to clean the [raw data](data/raw/pctl_of_inc_us_w2.csv):

-   Load data by using `read.csv()` function.

-   Subset the dataset by variables `group_var` and `inc_var` using the `filter()` function, remaining observations only for total compensation for all sample members.

-   Select necessary variables of dataset by using `select()` function.

-   Rename columns from `pctl10_adj` – `pctl99_adj` to `10%` - `99%` by using `rename()` function. This will be convenient for us to set up the legend text.

-   Transform the wide data into tall data using the `pivot_longer()` function. Convert the column names from `10%` to `99%` into a new variable called `Percentile`, while retaining corresponding percentile values as a new variable called `value`. This will help in plotting line plots and coloring by different percentiles.

-   Change the group names in `samp` to make them more informative for the panel titles.

-   Finally, save the cleaned data into a CSV file named [01_pctl_of_income_US.csv](data/derived/01_pctl_of_income_US.csv).

The script [01_pctl_of_income_US.R](src/data-cleaning/01_pctl_of_income_US.R) contains all the code used in the data cleaning process.

## State level

For the state level, we want to plot a map to show the median total compensation for all workers in 2019. The steps to clean the [raw data](data/raw/pctl_of_inc_state_w2) are as follows:

-   Load data by using `read.csv()` function.

-   Subset the dataset by variables `year`, `group_var` and `inc_var` using the `filter()` function, only observations of total compensation for all sample members in 2019 are remained.

-   Select necessary variables of dataset by using `select()` function.

-   Generate a new variable `Income` based on the values of `pctl50_adj` using `mutate()` function. We compared the values with 30000, 35000, 40000, 45000, 50000 and 55000, categorizing them into groups "\< 30", "30 - 35", "35 - 40", "40 - 45", "45 - 50" and "\> 50" using `case_when()` function.

-   Finally, save the cleaned data into a CSV file named [02_pctl50_of_income_state.csv](data/derived/02_pctl50_of_income_state.csv).

The script [02_pctl50_of_income_state.R](src/data-cleaning/02_pctl50_of_income_state.R) contains all the code used in the data cleaning process.
