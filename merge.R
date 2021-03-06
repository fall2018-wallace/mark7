
#str(dfCleanCensus)
#View(dfCleanCensus)
CensusData<-dfCleanCensus
ArrestsData <- USArrests




ArrestsData=cbind(rownames(ArrestsData),ArrestsData) #Combine sequence of dataframe by rows or columns
colnames(ArrestsData)=c("stateName") #Giving name to the new column
#ArrestsData

#	Create a merged dataframe -- with the attributes from both dataframes
MergedData=merge(ArrestsData,CensusData,by="stateName") #merging the two dataframes on concolumn name "stateName"
colnames(MergedData)=c("stateName","Murder","Assault","UrbanPop","Rape","population","popOver18","percentOver18")
MergedData

#2)	Add the area of each state, and the center of each state, to the merged dataframe, 
#using the ‘state.center’, ‘state.center’ and ‘state.name’ vectors
stateName <- state.name     #getting all state names
stateArea<-state.area      #getting all state areas
stateCenter <- state.center     #getting coordinates of the centers of all states

otherDf <- data.frame(stateName, stateArea, stateCenter)     #merging above three datasets to form a dataframe
otherDf

mergeDf <- merge(MergedData, otherDf, by = "stateName")     #merging columns of arrests and states dataset with reference to stateName and pasting into a new dataset
mergeDf

mergeDf$stateName <- tolower(mergeDf$stateName)     #converting all state names to lower case because R cannot process capital letters
mergeDf
