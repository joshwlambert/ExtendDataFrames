#' Constructor for creating a subclass of `<data.frame>` called `<birthdays>`
#'
#' @param x A `data.frame`
#'
#' @return An `birthdays` object
#' @export
#'
#' @examples
#' df = data.frame(
#'   name = c("kevin", "stacey"),
#'   birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
#' )
#' birthdays(df)
#'
#'
#' # generate large randomised `<birthdays>` objects
#'
#' df <- data.frame(
#'   name = randomNames::randomNames(10),
#'   birthday = sample(
#'     x = seq.Date(
#'       from = as.Date("2020-01-01"),
#'       to = as.Date("2022-01-01"),
#'       by = 1),
#'     size = 10
#'   )
#' )
#' birthdays <- birthdays(df)
birthdays <- function(x) {

  # check input can be used to create `<birthdays>` object
  stopifnot(
    "input must contain 'name' and 'birthday' columns" =
      all(c("name", "birthday") %in% colnames(x)),
    "names must be a character" =
      is.character(x$name),
    "birthday must be a date" =
      lubridate::is.Date(x$birthday)
  )

  # create `<birthday>` object
  # the vector of classes is required for it to inherit from `data.frame`
  out <- structure(x, class = c("birthdays", "data.frame"))

  validate_birthdays(out)

  return(out)
}

#' Class validator for `<birthdays>`
#'
#' @param x A `birthdays` object
#'
#' @return Returns input invisibly, using for validation side-effects.
#' @export
#'
#' @examples
#' df = data.frame(
#'   name = c("kevin", "stacey"),
#'   birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
#' )
#' birthdays <- birthdays(df)
#' validate_birthdays(birthdays)
validate_birthdays <- function(x) {

  # validate `<birthdays>` object
  stopifnot(
    "`birthdays` object must be of type `birthdays`" =
      identical(inherits(x, "birthdays", which = TRUE), 1L),
    "`birthdays` object should inherit from data.frames" =
      identical(inherits(x, "data.frame", which = TRUE), 2L),
    "input must contain 'name' and 'birthday' columns" =
      all(c("name", "birthday") %in% colnames(x)),
    "names must be a character" =
      is.character(x$name),
    "birthday must be a date" =
      lubridate::is.Date(x$birthday)
  )

  invisible(x)
}

#' Print method for `<birthdays>`
#'
#' @param x An `birthdays` object
#' @param ... Other arugments to be passed to `print()`
#'
#' @return Invisibly returns input, called for printing side-effects
#' @export
#'
#' @examples
#' df = data.frame(
#'   name = c("kevin", "stacey"),
#'   birthday = c(as.Date("2001-01-01"), as.Date("2002-01-02"))
#' )
#' birthdays <- birthdays(df)
#' print(birthdays)
print.birthdays <- function(x, ...) {
  cat(
    sprintf(
      "A `birthdays` object with %s rows and %s cols",
      dim(x)[1], dim(x)[2]
    )
  )
  invisible(x)
}
