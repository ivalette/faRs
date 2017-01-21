#' Make a file name
#' 
#' This function combines text with an input value to create a file name for the data from 
#' the US National Highway Traffic Safety Administration's Fatality Analysis Reporting System
#'
#' @param year An integer or a list of integers containing a year 
#'
#' @return a character vector containing a formatted combination of text and variable values
#' 
#' @references \url{https://www.nhtsa.gov/Data/Fatality-Analysis-Reporting-System-(FARS)}
#'
#' @examples
#' \dontrun{
#' make_filename(list(2013, 2014, 2015))
#' make_filename(2014:2015)
#' }
#' @export
make_filename <- function(year) {
        year <- as.integer(year)
        sprintf("accident_%d.csv.bz2", year)
}