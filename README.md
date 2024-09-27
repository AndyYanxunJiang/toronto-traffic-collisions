# Traffic Collisions in Toronto: Analysis of Trends and Safety Insights

## Overview

This paper examines traffic collisions in Toronto from 2014 to 2024, analyzing trends over time and the factors influencing collisions. It explores the timing, causes, and consequences of different types of collisions, identifying patterns and insights for improving road safety.

## File Structure

The repo is structured as:

-   `data/raw_data`: Contains the raw data and a simulated data.
-   `data/analysis_data`: Contains the cleaned data used for analysis.

-   `scripts/00-simulate_data.R`: The code for simulating data and testing the simulated data.
-   `scripts/01-download_data.R`: The code for downloading the raw data.
-   `scripts/02-data_cleaning.R`: The code for cleaning the raw data.
-   `scripts/03-test_data.R`: The code for testing the cleaned data.

-   `paper/paper.qmd`: The Quarto document for the paper.
-   `paper/paper.pdf`: The compiled PDF of the paper.
-   `references.bib`: The bibliography file containing all references.

-   `other/llm`: Contains the chat history with ChatGPT.
-   `other/sketches`: Contains the sketches of all the visualizations.



## LLM Usage Disclosure

ChatGPT, specifically GPT-4o and o1-preview was used to assist in the development of this paper. The LLM was primarily utilized for coding support across different aspects of the project, such as data cleaning, data testing, data visualization, citation, and rendering the final document. The chat history for each of these specific tasks is documented in separate files in an extra folder, which can be found in `other/llm/usage_specific`. The entire chat history can be found in `other/llm/usage.txt`.
