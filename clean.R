
# <- read.csv("scprc_est_2017_18_pop_res.csv")
#dfStates

# 1)	Read in the census dataset (using the function created in HW 3)
readStates <- function(states)
{
        states <- states[-1,]
        num.row <- nrow(states)
        states <- states[-num.row,]
        
        states <- states[,-1:-4]
        
        
        
        colnames(states) <- c("stateName", "population", "popOver18", "percentOver18")
        
        return(states)
}


cleanCensus <- readStates(raw_data)
str(cleanCensus)


arrests <- USArrests                                      #Storing a dataset into a new variable
View(arrests)

arrests$stateName <- rownames(arrests)     #Copying rownames of arrests and pasting in a new column in arrests dataset
mergeDf <- merge(cleanCensus, arrests, by = "stateName")     #merging columns of arrests and states dataset with reference to stateName and pasting into a new dataset
View(mergeDf)

#2)	Add the area of each state, and the center of each state, to the merged dataframe, 
#using the ‘state.center’, ‘state.center’ and ‘state.name’ vectors
stateName <- state.name     #getting all state names
stateArea<-state.area      #getting all state areas
stateCenter <- state.center     #getting coordinates of the centers of all states

otherDf <- data.frame(stateName, stateArea, stateCenter)     #merging above three datasets to form a dataframe
View(otherDf)

mergeDf <- merge(mergeDf, otherDf, by = "stateName")     #merging columns of arrests and states dataset with reference to stateName and pasting into a new dataset
View(mergeDf)

mergeDf$stateName <- tolower(mergeDf$stateName)     #converting all state names to lower case because R cannot process capital letters
View(mergeDf)

