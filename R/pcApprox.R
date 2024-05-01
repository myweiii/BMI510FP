#' 4.
#' pcApprox = function(x, npc) : Write a function that returns an approximation to the data x based on
#' npc PCs. (Note that the approximation should be rescaled and centered to match the original data).
#'
#' This function performs PCA on the provided data matrix and uses the specified number of principal
#' components to approximate the original data. Then it reconstructs the data approximation from the
#' scores and loadings of the selected principal components.
#' Finally, it re-centers the approximated data using the original data's mean.
#'
#' @param x A numeric matrix or data frame where rows are observations and columns are variables.
#' @param npc The number of principal components.
#'
#' @return A matrix containing the approximated data reconstructed from the first npc principal components.
#'
#' @examples
#' data = mtcars
#' npc = 2
#' approx_data = pcApprox(data, npc)
#' print(data)
#' print(approx_data)
#'
#' @importFrom stats prcomp
#' @export
pcApprox = function(x, npc) {
  pca = prcomp(x, scale. = FALSE)
  scores = pca$x[, 1:npc, drop = FALSE]
  loadings = pca$rotation[, 1:npc, drop = FALSE]
  approx = scores %*% t(loadings)
  approx = scale(approx, center = -pca$center, scale = FALSE)

  return(approx)
}
