missclassrate <- function (split_at, left_c0, left_c1, right_c0, right_c1) {

  prob_c0_given_split = left_c0 / ( left_c0 + right_c0)

  prob_c1_given_split = left_c1 / ( left_c1 + right_c1)

  max(prob_c0_given_split, prob_c1_given_split)


}
