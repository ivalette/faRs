#' Read csv file into R
#' 
#' This function loads a csv file in R and converts it to a data frame tbl
#'
#' @param filename.csv The name of the csv file to load in R 
#'
#' @return a data frame tbl 
#' Returns \code{file filename does not exits} if the file can not be found or the directory is
#' not properly set
#' 
#' @author Bella V. (Documentation only)
#' @references Peer Assignment in Coursera Course "Building R Packages"
#' @source \url{https://www.coursera.org/learn/r-packages/peer/25XGp/documenting-code}
#' 
#' @importFrom dplyr tbl_df %>% 
#' @importFrom readr read_csv
#' 
#' @section Warnings:
#' This function can only handle csv files from 
#' the US National Highway Traffic Safety Administration's Fatality Analysis Reporting System
#' 
#' @examples
#' \dontrun{  
#' fars_read("accident_2013.csv.bz2")
#' }
#' @export
fars_read <- function(filename) {
        if(!file.exists(filename))
                stop("file '", filename, "' does not exist")
        data <- suppressMessages({
                readr::read_csv(filename, progress = FALSE)
        })
        dplyr::tbl_df(data)
}
