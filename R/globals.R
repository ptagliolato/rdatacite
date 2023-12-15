#' Package settings that can be changed by the user
#' @family package_customizable_settings
#' @export
package_settings <- (function() {
  pe <- new.env()
  dataciteCNBaseUrl <- "https://data.crosscite.org"
  assign("dataciteCNBaseUrl", dataciteCNBaseUrl, envir = pe)
  pe
})()

#' Set content negotiation base url 
#' @param url A `character`. Set the base URL to content negotiation base url.
#' @param force A `boolean`. Default FALSE.
#' @export
#' @examples 
#' set_dataciteCNBaseUrl("https://api.test.datacite.org/")
#' rdatacite::get_dataciteCNBaseUrl()
#' # now get data with content negotiation from test datacite server
#' rdatacite::dc_cn(
#'   dois = "10.82863/yxcc-3112",
#'   format = "schemaorg"
#' )
set_dataciteCNBaseUrl <- function(url = "https://data.crosscite.org", force = FALSE) {
  if (!endsWith(url, "/")) {
    url <- paste0(url, "/")
  }
  # TODO: check alternative with crul 
  # @importFrom RCurl url.exists
  # if (!RCurl::url.exists(url)) {
  #   if (force) {
  #     warning("The URL ", url, " is not reachable, I set it because
  #             force TRUE is specified")
  #   } else  {
  #     stop("The URL ", url, " is not reachable")
  #   }
  # }
  message("Changing dataciteCNBaseUrl base URL to: ", url)
  assign("dataciteCNBaseUrl", url, envir = package_settings)
}

#' Get content negotiation base URL
#' @return contant negotiation base URL
#' @family package_customizable_settings
#' @export
get_dataciteCNBaseUrl <- function() {
  get("dataciteCNBaseUrl", envir = package_settings)
}