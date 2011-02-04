#example usage: 

# > a3           <- c( 1.0, 6.0, 5.0, 4.0, 7.0, 3.0, 8.0, 7.0, 5.0 )
# > target_class <- c( '+', '+', '-', '+', '-', '-', '-' ,'+' ,'-' )
# > missclassrate(2.0, a3, target_class)
# [1] 0.25

missclassrate <- function (split_at, a3, target_class) {

  # number of times that target_class is '-' is true when a3 < split_at.
  left_c0 <- sum(
               mapply(
                  function(x,y) 
                     if (x < split_at) { 
                         if (y == '-') 1
                         else 0
                     } else {
                         0
                     },a3,target_class))

  # number of times that target_class is '+' is true when a3 < split_at.
  left_c1 <- sum(
               mapply(
                  function(x,y) 
                     if (x < split_at) { 
                         if (y == '+') 1
                         else 0
                     } else {
                         0
                     },a3,target_class))

  # number of times that target_class is '-' is true when a3 => split_at.
  right_c0 <- sum(
               mapply(
                  function(x,y) 
                     if (x >= split_at) { 
                         if (y == '-') 1
                         else 0
                     } else {
                         0
                     },a3,target_class))

  # number of times that target_class is '+' is true when a3 >= split_at.
  right_c1 <- sum(
               mapply(
                  function(x,y) 
                     if (x >= split_at) { 
                         if (y == '+') 1
                         else 0
                     } else {
                         0
                     },a3,target_class))

prob_c0_given_split = left_c0 / ( left_c0 + right_c0 )
prob_c1_given_split = left_c1 / ( left_c1 + right_c1 )

#for debugging:
#c(max(c(prob_c0_given_split, prob_c1_given_split)),left_c0,left_c1,right_c0,right_c1, prob_c0_given_split, prob_c1_given_split)

#for normal use
max(c(prob_c0_given_split, prob_c1_given_split))

}
