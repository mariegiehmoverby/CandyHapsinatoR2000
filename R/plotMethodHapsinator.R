
#' plot hapsinator
#' @param candyShelf 
#' 
#' @import ggplot2
#' @export
#' @return print(pricePer100g)
#' 
plot_highlighted_grid <- function(candyShelf) {
  ggplot2::ggplot(candyShelf, aes(x = y, y = x, fill = status)) +
    geom_tile(color = "white") +
    scale_fill_manual(values = c("GRAB" = "#fff700", "don't" = "#a89a9a93")) +
    coord_fixed() +
    theme_minimal()
}


# plot_highlighted_grid(hapsinator(snollerMoney = 104, handfulSize = "small"))


