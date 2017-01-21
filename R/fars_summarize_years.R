#' Count the number of accidents per month and year
#' 
#' This function load data from data from
#' the US National Highway Traffic Safety Administration's Fatality Analysis Reporting System,
#' binds the yearly data together, group by year and month, counts th number of accidents and 
#' spread the results with month in rows and a year per column.
#'
#' @param years An character vector, integers or a list containing years
#' @inheritParams fars_read_years 
#'
#' @return a spread data frame and returns \code{NULL} if the years can not be found in the files 
#' in the directory or if the directory is not properly set 
#' 
#' @importFrom dplyr bind_rows
#' @importFrom dplyr group_by
#' @importFrom dplyr summarize
#' @importFrom tidyr spread
#' @importFrom stats setNames
#' 
#' @examples
#' \dontrun{
#' head(fars_summarize_years(2013:2015))
#' }
#' @export
fars_summarize_years <- function(years) {
        dat_list <- fars_read_years(years)
        dplyr::bind_rows(dat_list) %>%
                dplyr::group_by_(~year, ~MONTH) %>%
                dplyr::summarize_(.dots = setNames(~n(), "n")) %>%
                tidyr::spread_(~year, ~n)
}