#' This script is to concatenate all table peaks found, including the references to slices.
#' That way, I can input a single file to generate location maps in matlab.
#' 
#


append_tables <- function(referenceFile = reference, tableName = "Red_FittedPeaks_stack"){
    # Read the Reference to get the path
    drops <- c("error_x","error_y", "error_sigma_y", "error_sigma_x")
    rows <- nrow(reference);
    
    mypattern <- paste(print(reference[1, "Path"]) , tableName, sep = "/");
    mypattern <- paste(mypattern, ".csv", sep = "");
    
    tempTable <- read.csv(mypattern);
    tempTable$slice = 1;    
    tempTable[,!(names(tempTable) %in% drops)]
   
    
    
   
    for(i in 2:rows){
        print(i)
        mypattern2 <- paste(reference[i, "Path"] , tableName, sep = "/")
        mypattern2 <- paste(mypattern2, ".csv", sep = "")
        
        if(file.exists(mypattern2)){
            
            tempTable2 <- read.csv(mypattern2);
            tempTable2$slice = i;    
            
            tempTable2[,!(names(tempTable2) %in% drops)]
            tempTable <-  merge(x =tempTable, y = tempTable2, all = TRUE) 
            
        }
        
       
         write.table(tempTable, "./red_tempTable_STACK.csv", sep=",")
        }
    
    
    
    
      write.table(tempTable, "./red_AllPeaks_stack.csv", sep=",")
}
