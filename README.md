# American income distribution and dynamics

<!-- badges: start -->

<!-- badges: end -->

This project aims to provide a visualization of the distribution and dynamics of American income for both U.S. and state level.

-   For U.S. level, we compared the percentile of total compensation for all workers with prime-age workers from 2005 to 2019.

-   For state level, we focused on the median total compensation in 2019 for all workers.

## Data

The [**raw**](data/raw) folder contains raw data stored in CSV format:

-   [pctl_of_inc_us_w2.csv](data/raw/pctl_of_inc_us_w2.csv)
-   [pctl_of_inc_state_w2.csv](data/raw/pctl_of_inc_state_w2.csv)

All these files are derived from "Percentiles of income module" of [Income Distributions and Dynamics in America: Data Center](https://www.minneapolisfed.org/institute/income-distributions-and-dynamics-in-america/data-center) on the [Federal Reserve Bank of Minneapolis](https://www.minneapolisfed.org/). Also, a detailed description ([About_data.md](data/raw/About_data.md)) of variables is contained in the same folder.

The [**derived**](data/derived) folder contains processed data, which is more suitable to draw plots. Similarly, please refer to [derived_data.md](data/derived/derived_data.md) for derived process.

The [**data-cleaning**](src/data-cleaning) folder contains scripts used to clean raw data and generate derived data. Each script is named after the derived data it generates, making it easy to identify. The data processing primarily relies on the `dylpr` package.

## Outputs

The [**outputs**](outputs) folder contains plots and corresponding script. Each plot and script name is directly related to the derived dataset it represents.

-   At the U.S. level analysis, we've generated facet line plots to compare total compensation. The script relies on packages, including `ggplot2`, `ggthemes` and `grid` to execute the visualizations.

-   At the state level analysis, we drew a color-coded map to display varying total compensation across different states. Also, we used geographic information about each state stored in the `tigris` package. The script relies on several packages, including `ggplot2`, `grid`, `dplyr`, `sf` and `tigris` to generate the visualizations.

All of these packages can be installed by using `install.packages()` function.

## Report

The [notes-to-editor.md](notes-to-editor.md) file includes a summary of style guidelines, aspects of the requirements that are not fully met at this time, and areas where further alterations are needed.

The [**report**](report) folder contains the final article in PDF format, generated by the [final_article.qmd](report/final_article.qmd) file.

## License

This project is licensed under the MIT license.
