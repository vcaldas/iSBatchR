#' cell plots
#'
#' Basic plot of cell intensity distribution
#' @param data frame
#' @keywords cell
#' @export
#' @examples
#' cell_intensity.plot()

cell_intensity.plot <- function(data, kernel = TRUE, sample.name = NULL, hide = FALSE,  graphTitle = "Cell intensity distribution"){
  
        if (!is.null(sample.name)){
            graphTitle <- paste(graphTitle, sample.name, sep = " - ")
        }
        
        #(data$height, main = "Cell intensity distribution", xlab = "Fluorescent count")
        if (kernel){ # overlay with a density plot
            
          my.plot <-  ggplot(data, aes(x= height)) + 
                geom_histogram(aes(y=..density..),colour="black", fill = "white") + 
                geom_density(alpha=.2, fill="#FF6666")+
                ggtitle(graphTitle)
            }
        
        else{
            my.plot <- ggplot(data, aes(x=height)) + geom_histogram(colour="black", fill = "white")
            }
        
        if(!hide){
           print(my.plot)
           } 
        
        if(hide){
            return(my.plot)
        }    
        
      } 
    
   # else{ # multiplot
        

calculate_optimal_nrows <- function(total = 10, ncols = 4){
    return(ceiling(total/ncols))
}


# Multiple plot function
#
# ggplot objects can be passed in ..., or to plotlist (as a list of ggplot objects)
# - cols:   Number of columns in layout
# - layout: A matrix specifying the layout. If present, 'cols' is ignored.
#
# If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
# then plot 1 will go in the upper left, 2 will go in the upper right, and
# 3 will go all the way across the bottom.
#
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
    library(grid)
    
    # Make a list from the ... arguments and plotlist
    plots <- c(list(...), plotlist)
    
    numPlots = length(plots)
    
    # If layout is NULL, then use 'cols' to determine layout
    if (is.null(layout)) {
        # Make the panel
        # ncol: Number of columns of plots
        # nrow: Number of rows needed, calculated from # of cols
        layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                         ncol = cols, nrow = ceiling(numPlots/cols))
    }
    
    if (numPlots==1) {
        print(plots[[1]])
        
    } else {
        # Set up the page
        grid.newpage()
        pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
        
        # Make each plot, in the correct location
        for (i in 1:numPlots) {
            # Get the i,j matrix positions of the regions that contain this subplot
            matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
            
            print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                            layout.pos.col = matchidx$col))
        }
    }
}


#' Cell multiplot
#'
#' Basic plot of cell intensity distribution
#' @param vector with directories
#' @keywords cell
#' @export
#' @examples
#' cell_intensity.multiplot()



cell_intensity.multiplot <- function(samples = batch.samples){
    library(grid)
         nsamples = length(samples)
         my.multiplot <- list();
         
         for (i in 1:nsamples){
             print(i)
             current.data   <- mergeSample(samples[i],tableName = "514_Cellintensity" )
             currentName    <- basename(samples[i]);
             current.plot   <- cell_intensity.plot(current.data, sample.name = currentName, hide = TRUE, graphTitle = "")
             my.multiplot[[i]]   <- current.plot
         }
         
         multiplot(plotlist = my.multiplot, cols= 6)


}
