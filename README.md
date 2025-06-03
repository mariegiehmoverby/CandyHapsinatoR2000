
# CandyHapsinatoR2000

<!-- badges: start -->

[![R-CMD-check](https://github.com/mariegiehmoverby/CandyHapsinatoR2000/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/mariegiehmoverby/CandyHapsinatoR2000/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of CandyHapsinatoR2000 is to decide what candy to mix.

## Installation

You can install the development version of CandyHapsinatoR2000 from
[GitHub](https://github.com/mariegiehmoverby/CandyHapsinatoR2000) with:

``` r
# Install the package
devtools::install_github("mariegiehmoverby/CandyHapsinatoR2000")
```

## Vignette

You can find the vignette for CandyHapsinatoR2000
[here](https://github.com/mariegiehmoverby/CandyHapsinatoR2000/tree/master/vignettes)

``` r
vignette("CandyHapsinatoR2000")
#> Warning: vignette 'CandyHapsinatoR2000' not found
```

``` r
browseVignettes("CandyHapsinatoR2000")
#> No vignettes found by browseVignettes("CandyHapsinatoR2000")
```

## Example

This is a basic example which shows you can use the function

``` r
library(CandyHapsinatoR2000)
candy <- hapsinatoR(pricePer100g = 10, snollerMoney = 100, numRows = 8, numCols = 8, handfulSize = "large")
```

The input in `print()` must be a hapsinatoR object.

``` r
print(candy)
#> A hapsinatoR object
#> Number of candies: 64 
#> Tile statuses:
#> 
#> don't  GRAB 
#>    38    26 
#> Coordinates of candies to GRAB:
#> (3,1)  (4,1)  (7,1)  (1,2)  (2,2)  (3,2)  (5,2)  (7,2)  (8,2)  (1,3)  (2,3)  (2,4)  (4,4)  (6,4)  (4,5)  (5,5)  (7,5)  (2,6)  (3,6)  (4,6)  (5,6)  (6,6)  (2,7)  (3,7)  (3,8)  (7,8)
```

Summary of the hapsinatoR object will give you a summary of the candy
mix.

``` r
summary(candy)
#> =================================
#> Summary of hapsinatoR object
#> =================================
#> Number of different candies: 64 
#> Number of candies to GRAB: 32 
#> Total grams to mix: 1000 
#> Total grams mixed: 1006 
#> =================================
#> Candies to GRAB are at locations:
#> (3,1)  (4,1)  (7,1)  (1,2)  (2,2)  (3,2)  (5,2)  (7,2)  (8,2)  (1,3)  (2,3)  (2,4)  (4,4)  (6,4)  (4,5)  (5,5)  (7,5)  (2,6)  (3,6)  (4,6)  (5,6)  (6,6)  (2,7)  (3,7)  (3,8)  (7,8)
```

Plotting the hapsinatoR object will give you a visual representation of
what candy to mix.

``` r
plot(candy)
```

<img src="man/figures/README-example plot-1.png" width="100%" />
