#' 6.
#' minimumN = function(x1,x2) : Write a wrapper around pwr::pwr.t2n.test that takes either one ( x1 )
#' or two ( x2 ) samples of preliminary data and returns the minimum sample size needed for a t-test of the
#' null hypotheses that either μX1 == 0 or μX1 == μX2 with 80% power at alpha=0.05.
#'
#' This function calculates the minimum sample size required to achieve a specified power
#' for a one-sample or two-sample t-test.
#' For a one-sample t-test, it tests if the mean of x1 is significantly different from zero.
#' For a two-sample t-test, it tests if the means of x1 and x2 are significantly different.
#'
#' @param x1 Numeric vector of data for the first sample.
#' @param x2 Numeric vector of data for the second sample.(Optional)
#'
#' @return The minimum sample size required to achieve 80% power with a significance level of 0.05.
#'
#' @examples
#' set.seed(123)
#' x1 <- rnorm(20, mean = 5, sd = 1)
#' x2 <- rnorm(20, mean = 6, sd = 1)
#' minimumN(x1)
#' minimumN(x1, x2)
#'
#' @importFrom pwr pwr.t.test
#' @export
minimumN = function(x1, x2 = NULL) {
  power = 0.80
  alpha = 0.05

  if (is.null(x2)) {
    sigma = sd(x1)
    delta = abs(mean(x1)) / sigma
    result = pwr::pwr.t.test(d = delta, sig.level = alpha, power = power, type = "one.sample")
  } else {
    sigma1 = sd(x1)
    sigma2 = sd(x2)
    n1 = length(x1)
    n2 = length(x2)
    pooled_sd = sqrt(((n1 - 1) * sigma1^2 + (n2 - 1) * sigma2^2) / (n1 + n2 - 2))
    delta = abs(mean(x1) - mean(x2)) / pooled_sd
    result = pwr::pwr.t.test(d = delta, sig.level = alpha, power = power, type = "two.sample")
  }
  return(ceiling(result$n))
}
