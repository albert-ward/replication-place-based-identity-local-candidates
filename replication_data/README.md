# Replication materials

**Place-Based Identity and the Demand for Local Candidates**
*Journal of Politics*

## Overview

The replication materials consist of two R Markdown files and three datasets. `yougov_uniom_2022.Rmd` reproduces the observational analysis of a British survey (Table 1 and appendix Tables A.1–A.5). `ward_jop_localcandidates_exp_code.Rmd` reproduces the survey experiment and pilot study (all other tables, figures and quantities in the main text and online appendix).  

## Data availability and provenance

### License for data

The data are released under a Creative Commons CC0 1.0 Universal public domain dedication 

### Statement about rights

I have legitimate access to and permission to use the data in this package. YouGov permits redistribution of the UniOM data in this form. Participants in the experiment and pilot consented to the release of their anonymised responses, including the open-ended reflections, which have been redacted for personal details.

### Details on each data source

| Data source | Files | Provided | Citation |
|---|---|---|---|
| YouGov UniOM omnibus, University of Oxford, fielded 21–22 August 2022. Online survey of the YouGov panel, representative of adults in Great Britain. N = 1,793 | `ward_jop_yougov_data.sav` | Yes | YouGov (2022) |
| Survey experiment, fielded by the author on Prolific using Qualtrics, 16–18 April 2025. Preregistered at osf.io/mwbcu. N = 4,803 | `ward_jop_localcandidates_exp_data.csv` | Yes | Ward (2025) |
| Pilot study, fielded by the author on Prolific using Qualtrics, March 2025. N = 56 | `ward_jop_pilot_data.csv` | Yes | Ward (2025) |
| Open-ended responses from the experiment (treatment group), coded on 6 October 2026 by Claude Sonnet 5.5 (`claude-sonnet-5-5`, Anthropic) in the Claude desktop app (Cowork), with low effort and extended thinking off, using the prompt in `opentext_coding_prompt.txt`, and validated against the author's hand codes for a random sample of 303 | `ward_jop_localcandidates_exp_data.csv` | Yes | Ward (2026) |
| Rural-Urban Commuting Area codes, ZIP code approximation, 2010 (USDA Economic Research Service). Used only to derive `ruca1` before release | Not included (public) | No | USDA ERS (2020) |
| ZIP code to state lookup from the R package `zipcodeR`. Used only to derive `state` before release | Not included (public) | No | Rozzi (2021) |

All variables are documented in `ward_jop_codebook.pdf`.

## Dataset list

| Data file | Source | Notes | Provided |
|---|---|---|---|
| `ward_jop_yougov_data.sav` | YouGov UniOM, August 2022 | Analysis variables only. SPSS format, value labels retained | Yes |
| `ward_jop_localcandidates_exp_data.csv` | Survey experiment, April 2025 | One row per participant, before exclusions. Prolific IDs, ZIP codes, timestamps and unused variables removed. Includes open-ended responses, with their LLM and hand codes | Yes |
| `ward_jop_pilot_data.csv` | Pilot study, March 2025 | One row per participant. All survey variables except timestamps. One place name in the reflections replaced with [town] | Yes |

## Computational requirements

### Software requirements

- R 4.6.1, run in Visual Studio Code
- R packages, with the versions used to produce the results printed by `sessionInfo()` at the end of each knitted file:
  - tidyverse (dplyr, tidyr, readr, stringr, forcats, purrr, ggplot2)
  - haven, estimatr, broom, cregg, marginaleffects, modelsummary, texreg, ggforce, MASS, sandwich, lmtest

## Description of programs

| File | Purpose |
|---|---|
| `yougov_uniom_2022.Rmd` | Cleans the YouGov data and estimates Table 1 and appendix Tables A.1–A.5 |
| `ward_jop_localcandidates_exp_code.Rmd` | Cleans and reshapes the experiment data, applies the exclusions, and estimates all experimental results and the pilot manipulation check |
| `ward_jop_data_preparation.R` | Produces the three released data files from the raw exports. Included for transparency only, since the raw files are not released |
| `conjoint_code_v2.txt` | Qualtrics JavaScript that randomized the conjoint attributes and candidate names |
| `opentext_coding_prompt.txt` | Full prompt, coding scheme, decision rules and calibration examples (including the negative-response flag) used to code the open-ended responses with Claude Sonnet 5.5. The same scheme was used for the hand-coded validation sample |
| `ward_jop_codebook.pdf` | Codebook (LaTeX source: `ward_jop_codebook.tex`) |

## Instructions to replicators

Keep all files in one folder. Knitting uses the folder containing each Rmd as the working directory, so the file paths resolve without any setup.

1. Install the packages listed above.
2. Knit `yougov_uniom_2022.Rmd`.
3. Knit `ward_jop_localcandidates_exp_code.Rmd`. Figures are saved as PDF and PNG files in the package folder. Tables are printed as LaTeX in the knitted HTML file.

## List of tables, figures and programs

All results are produced by the section of the named file whose heading is given below.

| Result | File | Section heading | Output |
|---|---|---|---|
| Table 1 | `yougov_uniom_2022.Rmd` | Table 1 and Table A.3: Predicted probabilities | Printed and LaTeX table |
| Non-local traits (footnote to Table 1) | `yougov_uniom_2022.Rmd` | Footnote to Table 1: Non-local traits | Printed |
| Sample size and exclusions (text, Appendix F) | `ward_jop_localcandidates_exp_code.Rmd` | Exclusion criteria | Printed |
| Completion by condition (text) | `ward_jop_localcandidates_exp_code.Rmd` | Sample | Printed |
| Manipulation check, main study (text) | `ward_jop_localcandidates_exp_code.Rmd` | Manipulation check | Printed |
| Manipulation check, pilot (text, Appendix G) | `ward_jop_localcandidates_exp_code.Rmd` | Pilot study | Printed |
| Figure 1 | `ward_jop_localcandidates_exp_code.Rmd` | Figure 1 and Table A.10: AMCEs | `amce_overall_q1.pdf`, `.png` |
| Local candidate and carpetbagger probabilities (text) | `ward_jop_localcandidates_exp_code.Rmd` | Local candidate and carpetbagger probabilities | Printed |
| Figure 2 | `ward_jop_localcandidates_exp_code.Rmd` | Figure 2 and Table A.13: Marginal means by expressed place identity | `mm_overall_q1_desc.pdf`, `.png` |
| Table 2 | `ward_jop_localcandidates_exp_code.Rmd` | Table 2 and Table A.14: Treatment interactions (Model 1) | LaTeX table |
| Omnibus tests (text) | `ward_jop_localcandidates_exp_code.Rmd` | Table A.15: Omnibus tests | Printed |
| Open-text results (text) | `ward_jop_localcandidates_exp_code.Rmd` | Tables A.20 and A.21: Open-text coding, and Table A.22 | Printed and LaTeX tables |
| Table A.1 | `yougov_uniom_2022.Rmd` | Table A.1: Logit models | LaTeX table |
| Table A.2 | `yougov_uniom_2022.Rmd` | Table A.2: OLS and ordered logit on the full scale | LaTeX table |
| Table A.3 | `yougov_uniom_2022.Rmd` | Table 1 and Table A.3: Predicted probabilities | LaTeX table |
| Table A.4 | `yougov_uniom_2022.Rmd` | Table A.4: Stacked model, trait x identity | LaTeX table |
| Table A.5 | `yougov_uniom_2022.Rmd` | Table A.5: Place identity by party | LaTeX table |
| Table A.6 | — | Design table, see `conjoint_code_v2.txt` | — |
| Sample description (Appendix D) | `ward_jop_localcandidates_exp_code.Rmd` | Sample | Printed |
| Figure A.1 | — | Screenshot of the Qualtrics survey | — |
| Table A.7 | `ward_jop_localcandidates_exp_code.Rmd` | Table A.7: Exclusions | Printed |
| Tables A.8 and A.9 | `ward_jop_localcandidates_exp_code.Rmd` | Tables A.8 and A.9: Balance | Printed |
| Table A.10 | `ward_jop_localcandidates_exp_code.Rmd` | Figure 1 and Table A.10: AMCEs | LaTeX table |
| Table A.11 | `ward_jop_localcandidates_exp_code.Rmd` | Table A.11: Conditional AMCEs by treatment | LaTeX table |
| Table A.12 | `ward_jop_localcandidates_exp_code.Rmd` | Table A.12: Marginal means, full model and by treatment | LaTeX table |
| Table A.13 | `ward_jop_localcandidates_exp_code.Rmd` | Figure 2 and Table A.13: Marginal means by expressed place identity | Printed |
| Table A.14 | `ward_jop_localcandidates_exp_code.Rmd` | Table 2 and Table A.14: Treatment interactions | LaTeX table |
| Table A.15 | `ward_jop_localcandidates_exp_code.Rmd` | Table A.15: Omnibus tests | Printed |
| Table A.16 | `ward_jop_localcandidates_exp_code.Rmd` | Table A.16: Treatment interactions by party | LaTeX table |
| Table A.17 | `ward_jop_localcandidates_exp_code.Rmd` | Table A.17: Treatment interactions by urbanization | LaTeX table |
| Table A.18 | `ward_jop_localcandidates_exp_code.Rmd` | Table A.18: Treatment interactions by task | LaTeX table |
| Table A.19 | `ward_jop_localcandidates_exp_code.Rmd` | Table A.19: Treatment interactions by conjoint round | LaTeX table |
| Tables A.20 and A.21 | `ward_jop_localcandidates_exp_code.Rmd` | Tables A.20 and A.21: Open-text coding | Printed and LaTeX tables |
| Table A.22 | `ward_jop_localcandidates_exp_code.Rmd` | Table A.22: Number of place-identity and place-dependence claims | LaTeX table |
