# S3

library(sloop)

f <- factor(c("a", "b", "c"))
typeof(f)
attributes(f)


tracemem(b <- matrix(0L, 1000, 1000))
b[1, 1] <- 1L
b[1, 2] <- 2L
b[2, 4] <- 3L

ref(b)

tracemem(x <- 1:10)
x[5] <- 10
x[3] <- 12
??refs()
library(lobstr)
ref(x)


library(R6)
SpeedMatrix <- R6Class("SpeedMatrix", list(
  matrix = NULL,
  initialize = function(d1, d2) {
    self$matrix <- matrix(0L, d1, d2)
  }
))

x <- SpeedMatrix$new(1000, 1000)
tracemem(x$matrix)
x$matrix[1, 1] <- 1L
x$matrix[1, 1] <- 1L


R6Matrix <- R6Class("R6Matrix", list(
  matrix = NULL,
  initialize = function(d1, d2) {
    self$matrix <- matrix(0L, d1, d2)
  },
  edit = function(x, y, v) {
    self$matrix[x, y] <- v
  }
))
x <- R6Matrix$new(1000, 1000)
obj_size(x)
tracemem(x$matrix)
x$edit(1, 2, 3L)
obj_size(x)
x$matrix[1, 1] <- 100L
