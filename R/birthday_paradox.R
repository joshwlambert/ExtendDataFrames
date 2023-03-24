#' Calculates any matching birthdays in the data and the probability of having a
#' matching birthday (i.e. birthday paradox)
#'
#' @param x A `birthdays` object
#' @param ... Arguments to be passed to methods
#'
#' @return A named numeric vector with two elements
#' @export
#'
#' @examples
#' df <- data.frame(
#'   name = c("kevin", "stacey"),
#'   birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
#' )
#' birthdays <- birthdays(df)
#' birthday_paradox(birthdays)
birthday_paradox <- function(x, ...) {
  UseMethod("birthday_paradox")
}

#' @rdname birthday_paradox
#' @export
birthday_paradox.birthdays <- function(x, ...) {
  num_coincidence <- anyDuplicated(x$birthday)
  prob_coincindence <- stats::pbirthday(
    n = nrow(x),
    classes = 365,
    coincident = 2
  )

  return(
    c(
      "num_coincidence" = num_coincidence,
      "prob_coincindence" = prob_coincindence
    )
  )
}
