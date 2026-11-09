## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(missknn)

## -----------------------------------------------------------------------------
set.seed(1)
x <- data.frame(
  a = c(1, 2, NA, 4, 5),
  b = c(2, NA, 3, 4, 6),
  g = factor(c("x", "x", "y", NA, "y"))
)

missknn(x, k = 2)

## -----------------------------------------------------------------------------
imps <- missknn(x, k = 2, m = 5, seed = 1, parallel_cores = 1L)
class(imps)
length(imps)

## ----eval = FALSE-------------------------------------------------------------
# fits <- lapply(imps, function(d) lm(a ~ b + g, data = d))
# mimar::pool_lm(fits)

## -----------------------------------------------------------------------------
attr(missknn(x, k = 2), "tuning")

## ----eval = FALSE-------------------------------------------------------------
# missknn(
#   data,
#   k = 5L,                 # default neighbor count (tuned per column)
#   m = 1L,                 # 1 = single imputation, >1 = multiple imputation
#   scale = TRUE,            # standardize numeric variables before distances
#   weights = "distance",    # "distance" (inverse-distance) or "uniform"
#   numeric_estimator = "regression", # "regression" or "mean"
#   donor_cap = 2000L,       # cap on the neighbor-search candidate pool
#   add_indicator = FALSE,   # append missingness indicator columns
#   seed = NULL              # reproducible multiple imputation
# )

