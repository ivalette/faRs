#' Load MONTH and year into R
#' 
#' This function reads yearly and monthly data from 
#' the US National Highway Traffic Safety Administration's Fatality Analysis Reporting System
#' and returns an error if the selected years are not written corrected, found in the 
#' working directory files or if the working directory is not set properly
#'
#' @param years An character vector, integers or a list containing years 
#'
#' @inheritParams make_filename 
#' @inheritParams fars_read
#'
#' @return a list of data frames tbl containing MONTH and a newly created variable 
#' year for each year specified as parameter
#' Returns  \code{NULL} if the years can not be found in the files in the directory
#' or if the directory is not properly set 
#' 
#' @importFrom dplyr mutate
#' @importFrom dplyr select
#' @importFrom stats setNames
#'
#' @examples
#' \dontrun{
#' fars_read_years(2013)
#' }
#' @export
fars_read_years <- function(years) {
        lapply(years, function(year) {
                file <- make_filename(year)
                tryCatch({
                        dat <- fars_read(file)
                        dplyr::mutate_(dat, .dots = setNames(list(~year)), year) %>%
                                dplyr::select_(~MONTH, ~year)
                },
                error = function(e) {
                        warning("invalid year: ", year)
                        return(NULL)
                })
        })
}


