#' Count number of birthdays per month in each year from a `<birthdays>` object
#'
#' @param x An `birthdays` object
#' @param ... Arguments to be passed on
#'
#' @return A `birthdays` object
#' @export
#'
#' @examples
#' df <- data.frame(
#'   name = c("kevin", "stacey"),
#'   birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
#' )
#' birthdays <- birthdays(df)
#' birthdays_per_month(birthdays)
birthdays_per_month <- function(x, ...) {
  UseMethod("birthdays_per_month")
}

#' @rdname birthdays_per_month
#' @export
birthdays_per_month.birthdays <- function(x, ...) {
  out <- table(lubridate::month(x$birthday))
  months <- c(
    "Jan", "Feb", "Mar", "Apr", "May", "Jun",
    "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
  )
  names(out) <- months[as.numeric(names(out))]
  return(out)
}
