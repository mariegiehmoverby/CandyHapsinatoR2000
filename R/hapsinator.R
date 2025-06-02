
#' @title CandyHapsinator
#' @param pricePer100g price of 100g of candy
#' @param snollerMoney money to spend on candy
#' @param numRows number of rows in the candy shelf
#' @param numCols number of columns in the candy shelf
#' @param handfulSize handful size (small, medium or large)
#' @return An object of class \sQuote{hapsinatoR}.
#' An object of \code{\link{class}} \code{"hapsinatoR"} is a list containing the following components

#' @importFrom dplyr %>% mutate
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
        hapsSizes <- rnorm(numHaps, mean = 24, sd = 3)
    }
    if (handfulSize == "small") {
        numHaps <- round(gramsToMix / 17)
        hapsSizes <- rnorm(numHaps, mean = 17, sd = 3)
    }
    if (handfulSize == "large") {
        numHaps <- round(gramsToMix / 31)
        hapsSizes <- rnorm(numHaps, mean = 31, sd = 3)

    }

    rows <- round(runif(numHaps, min = 1, max = numRows))
    cols <- round(runif(numHaps, min = 1, max = numCols))

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


# # count times highlighted
# hapsinatoR(snollerMoney = 200) %>% dplyr::count(x, y, name = "times_highlighted")



