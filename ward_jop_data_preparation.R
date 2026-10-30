# Prepares the de-identified release data from the raw survey files.
# Run once by the author on the raw exports in raw/, which are not released. Replicators start from ward_jop_localcandidates_exp_data.csv and ward_jop_yougov_data.sav.

library(tidyverse)
library(zipcodeR)

# Read
raw <- read_csv("raw/final_exp_data.csv")
rural_urban <- read_csv("raw/ruca2010zipcode.csv")

stopifnot(all(c("zipcode", "prolific_id") %in% trimws(names(raw))))
stopifnot(all(c("zipcode", "ruca1") %in% names(rural_urban)))

# Trailing spaces in column names
names(raw) <- trimws(names(raw))

# Zip codes: ZIP+4 to five digits, anything else not five digits to NA
raw <- raw %>%
  mutate(
    zipcode = str_sub(as.character(zipcode), 1, 5),
    zipcode = ifelse(str_detect(zipcode, "^[0-9]{5}$"), zipcode, NA)
  )

# State
zip_lookup <- zipcodeR::zip_code_db %>%
  mutate(zipcode = str_pad(as.character(zipcode), width = 5, pad = "0")) %>%
  select(zipcode, state)

# RUCA
rural_urban <- rural_urban %>%
  mutate(zipcode = str_pad(as.character(zipcode), width = 5, pad = "0")) %>%
  select(zipcode, ruca1)

exp_data <- raw %>%
  left_join(zip_lookup, by = "zipcode") %>%
  left_join(rural_urban, by = "zipcode")

stopifnot(nrow(exp_data) == nrow(raw))

# Drop identifiers and variables not used in the analysis
exp_data <- exp_data %>%
  select(
    ResponseId, `Duration (in seconds)`, Q_RecaptchaScore,
    race, education, hh_income, age, resp_gender, pid1, pid2, state, ruca1,
    treatment, control, gpt_answer,
    starts_with("chosen_profile"), starts_with("profile"),
    manipulation_check_1, attention_check
  ) %>%
  select(-matches("^profile[12]_gender_round"))

write_csv(exp_data, "ward_jop_localcandidates_exp_data.csv")

# YouGov UniOM, August 2022: keep analysis variables only
library(haven)

uniom_raw <- read_sav("raw/P_UniversityOfOxford_UniOM_August22_Ward.sav")

uniom_vars <- c(
  "ID", "Weight", "age", "gender", "social_grade", "education_level", "political_attention", "ONS_urban",
  "AW_pid1", "AW_pid2", "AW_localid_1",
  paste0("AW_candpref1_", 1:6), paste0("AW_candpref2_", 1:6)
)
stopifnot(all(uniom_vars %in% names(uniom_raw)))

write_sav(uniom_raw[, uniom_vars], "ward_jop_yougov_data.sav")

# Pilot, March 2025: all survey variables except timestamps
pilot_raw <- read.csv("raw/chpt6_pilot/prime1_data.csv")
stopifnot(all(c("StartDate", "EndDate", "Group", "Q3", "Q4", "Q5_1", "Q5_2", "Q5_3") %in% names(pilot_raw)))

write.csv(pilot_raw[, setdiff(names(pilot_raw), c("StartDate", "EndDate"))], "ward_jop_pilot_data.csv", row.names = FALSE)
# One place name in the reflections was then replaced with [town] by hand, as for the main study
