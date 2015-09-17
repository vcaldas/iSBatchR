#' Merge tools
getListOfTables <- function(sampleDir){
  fovs <- list.dirs(sampleDir, recursive = FALSE);
}



#' Merge tables in Samples
#'
#' This function returns a single data frame containing data from all indicated tables.
#' @param Sample folder path
#' @keywords sample
#' @export
#' @examples
#' mergeSample()


mergeSample <- function(sample = ".", tableName = NULL){
  # Get fields of View list in a sample
  fovs <- list.dirs(sample, recursive = FALSE);

  listOfImages = list();
  
  for( currentFov in fovs){
    
    mypattern <- paste(currentFov, tableName, sep = "/")
    mypattern <- paste(mypattern, ".csv", sep = "")

     if(!exists("dataset") && file.exists(mypattern)){
       dataset <- read.csv(mypattern, header = TRUE, sep = ",");
     } 
     
    else{
    if(file.exists(mypattern)){
        temp_dataset <- read.csv(mypattern, header = TRUE, sep = ",");
        dataset <- rbind(dataset, temp_dataset)
        rm(temp_dataset)
    }
    
     }
  }

  return(dataset)
}

multi_mergeSample <- function(sample = ".", tableName = NULL){
    
    
    
    
    
}
