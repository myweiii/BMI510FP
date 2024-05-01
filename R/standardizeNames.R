#' 5.
#' standardizeNames = function(data) : Write a wrapper around dplyr::rename_with and
#' janitor::make_clean_names that converts the variables in a tibble data to "small_camel" case
#' (or another case if you like). The idea here is to have a reliable function that standardizes the variable
#' names in data you’re dealing with. This function should import elements of the janitor and snakecase
#' packages; Roxygen2 will handle these dependencies for you.
#'
#' This function standardizes the variable names of a data frame to small camel case. It first cleans the names
#' to ensure they are syntactically valid, then converts them to small camel case using snakecase::to_any_case.
#'
#' @param data A data frame whose column names you want to standardize.
#'
#' @return A data frame with standardized small camel case column names.
#'
#' @examples
#' test_data = tibble::tibble(`First name` = c("John"), `Last name` = c("Doe"))
#' standardized_data = standardizeNames(test_data)
#' print(standardized_data)
#'
#' @import dplyr
#' @import janitor
#' @import snakecase
#' @import tidyverse
#' @export
standardizeNames = function(data) {
  # directly use packages: janitor, snakecase
  data = dplyr::rename_with(data, janitor::make_clean_names)
  case = "small_camel"
  data = dplyr::rename_with(data, ~snakecase::to_any_case(., case = case))
  return(data)

  # without using packages
  'original_names = names(data)
  camel_case_names = sapply(original_names, function(name) {
    parts = unlist(strsplit(gsub("[^[:alnum:]]+", "_", tolower(name)), "_"))
    parts = ifelse(seq_along(parts) == 1, parts, paste0(toupper(substring(parts, 1, 1)), substring(parts, 2)))
    camel_name = paste0(parts, collapse = "")
    camel_name = paste0(tolower(substring(camel_name, 1, 1)), substring(camel_name, 2))
    return(camel_name)
  })
  names(data) = camel_case_names
  return(data)'
}
