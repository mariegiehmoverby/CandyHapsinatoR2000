#' @title Print method for hapsinatoR objects
#' @description Prints a summary of the hapsinatoR object.
#' @param x An object of class \code{hapsinatoR}.
#' @export
#' @method print hapsinatoR
print.hapsinatoR <- function(x, ...) {
  cat("A hapsinatoR object\n")
  cat("Number of candy tiles:", nrow(x$candyShelf), "\n")
  cat("Tile statuses:\n")
  print(table(x$candyShelf$status))

  grab_tiles <- subset(x$candyShelf, status == "GRAB")
  cat("Coordinates of GRAB tiles:\n")
  
  if (nrow(grab_tiles) == 0) {
    cat("None\n")
  } else {
    coords <- with(grab_tiles, paste0("(", x, ",", y, ")"))
    cat(coords, sep = "  ")
    cat("\n")
  }
}
