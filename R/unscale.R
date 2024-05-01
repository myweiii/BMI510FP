#' 3.
#' unscale = function(x) : Write a function that takes a vector that has been put through scale and
#' reverses the centering/scaling, if any
#'
#' This function reverses the scaling and centering transformation applied to a numeric vector.
#' It checks if the vector x has attributes for 'scaled:center' and 'scaled:scale',
#' and if these attributes are present, it unscales the data by applying the inverse
#' of the original scaling and centering transformations.
#'
#' @param x A numeric vector that may have been scaled and centered.
#'
#' @return A numeric vector with the scaling and centering reversed.
#'
#' @examples
#' x = c(1, 2, 3, 4, 5)
#' unscale(scale(x))
#'
#' @export
unscale = function(x) {
  if (!is.null(attributes(x)$`scaled:center`) && !is.null(attributes(x)$`scaled:scale`)) {
    center = attributes(x)$`scaled:center`
    scale = attributes(x)$`scaled:scale`

    x = x * scale + center
  }

  return(as.vector(x))
}
