h1. Q1

a) Determine whether each of the two attributes (columns) is treated
as qualitative (categorical) or quantitative (numeric) using
R. Explain how you can tell using R.

First column is quantitative; the second is qualitative:

I can tell the first column is quantitative because sum() works:

    > sum(data[1])
    [1] 3186

I can tell the second column is qualitative because sum() doesn't work:

    > sum(data[2])
    Error in FUN(X[[1L]], ...) : 
    only defined on a data frame with all numeric variables

and thus not all values are numeric.

b) What is the specific problem that causes one of these two
attributes to be read in as qualitative (categorical) when it seems it
should be quantitative (numeric)?

There's a "two" in the second column.

c) Use the command plot() in R to make a plot for each column by
entering plot(data[,1]) and plot(data[,2]). Because one variable is
read in as quantitative (numeric) and the other as qualitative
(categorical) these two plots are showing completely different things
by default. Explain exactly what is being plotted in each of the two
cases. Include these two plots in your homework.

In plot(data[,1]), the first column's values are being displayed as
the range, with the row index as the domain. 
In plot(data[,2]), a histogram is being generated for all the possible
values in the second column.


d) Read the data into Excel. Excel should have no problem opening the
file directly since it is .csv. Create a new column that is equal to
the second column plus 10. What is the result for the problem
observations (rows) you identified in part b? What specific outcome
does Excel display?

Outlook displays: "#VALUE!".

2) 

a) Read the data into R using data<-
read.csv("twomillion.csv",header=FALSE)...Extract a
simple random sample with replacement of 10,000 observations
(rows). Show your R commands for doing this.

> sample <- sample(data,10000,TRUE)



