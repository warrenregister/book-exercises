# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"

employees <- c(paste('Employee ', (1:100), sep=""))


# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salarys <- runif(100, 40000, 50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
adjustments <- round(runif(100, -5000, 10000))


# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, salarys, adjustments, stringsAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$salary_2018 <- salaries$salarys + salaries$adjustments

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$raise_or_not <- salaries$adjustments > 0


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
salaries[57, 'salarys']

# How many employees got a raise?
sum(salaries$raise_or_not)

# What was the dollar value of the highest raise?
highest_raise <- sort(salaries$adjustments, decreasing = TRUE)[1]
highest_raise
salaries$adjustments

# What was the "name" of the employee who received the highest raise?
salaries[salaries$adjustments == highest_raise,]$employees

# What was the largest decrease in salaries between the two years?
lowest_raise <- sort(salaries$adjustments, decreasing = FALSE)[1]
lowest_raise


# What was the name of the employee who recieved largest decrease in salary?
salaries[salaries$adjustments == lowest_raise,]$employees


# What was the average salary change?
mean(salaries$adjustments)

# For people who did not get a raise, how much money did they lose on average?
mean(salaries[salaries$adjustments < 0,]$adjustments)

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?
##  Yes, negative numbers were between 0 and -5000 so they average to ~ -2500 and 
## positive numbers were between 0 and 10000 so theyd average ~5000 and together 
## theyd average around 2500, which is what happened. The negative avergae was a 
## little low, so the overall average was higher.

# Write a .csv file of your salary data to your working directory
write.csv(salaries, './Desktop/docs/Classes/info201/exercise_df.csv')

