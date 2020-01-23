# Exercise 4: external data sets: Gates Foundation Educational Grants

# Use the `read.csv()` functoin to read the data from the `data/gates_money.csv`
# file into a variable called `grants` using the `read.csv()`
# Be sure to set your working directory in RStudio, and do NOT treat strings as 
# factors!
df <- read.csv('./Desktop/docs/Classes/info201/book-exercises/chapter-10-exercises/exercise-4/data/gates_money.csv', stringsAsFactors =  FALSE)


# Use the View function to look at the loaded data
View(df)

# Create a variable `organization` that contains the `organization` column of 
# the dataset
organization <- df$organization


# Confirm that the "organization" column is a vector using the `is.vector()` 
# function. 
# This is a useful debugging tip if you hit errors later!
is.vector(organization)

## Now you can ask some interesting questions about the dataset

# What was the mean grant value?
mean(df$total_amount)

# What was the dollar amount of the largest grant?
highest <- sort(df$total_amount, decreasing = TRUE)[1]
highest

# What was the dollar amount of the smallest grant?
lowest <- sort(df$total_amount, decreasing = FALSE)[1]
lowest


# Which organization received the largest grant?
df[df$total_amount == highest,'organization']

# Which organization received the smallest grant?
df[df$total_amount == lowest,'organization']

# How many grants were awarded in 2010?
nrow(df)
