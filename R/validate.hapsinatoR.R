validate_hapsinatoR <- function(x) {
  if (!inherits(x, "hapsinatoR")) {
    stop("x must be class `hapsinatoR`")
  }
  return(x)
}
