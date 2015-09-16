
getListOfTables <- function(sampleDir){
  fovs <- list.dirs(sampleDir, recursive = FALSE);
}


merge.sample <- function(sample, tableName = NULL){
  # Get fields of View list in a sample
  fovs <- list.dirs(sample, recursive = FALSE);

  listOfImages = list();
  
  for( currentFov in fovs){
    
    mypattern <- paste(currentFov, tableName, sep = "/")
    mypattern <- paste(mypattern, ".csv", sep = "")

     if(!exists("dataset")){
       dataset <- read.csv(mypattern, header = TRUE, sep = ",");
     } 
     
    else{
      temp_dataset <- read.csv(mypattern, header = TRUE, sep = ",");
       dataset <- rbind(dataset, temp_dataset)
       rm(temp_dataset)
     }
  }

  return(dataset)

}

multimerge <- function(samplePath){
  filenames <- list.files(path=samplePath, full.names=TRUE, )
  
  datalist <- lapply(filenames, function(x){read.csv(file=x,header=T)})
  
  Reduce(function(x,y) {merge(x,y)}, datalist)
  
  
}