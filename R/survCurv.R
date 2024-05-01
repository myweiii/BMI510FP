#' 2.
#' survCurv = function(status,time) Write a function that takes a numerical vector status and a
#' numerical vector time , and calculates and plots a survival curve S(t) . Test your function on the dataset
#' here (https://jlucasmckay.bmi.emory.edu/global/bmi510/Labs-Materials/survival.csv)
#'
#' This function computes and plots a survival curve based on provided status and time data.
#' It calculates the number of events and the risk set at each unique time point,
#' and then computes the survival probability using the Kaplan-Meier estimator.
#'
#' @param status A numeric vector indicating whether an event occurred (1) or not (0).
#' @param time A numeric vector indicating the time at which each event or censoring occurred.
#'
#' @return A ggplot object representing the survival curve.
#'
#' @import tidyverse
#' @import dplyr
#' @import ggplot2
#' @import tibble
#' @importFrom stats setNames
#' @importFrom stats sd
#' @importFrom utils globalVariables
#' @examples
#' data_url = "https://jlucasmckay.bmi.emory.edu/global/bmi510/Labs-Materials/survival.csv"
#' data_file = tempfile()
#' download.file(data_url, data_file, method = "curl")
#' surv_data = read.csv(data_file)
#' print(surv_data)
#' survCurv(surv_data$status, surv_data$time)
#'
#' @export
survCurv = function(status, time) {
  data = tibble(status=status, time=time, n_d=status, n_r=time)
  survival_data = data %>%
  arrange(time) %>%
  group_by(time) %>%
  summarise(n_d = sum(status == 1), n_r = n()) %>%
  ungroup()

  survival_data = survival_data %>%
  mutate(n_r = rev(cumsum(rev(n_r)))) %>%
  mutate(survival_prob = 1 - (n_d / n_r)) %>%
  mutate(log_surv = log(survival_prob)) %>%
  mutate(cumulative_surv = exp(cumsum(log_surv)))

  ggplot(survival_data, aes(x = time, y = cumulative_surv)) +
  geom_step() +
  labs(title = "Survival Curve", x = "Time", y = "Survival Probability") +
  theme_minimal()
}
