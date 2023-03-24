# nocov start
.onLoad <- function(libname, pkgname) {
  s3_register("dplyr::dplyr_reconstruct", "birthdays")
  invisible()
}
# nocov end
