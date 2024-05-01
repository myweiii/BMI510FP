# BMI510FP

This is a Final Package project for Emory University BMI510 done by Mingyang Wei.
This package is written in R.

---

# Structure Description

- The directory <b>R</b> contains all functions' R scripts.
- The <b>DESCRIPTION</b> file contains the author information and specify the needed package.
- The <b>examples/Final_Projects_Examples.Rmd</b> shows how to use each function.

---

# Function Description
## 1. logLikBernoulli = function(data)

This function estimates the maximum likelihood estimate for the parameter p of a Bernoulli distribution using a grid search approach. It calculates the log-likelihood of observing the given data for a sequence of p values ranging from 0 to 1 in steps of 0.001 and returns the p that maximizes the log-likelihood.

### Input
<b>data:</b> A numeric vector of 0s and 1s representing Bernoulli trials.

### Output
<b>return:</b> The value of p that maximizes the log-likelihood for the given data.

---

## 2. survCurv = function(status,time)

This function computes and plots a survival curve based on provided status and time data. It calculates the number of events and the risk set at each unique time point, and then computes the survival probability using the Kaplan-Meier estimator.

### Input
<b>status:</b> A numeric vector indicating whether an event occurred (1) or not (0).

<b>time:</b> A numeric vector indicating the time at which each event or censoring occurred.

### Output
<b>return:</b> A ggplot object representing the survival curve.

---

## 3. unscale = function(x)

This function reverses the scaling and centering transformation applied to a numeric vector. It checks if the vector x has attributes for 'scaled:center' and 'scaled:scale', and if these attributes are present, it unscales the data by applying the inverse of the original scaling and centering transformations.

### Input
<b>x:</b> A numeric vector that may have been scaled and centered.

###Output
<b>return:</b> A numeric vector with the scaling and centering reversed.

---

## 4. pcApprox = function(x, npc)

This function performs PCA on the provided data matrix and uses the specified number of principal components to approximate the original data. Then it reconstructs the data approximation from the scores and loadings of the selected principal components. Finally, it re-centers the approximated data using the original data's mean.

### Input
<b>x:</b> A numeric matrix or data frame where rows are observations and columns are variables.

<b>npc:</b> The number of principal components.

### Output
<b>return:</b> A matrix containing the approximated data reconstructed from the first npc principal components.

---

## 5. standardizeNames = function(data)

This function standardizes the variable names of a data frame to small camel case. It first cleans the names to ensure they are syntactically valid, then converts them to small camel case using snakecase::to_any_case.

### Input
<b>data:</b> A data frame whose column names you want to standardize.

### Output
<b>return:</b> A data frame with standardized small camel case column names.

---

## 6. minimumN = function(x1,x2)
This function calculates the minimum sample size required to achieve a specified power for a one-sample or two-sample t-test. For a one-sample t-test, it tests if the mean of x1 is significantly different from zero. For a two-sample t-test, it tests if the means of x1 and x2 are significantly different.

### Input
<b>x1:</b> Numeric vector of data for the first sample.

<b>x2:</b> Numeric vector of data for the second sample.(Optional)

### Output
<b>return:</b> The minimum sample size required to achieve 80% power with a significance level of 0.05.

---

## 7. downloadRedcapReport = function(redcapTokenName,redcapUrl,redcapReportId)
This function retrieve a report from REDCap using the specified API token, report ID, and REDCap API URL. The api token should be stored in envrionment variable by using Sys.setenv(). The retrieved report returns in a tibble format.

### Input
<b>redcapTokenName:</b> The name of the environment variable that stores the REDCap API token.

<b>redcapUrl:</b> The URL of the REDCap.

<b>redcapReportId:</b> The id of the report to be downloaded.

### Output
<b>return:</b> A downloaded REDCap report tibble.


