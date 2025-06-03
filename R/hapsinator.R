
#' @title CandyHapsinator
#' @description \code{hapsinatoR} is used to randomly select candies from a bland-selv-slik rack
#' @param pricePer100g number denoting the price of 100g of candy
#' @param snollerMoney number denoting the money to spend on candy 
#' @param numRows integer denoting the number of rows in the candy shelf
#' @param numCols integer denoting the number of columns in the candy shelf
#' @param handfulSize factor denoting handful size (small, medium or large) 
#' @return 
#' \code{hapsinatoR} returns an object of \code{\link{class}} \code{"hapsinatoR"}, which is a list containing the following components:
#' \describe{
#'  \item{\code{candyShelf}}{(x,y) coordinates with positions to grab candy}
#'  \item{\code{numHaps}}{Number of candy hapsers to make}
#'  \item{\code{gramsToMix}}{Number denoting the amount of candy (in grams) you aim to mix}
#'  \item{\code{uniqueCandies}}{Number of unique pieces of candy}
#'  \item{\code{hapsSizes}}{Vector of length \code{numHaps} denoting the sizes of each haps}
#' }
#' @details 
#' \code{handfulSize} has three possible arguments:
#' \describe{
#'  \item{"small"}{\code{handfulSize} is normally distributed with mean 17 and sd = 3}
#'  \item{"medium"}{\code{handfulSize} is normally distributed with mean 24 and sd = 3}
#'  \item{"large"}{\code{handfulSize} is normally distributed with mean 31 and sd = 3}
#' }
#' @examples 
#' ## Mix candy for 94kr with a price of 12kr/100g, 5 rows and 12 columns of candy, small handful size.
#' hapsinatoR(12, 94, 5, 12, "small")

#' @importFrom dplyr %>% mutate
#' @importFrom stats rnorm runif
#' @export 
hapsinatoR <- function(pricePer100g = NULL, 
                       snollerMoney = NULL, 
                       numRows = NULL, 
                       numCols = NULL, 
                       handfulSize = c("medium", "small", "large")) {
    if (is.null(pricePer100g)) {
    pricePer100g <- 16  # Default value if not provided
  } else if (!is.numeric(pricePer100g)) {
    stop("Argument 'pricePer100g' must be numeric.")
  }
    if (is.null(snollerMoney)) {
    snollerMoney <- 69  # Default value if not provided
  } else if (!is.numeric(snollerMoney)) {
    stop("Argument 'snollerMoney' must be numeric.")
  }
    if (is.null(numRows)) {
    numRows <- 5  # Default value if not provided
  } else if (!is.numeric(numRows)) {
    stop("Argument 'numRows' must be numeric.")
  }
    if (is.null(numCols)) {
    numCols <- 8  # Default value if not provided
  } else if (!is.numeric(numCols)) {
    stop("Argument 'numCols' must be numeric.")
  }

    gramsToMix <- (snollerMoney / pricePer100g) * 100
    
    handfulSize <- match.arg(handfulSize)
    if (handfulSize == "medium") {
        numHaps <- round(gramsToMix / 24)
        hapsSizes <- stats::rnorm(numHaps, mean = 24, sd = 3)
    }
    if (handfulSize == "small") {
        numHaps <- round(gramsToMix / 17)
        hapsSizes <- stats::rnorm(numHaps, mean = 17, sd = 3)
    }
    if (handfulSize == "large") {
        numHaps <- round(gramsToMix / 31)
        hapsSizes <- stats::rnorm(numHaps, mean = 31, sd = 3)

    }

    rows <- round(stats::runif(numHaps, min = 1, max = numRows))
    cols <- round(stats::runif(numHaps, min = 1, max = numCols))

    chosenCandies <- data.frame(
        x = rows,
        y = cols
    )

    uniqueCandies <- numCols * numRows

    candyShelf <- expand.grid(x = 1:numRows, y = 1:numCols)

    candyShelf <- candyShelf %>%
      dplyr::mutate(
        status = ifelse(paste(x, y) %in% paste(chosenCandies$x, chosenCandies$y), "GRAB", "don't")
      )

  output <- list(candyShelf = candyShelf, numHaps = numHaps, gramsToMix = gramsToMix, uniqueCandies = uniqueCandies, hapsSizes = hapsSizes)
  class(output) = "hapsinatoR"

    return(output)
}





