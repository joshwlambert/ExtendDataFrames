# This function is commented out and the `[.birthdays` function from
# subset-reconstruct is exported with the package. This function is to
# demonstrate the concept of subsetting with errors on invalidation. If you
# would like to use this instead of the subset function from
# subset-reconstruction, remove the comments from this function, comment out
# the subset function from subset-reconstruction and reload the package.

#' #' Subset function with fail-on-subsetting
#' #'
#' #' @param x A `birthdays` object
#' #' @param ... base::subset
#' #'
#' #' @return Subset of `birthdays` class
#' #' @export
#' #'
#' #' @examples stub
#' `[.birthdays` <- function(x) {
#'   validate_birthdays(NextMethod())
#' }
