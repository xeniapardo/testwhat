% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/expect-that.r
\name{expect_that}
\alias{expect_that}
\title{Expect that a condition holds.}
\usage{
expect_that(object, condition, info = NULL, label = NULL,
  failure_msg = NULL, success_msg = NULL)
}
\arguments{
\item{object}{object to test}

\item{condition}{a function that returns whether or not the condition
is met, and if not, an error message to display.}

\item{info}{extra information to be included in the feedback message
(useful when writing tests in loops).}

\item{label}{object label used in the default feedback message.  If
\code{NULL}, it is computed from deparsed object.  This is ignored for
feedback messages supplied via \code{failure_msg} or \code{success_msg}.}

\item{failure_msg}{feedback message in case of a failed test.}

\item{success_msg}{feedback message in case of a successful test.}
}
\value{
The (internal) expectation result as an invisible list.
}
\description{
An expectation checks whether a single condition holds true.
}
\details{
\pkg{testwhat} currently provides the following expectations.  See their
documentation for more details.

\itemize{
 \item \code{\link{is_defined}}: an object is defined
 \item \code{\link{is_true}}: truth
 \item \code{\link{is_false}}: falsehood
 \item \code{\link{is_a}}: inheritance
 \item \code{\link{equals}}: equality with numerical tolerance
 \item \code{\link{is_equivalent_to}}: equality ignoring attributes
 \item \code{\link{is_identical_to}}: exact identity
 \item \code{\link{matches}}: string matching
 \item \code{\link{prints_text}}: output matching
 \item \code{\link{throws_error}}: error matching
 \item \code{\link{gives_warning}}: warning matching
 \item \code{\link{shows_message}}: message matching
 \item \code{\link{takes_less_than}}: performance
}

Expectations are arranged into tests with \code{\link{test_that}} and
tests are arranged into contexts with \code{\link{context}}.
}
\examples{
expect_that(5 * 2, equals(10))
expect_that(sqrt(2) ^ 2, equals(2))
\dontrun{
expect_that(sqrt(2) ^ 2, is_identical_to(2))
}
}
\seealso{
\code{\link{fail}} for an expectation that always fails.
}

