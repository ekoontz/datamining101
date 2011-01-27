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

