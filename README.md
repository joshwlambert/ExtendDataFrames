
# ExtendDataFrames

<!-- badges: start -->
[![License:MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![R-CMD-check](https://github.com/joshwlambert/ExtendDataFrames/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/joshwlambert/ExtendDataFrames/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/joshwlambert/ExtendDataFrames/branch/main/graph/badge.svg)](https://app.codecov.io/gh/joshwlambert/ExtendDataFrames?branch=main)
<!-- badges: end -->

The goal of ExtendDataFrames is to demonstrate how to extend the data frames
class in R in order to make a bespoke tabular data structure.

The package contains a toy class, a set of class generics and methods, and
two ways of subsetting the custom class. The class is a subclass of a data 
frame. All of the code is meant for illustrative and explanatory purposes. 

The package has two vignettes: the first a general guide to the package, the 
second is a longer-form post around the technical and functional aspects of 
programming with data frame subclasses.

## Installation

You can install the development version of ExtendDataFrames from [GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("joshwlambert/ExtendDataFrames")
```

