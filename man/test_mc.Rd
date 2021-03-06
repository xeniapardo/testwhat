% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/test-mc.R
\name{test_mc}
\alias{test_mc}
\title{Test a multiple choice exercise}
\usage{
test_mc(correct = NULL, result = get_sct_result(),
  no_selection_msg = NULL, feedback_msgs = NULL)
}
\arguments{
\item{correct}{number of the correct answer}

\item{result}{The result that is set by the DataCamp front-end when the student submits a multiple choice exercise.}

\item{no_selection_msg}{feedback message in case the student did not select an answer.}

\item{feedback_msgs}{vector of feedback messages for both the incorrect exercises as the correct exercise.
Order the messages according to how they are listed in the instructions. For example, if there are four options,
the second of which is correct, a vector of four feedback messages should be provided. The first message corresponds
to feedback on the incorrect selection of the first option, the second message corresponds to the feedback message for
the correct collection. The third and fourth messages correspond to feedback on the incorrect selection of the third and
fourth option.}
}
\description{
Test a multiple choice exercise using \code{\link{test_that}}. This code expects the DM.result variable
to be defined by the angular front-end of DataCamp. There is need to define the success_msg seperately,
since it is defined inside the function.
}

