library(Rcpp)
library(bench)
# WHAT is our goal?
# We want to create the %in% infix operator in C

infixR <- function(haystack, needle) {
  haystack[haystack %in% needle]
}
Rcpp::sourceCpp("test.cpp")

x <- rep(sample(letters), 1000)
search <- c("x", "c")

bench::mark(
  infixR(x, search),
  infixC(x, search)
)
