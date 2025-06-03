#' @title Plot a hapsinatoR object
#' @description Creates a tile plot of the candy shelf using ggplot2.
#' @param x An object of class \code{hapsinatoR}, typically returned by \code{hapsinatoR()}.
#' @return A ggplot2 object.
#' @export
#' @import ggplot2
#' @method plot hapsinatoR
plot.hapsinatoR <- function(x) {
  x <- validate_hapsinatoR(x)
  ggplot2::ggplot(x$candyShelf, aes(x = y, y = x, fill = status)) +
    ggplot2::geom_tile(color = "white") +
    ggplot2::scale_fill_manual(values = c("GRAB" = "#fff700", "don't" = "#a89a9a93")) +
    ggplot2::coord_fixed() +
    ggplot2::theme_minimal()
}
