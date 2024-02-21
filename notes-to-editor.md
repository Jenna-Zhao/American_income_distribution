# Reflective Summary

## Style guidelines

The project follows the instructions for web visualization in The Economist style guide, mainly:

-   White background for plot and panel;

-   Only remain major grid lines for the x-axis or no grid line for the map;

-   Add a rotated tag and markers for each panel;

-   Chart size is 595px for the width;

-   Title, subtitle, panel headings, legend text and source text have different typefaces and size;

-   Use standard web as chart dimensions and also refer to panel charts;

-   Use a web chart palette.

## Guidelines are met or not met:

Following guidelines are met:

-   White background and remove unnecessary grid lines;

-   Add a rotated tag and markers for each panel;

-   Chart width is 595px for the final report;

-   The size and font of elements;

-   Alignments between elements;

-   No axis title, axis line;

-   Panel spacing is 24pts.

Following guidelines need further adjustment:

-   Used "sans" as typeface rather than "econ sans";

-   Margins between elements;

-   Plot width didn't build on 332pts, so the output size looks different than expected;

-   Use `scale_color_economist()` to adjust the colour of lines as there are more than the provided colour in the palette.

## Further alterations

Firstly, adjust elements to ensure consistency with the guidelines. It includes changing the text typeface to "econ sans", modifying the margins of elements, and altering line colors.

Secondly, comparing values becomes challenging when two states have similar median incomes. Hence, adjusting the map to show these differences may improve the clarity and effectiveness of the analysis.
