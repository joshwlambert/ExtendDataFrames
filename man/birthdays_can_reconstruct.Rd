% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/subset-reconstruct.R
\name{birthdays_can_reconstruct}
\alias{birthdays_can_reconstruct}
\title{Checks whether the `<birthdays>` object is valid}
\usage{
birthdays_can_reconstruct(x)
}
\arguments{
\item{x}{A `data.frame` or subclass of `data.frame` (e.g. `tibble` or
`birthdays`)}
}
\value{
A boolean logical (`TRUE` or `FALSE`)
}
\description{
This is a wrapper for [`validate_birthdays] in a [`tryCatch()`]
in order to not error if the input object is invalid and returns `TRUE` or
`FALSE` on if the object is valid. If the object is valid it can be
"reconstructed" and not downgraded to a `data.frame`.
}
\keyword{internal}
