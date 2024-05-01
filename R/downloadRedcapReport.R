#'  7.
#'  downloadRedcapReport = function(redcapTokenName,redcapUrl,redcapReportId) :
#'  Using the block of RedCap template code below, write a function that:
#'  uses Sys.getenv() to read an API token called redcapTokenName from the
#'  users’ .REnviron file.
#'  queries redcapUrl to return the Redcap Report redcapReportId .
#'  (Notice these are the data from
#'  our simulated stroke study, now nicely and securely hosted on RedCap.)
#'  returns the contents as a tibble
#'
#' This function retrieve a report from REDCap using the specified API token, report ID, and REDCap API URL.
#' The api token should be stored in envrionment variable by using Sys.setenv().
#' The retrieved report returns in a tibble format.
#'
#' @param redcapTokenName The name of the environment variable that stores the REDCap API token.
#' @param redcapUrl The URL of the REDCap.
#' @param redcapReportId The id of the report to be downloaded.
#'
#' @return A downloaded REDCap report tibble.
#'
#' @examples
#' url = "https://redcap.emory.edu/api/"
#' Sys.setenv("REDCAP_API_TOKEN" = "6189879441F5C29A25245880677488BF")
#' print(downloadRedcapReport("REDCAP_API_TOKEN", url, '46524'))
#'
#' @import httr
#' @import tibble
#' @importFrom utils read.csv
#' @export
downloadRedcapReport = function(redcapTokenName, redcapUrl, redcapReportId) {
  api_token = Sys.getenv(redcapTokenName)
  print(api_token)

  data = list("token"=api_token,
              content='report',
              format='csv',
              report_id=redcapReportId,
              csvDelimiter='',
              rawOrLabel='raw',
              rawOrLabelHeaders='raw',
              exportCheckboxLabel='false',
              returnFormat='csv'
  )

  response = POST(redcapUrl, body = data, encode = 'form')

  content = content(response, "text", encoding = "UTF-8")
  report = read.csv(text = content, stringsAsFactors = FALSE)
  report_tibble = as_tibble(report)

  return(report_tibble)
}
