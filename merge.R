
#str(dfCleanCensus)
#View(dfCleanCensus)
CensusData<-dfCleanCensus
ArrestsData <- USArrests



ArrestsData=cbind(rownames(ArrestsData),ArrestsData) #Combine sequence of dataframe by rows or columns
colnames(ArrestsData)=c("stateName") #Giving name to the new column
ArrestsData

#3)	Create a merged dataframe -- with the attributes from both dataframes
MergedData=merge(ArrestsData,CensusData,by="stateName") #merging the two dataframes on concolumn name "stateName"
colnames(MergedData)=c("stateName","Murder","Assault","UrbanPop","Rape","population","popOver18","percentOver18")
MergedData

