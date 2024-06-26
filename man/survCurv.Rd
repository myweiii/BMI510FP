% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/survCurv.R
\name{survCurv}
\alias{survCurv}
\title{\enumerate{
\item 
}

survCurv = function(status,time) Write a function that takes a numerical vector status and a
numerical vector time , and calculates and plots a survival curve S(t) . Test your function on the dataset
here (https://jlucasmckay.bmi.emory.edu/global/bmi510/Labs-Materials/survival.csv)}
\usage{
survCurv(status, time)
}
\arguments{
\item{status}{A numeric vector indicating whether an event occurred (1) or not (0).}

\item{time}{A numeric vector indicating the time at which each event or censoring occurred.}
}
\value{
A ggplot object representing the survival curve.
}
\description{
This function computes and plots a survival curve based on provided status and time data.
It calculates the number of events and the risk set at each unique time point,
and then computes the survival probability using the Kaplan-Meier estimator.
}
\examples{
data_url = "https://jlucasmckay.bmi.emory.edu/global/bmi510/Labs-Materials/survival.csv"
data_file = tempfile()
download.file(data_url, data_file, method = "curl")
surv_data = read.csv(data_file)
print(surv_data)
survCurv(surv_data$status, surv_data$time)

}
