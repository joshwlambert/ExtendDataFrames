#' Subset function for `<birthdays>` with downgrade-on-subsetting
#'
#' @description IF the subsetting invalidates the class then a `<data.frame>`
#' will be returned.
#'
#' @param x A `birthdays` object
#' @inheritParams base::subset
#'
#' @return Either a `birthdays` object or a `data.frame`
#' @export
`[.birthdays` <- function(x, ...) {
  out <- NextMethod()
  birthdays_reconstruct(out, x)
}

#' Set names on `<birthdays>` class
#'
#' @description If the modifying the names invalidates the `<birthdays>` object
#' the subsetting will return a data frame with the other attributes of the
#' class preserved.
#'
#' @inheritParams base::names
#'
#' @return An `<birthdays>` object or a `data.frame`
#' @export
`names<-.birthdays` <- function(x, value) {
  out <- NextMethod()
  birthdays_reconstruct(out, x)
}

#' Set accessor for `<birthdays>` class
#'
#' @param x An `birthdays` object
#' @inheritParams base::Extract
#'
#' @return An `birthdays` object or a `data.frame`
#' @export
`$<-.birthdays` <- function(x, name, value) { # nolint
  out <- NextMethod()
  birthdays_reconstruct(out, x)
}

#' Decides whether `<birthdays>` object can be reconstructed from input
#'
#' @description Uses [`birthdays_can_reconstruct()`] to determine whether the
#' data input can be reconstructed in a valid `<birthdays>` object. If it can
#' not, it is returned as a `data.frame`.
#'
#' @param x A `data.frame` or subclass of `data.frame` (e.g. `tibble` or
#' `birthdays`)
#' @param to The reference object, in this case an `birthdays` object
#'
#' @return An `birthdays` object (if the input is valid) or a `data.frame`
#' @keywords internal
birthdays_reconstruct <- function(x, to) {

  if (birthdays_can_reconstruct(x)) {
    df_reconstruct(x, to)
  } else {
    x <- as.data.frame(x)
    message("Removing crucial column in `<birthdays>` returning `<data.frame>`")
    x
  }
}

#' Checks whether the `<birthdays>` object is valid
#'
#' @description This is a wrapper for [`validate_birthdays] in a [`tryCatch()`]
#' in order to not error if the input object is invalid and returns `TRUE` or
#' `FALSE` on if the object is valid. If the object is valid it can be
#' "reconstructed" and not downgraded to a `data.frame`.
#'
#' @inheritParams birthdays_reconstruct
#'
#' @return A boolean logical (`TRUE` or `FALSE`)
#' @keywords internal
birthdays_can_reconstruct <- function(x) {

  # check whether input is valid, ignoring its class
  valid <- tryCatch(
    { validate_birthdays(x) },
    error = function(cnd) FALSE
  )

  # return boolean
  !isFALSE(valid)
}

#' Transplants the attributes of one input (`to`) to the other input (`x`)
#'
#' @inheritParams birthdays_reconstruct
#'
#' @return An `birthdays` object
#' @keywords internal
df_reconstruct <- function(x, to) {
  attrs <- attributes(to)
  attrs$names <- names(x)
  attrs$row.names <- .row_names_info(x, type = 0L)
  attributes(x) <- attrs
  x
}

# Registered in `.onLoad()` in zzz.R
dplyr_reconstruct.birthdays <- function(data, template) { # nolint
  birthdays_reconstruct(data, template)
}
