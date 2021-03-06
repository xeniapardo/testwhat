% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/test-error.R
\name{test_error}
\alias{test_error}
\title{Check whether the output of the student code contained an error.}
\usage{
test_error(error = get_student_error(), incorrect_msg = NULL)
}
\arguments{
\item{error}{The error message if the output contained an error, NULL if there was no error}

\item{incorrect_msg}{feeback message in case the output contained an error}
}
\description{
Check whether the output of the student code contained an error, based on the DM.contains.error variable.
This function is implemented using \code{\link{test_that}}.
}
\examples{
\dontrun{
# add in SCT:
test_error()
}
}

