#' @title Summary method for hapsinatoR objects
#' @description Prints a concise summary of a \code{hapsinatoR} object, including the number of selected candies (haps),
#' total weight to mix, number of unique tiles, and their coordinates.
#' @param object An object of class \code{hapsinatoR}, typically created by the \code{hapsinatoR()} function.
#' @param ... Additional arguments (currently unused).
#' @return Returns a summary on the output from the hapsinatoR object
#' @export
#' @method summary hapsinatoR 
summary.hapsinatoR <- function(object, ...) {
  cat("=================================\n")
  cat("Summary of hapsinatoR object\n")
  cat("=================================\n")
  
  cat("Number of different candies:", object$uniqueCandies, "\n")
  cat("Number of candies to GRAB:", object$numHaps, "\n")
  cat("Total grams to mix:", round(object$gramsToMix), "\n")
  cat("Total grams mixed:", round(sum(object$hapsSizes)), "\n")
  
  cat("=================================\n")
  cat("Candies to GRAB are at locations:\n")
  grab_tiles <- subset(object$candyShelf, status == "GRAB")
  
  if (nrow(grab_tiles) == 0) {
    cat("None\n")
  } else {
    coords <- with(grab_tiles, paste0("(", x, ",", y, ")"))
    cat(coords, sep = "  ")
    cat("\n")
  }
}

