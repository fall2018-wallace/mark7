
#Step B: Generate a color coded map
#3)	Create a color coded map, based on the area of the state 
library("ggmap")
library("ggplot2")
us <- map_data("state")     #turn data from the maps package in to a data frame suitable for plotting with ggplot2
USmap <- ggplot(mergeDf, aes(map_id = stateName))     #initializing  a ggplot object and passing mergeDf as the input data with map ID as stateName.
USmap <- USmap + geom_map(map = us, aes(fill= stateArea))     #creating a map visualization
USmap <- USmap + expand_limits(x = mergeDf$x, y= mergeDf$y)     #defining the x and y axes values of the map
USmap <- USmap + coord_map() + ggtitle("Map of US based on state area")     #coord_map() handles the distortion and aspect ratio of the map. ggtitle() gives a title to the map


#Step C: Create a color shaded map of the U.S. based on the Murder rate for each state 
#4)	Repeat step B, but color code the map based on the murder rate of each state.
USmur <- ggplot(mergeDf, aes(map_id = stateName))
USmur <- USmur + geom_map(map = us, aes(fill=Murder))
USmur <- USmur + expand_limits(x = mergeDf$x, y= mergeDf$y)
USmur <- USmur + coord_map() + ggtitle("Map of US based on murder rate of states")


#5)	 Show the population as a circle per state (the larger the population, the larger the circle), using the location defined by the center of each state
USmurCir <- USmur + geom_point(data = mergeDf, aes(x = mergeDf$x, y= mergeDf$y, color = "red", size = mergeDf$population))     #geom_point() plots points at the center of every state. Size attribute controls the size of the points
