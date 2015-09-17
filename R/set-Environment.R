#' Set variables to start an analysis
#'
#' This function set the basic variables for convenience
#' @param Experiment path
#' @keywords experiment
#' @export
#' @examples
#' isbatch_setEnvironment()

isbatch_setEnvironment <- function(experiment = "./"){
    # set experiment
    batch.experiment<<- experiment
    batch.samples   <<- list.dirs(experiment, recursive = FALSE);
    
    
    
}