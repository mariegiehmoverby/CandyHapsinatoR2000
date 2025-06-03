#' @title Print method for hapsinatoR objects
#' @description Prints a summary of the hapsinatoR object.
#' @param x An object of class \code{hapsinatoR}.
#' @export
#' @method print hapsinatoR
print.hapsinatoR <- function(x) {
  x <- validate_hapsinatoR(x)
  cat("A hapsinatoR object\n")
  cat("Number of candies:", nrow(x$candyShelf), "\n")
  cat("Tile statuses:\n")
  print(table(x$candyShelf$status))

  grab_tiles <- subset(x$candyShelf, status == "GRAB")
  cat("Coordinates of candies to GRAB:\n")
  
  if (nrow(grab_tiles) == 0) {
    cat("None\n")
  } else {
    coords <- with(grab_tiles, paste0("(", x, ",", y, ")"))
    cat(coords, sep = "  ")
    cat("\n")
  }
}
