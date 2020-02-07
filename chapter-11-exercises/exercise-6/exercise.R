# Exercise 6: dplyr join operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# Create a dataframe of the average arrival delays for each _destination_, then 
# use `left_join()` to join on the "airports" dataframe, which has the airport
# information
# Which airport had the largest average arrival delay?
nyc_flights <- as.data.frame(flights)
airports <- as.data.frame(airports)
avg_arr_delay_dest <- nyc_flights %>% 
  group_by(dest) %>% 
  summarise(avg_delay = mean(arr_delay, na.rm = TRUE))
left_join(avg_arr_delay_dest, airports) # no shared attrbs...
# Create a dataframe of the average arrival delay for each _airline_, then use
# `left_join()` to join on the "airlines" dataframe
# Which airline had the smallest average arrival delay?
airlines <- as.data.frame(airlines)
avg_arr_delay_carrier <- nyc_flights %>% 
  group_by(carrier) %>% 
  summarise(avg_delay = mean(arr_delay, na.rm = TRUE))
airlines_with_delays <- left_join(avg_arr_delay_carrier, airlines) %>% arrange(-avg_delay)
#Frontier Airlines
