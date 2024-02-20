# About data

The purpose of this file is to describe the main variables in the raw data based on the specifications outlined in [IDDA book](https://www.minneapolisfed.org/-/media/assets/institute/census/data-center/idda_codebook.xlsx) and [documentation](https://www.minneapolisfed.org/-/media/assets/institute/census/data-center/idda_technical_documentation.pdf) from [Income Distributions and Dynamics in America: Data Center](https://www.minneapolisfed.org/institute/income-distributions-and-dynamics-in-america/data-center). We focused on data collected from individual-level income information reported on form W-2 for all data.

## U.S. level

We use `pctl_of_inc_us_w2.csv` dataset to analyze the percentile of total compensation for all workers and prime-age workers from 2005 to 2019. The main variables shows below:

-   year: the tax year of observations, from 2005 to 2019.

-   level: "pik" refers to individual-level income of form W-2.

-   samp: the types of workers.

    -   all_w2_pik: all workers with valid records in the tax year;

    -   prime_age_working_w2: workers aged 25-54 with earnings above federal minimum wage in the tax year.

-   inc_var: the types of incomes. We focused on the total compensation.

    -   Wage compensation (WC): total wages, tips, and other compensation;

    -   Deferred compensation (DC): total elective deferrals;

    -   Total compensation (TC): the sum of wage compensation and deferred compensation.

-   geo_var, geo_var_val and geo_abb: geographic information. The presence of "usst", "0", and "US" indicates that the data relate to the U.S. level.

-   group_var: the levels of classification, including all sample members ("xall"), race and ethnicity ("xrea" and "xred"), sex ("xsex"), age ("xage") and so on. We focused on all sample members.

-   group_var_val: the groups of each classification, such as all sample members ("All_sample_members") or sex group ("Female" and "Male"). We focused on all sample members.

-   pctl10 - pctl99_999: pth percentile of income by unadjusted dollars.

-   pce: standardized to 2012 pce index.

-   pctl10_adj – pctl99_999_adj: pth percentile of income by adjusted dollars. We focused on the adjusted values from 10th percentile to 99th percentile.

## State level

We use `pctl_of_inc_state_w2.csv` dataset to analyze the 50th percentile of total compensation in 2019 for all workers. The main variables shows below:

-   year: the tax year of observations, from 2005 to 2019. We focused on year 2019.

-   level: "pik" refers to individual-level income of form W-2.

-   samp: the types of workers. The dataset contains records of all workers with valid tax year information ("all_w2_pik").

-   inc_var: the types of incomes. The dataset records total compensation (TC).

-   geo_var: geographic information. The "state" indicates data relate to the state level.

-   geo_var_val: [FIPS state code](https://en.wikipedia.org/wiki/Federal_Information_Processing_Standard_state_code#FIPS_state_codes), from 01 to 56.

-   geo_abb: State abbreviation ([USPS](https://en.wikipedia.org/wiki/List_of_U.S._state_and_territory_abbreviations)), from AL to WY.

-   group_var: the levels of classification, including all sample members ("xall"), race and ethnicity ("xrea" and "xred"), sex ("xsex"), age ("xage") and so on. We focused on all sample members.

-   group_var_val: the groups of each classification, such as all sample members ("All_sample_members") or sex group ("Female" and "Male"). We focused on all sample members.

-   pctl10 - pctl98: pth percentile of income by unadjusted dollars.

-   pce: standardized to 2012 pce index.

-   pctl10_adj – pctl98_adj: pth percentile of income by adjusted dollars. We focused on the 50th percentile of adjusted values.
