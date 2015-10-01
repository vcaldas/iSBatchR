#' This script is subtract table A from table b, them have the peak intensity corrected by background
#' 
#' That way, I can input a single file to generate location maps in matlab.
#' 
#


subtract_tables <- function(referenceFile = reference, tableNameA = "Red_InsidePeak_Tracks", tableNameB ="Red_Outlines_Tracks"){
    # Read the Reference to get the path
   
    rows <- nrow(reference);
    
    mypattern <- paste(print(reference[1, "Path"]) , tableNameA, sep = "/");
    mypattern <- paste(mypattern, ".csv", sep = "");
    
    tableA <- read.csv(mypattern);
   
    mypattern <- paste(print(reference[1, "Path"]) , tableNameB, sep = "/");
    mypattern <- paste(mypattern, ".csv", sep = "");
    
    tableB <- read.csv(mypattern);
    
    
    
    
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
