# Exercise 5: dplyr grouped operations

# Install the `"nycflights13"` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library("nycflights13")
library("dplyr")

# What was the average departure delay in each month?
# Save this as a data frame `dep_delay_by_month`
# Hint: you'll have to perform a grouping operation then summarizing your data
nyc_flights <- as.data.frame(flights)
dep_delay_by_month <- nyc_flights %>%
  group_by(month) %>%
  summarise(average = mean(dep_delay, na.rm = TRUE)) %>% 
  arrange(-average)
# Which month had the greatest average departure delay?
# July 

# If your above data frame contains just two columns (e.g., "month", and "delay"
# in that order), you can create a scatterplot by passing that data frame to the
# `plot()` function
plot(dep_delay_by_month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation then summarize your data
# You can use the `head()` function to view just the first few rows
arr_delay_by_dest <- nyc_flights %>% 
  group_by(dest) %>% 
  summarise(average = mean(arr_delay, na.rm = TRUE)) %>% 
  arrange(-average) %>% 
  head()

# You can look up these airports in the `airports` data frame!
# Which city was flown to with the highest average speed?
highest_avg_speed <- nyc_flights %>%
  group_by(dest) %>% 
  summarise(average_speed = mean(distance, na.rm = TRUE) / mean(air_time, na.rm = TRUE)) %>% 
  arrange(-average_speed) %>% 
  head(1)
