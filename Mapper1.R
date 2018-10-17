
#Step B: Generate a color coded map
#3)	Create a color coded map, based on the area of the state 
library("ggmap")
library("ggplot2")
us <- map_data("state")     #turn data from the maps package in to a data frame suitable for plotting with ggplot2
us
mapArea <- ggplot(mergeDf, aes(map_id = stateName))     #initializing  a ggplot object and passing mergeDf as the input data with map ID as stateName.
mapArea <- mapArea + geom_map(map = us, aes(fill= stateArea))     #creating a map visualization
mapArea <- mapArea + expand_limits(x = mergeDf$x, y= mergeDf$y)     #defining the x and y axes values of the map
mapArea <- mapArea + coord_map() + ggtitle("Map of US based on state area")     #coord_map() handles the distortion and aspect ratio of the map. ggtitle() gives a title to the map
mapArea

#Step C: Create a color shaded map of the U.S. based on the Murder rate for each state 
#4)	Repeat step B, but color code the map based on the murder rate of each state.
mapArea1 <- ggplot(mergeDf, aes(map_id = stateName))
mapArea1 <- mapArea1 + geom_map(map = us, aes(fill=Murder))
mapArea1 <- mapArea1 + expand_limits(x = mergeDf$x, y= mergeDf$y)
mapArea1 <- mapArea1 + coord_map() + ggtitle("Map of US based on murder rate of states")
mapArea1
