#' 1.
#' logLikBernoulli = function(data) Write a function that takes a vector like
#' data = c(1,0,0,0,1,1,1,) and calculates the parameter p that maximizes the log-likelihood
#' log(P(p|data)). Use a grid-based search with p in steps of 0.001.
#'
#' This function estimates the maximum likelihood estimate for the parameter p of a Bernoulli distribution
#' using a grid search approach. It calculates the log-likelihood of observing the given data for
#' a sequence of p values ranging from 0 to 1 in steps of 0.001 and returns the p that maximizes the log-likelihood.
#'
#' @param data A numeric vector of 0s and 1s representing Bernoulli trials.
#'
#' @return The value of p that maximizes the log-likelihood for the given data.
#'
#' @examples
#' data = c(1,0,0,0,1,1,1)
#' print(logLikBernoulli(data))
#'
#' @export
logLikBernoulli <- function(data) {
  likelihood <- function(p) {
    sum(data * log(p) + (1 - data) * log(1 - p))
  }
  p_grid = seq(0, 1, by = 0.001)
  loglik_values = sapply(p_grid, likelihood)
  p_grid[which.max(loglik_values)]
}
