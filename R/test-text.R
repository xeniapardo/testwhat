#' Test inline text and its formatting (R Markdown exercises)
#'
#' Test inline text and its formatting (R Markdown exercises)
#'
#' This test is implemented using \code{\link{test_that}}. 
#' This test can only be called inside a test_rmd_group() call!
#'
#' @param text  Text to match (can be a regular expression!)
#' @param format  the format of the text that the text should be in ("any", "italics", "bold", "code", "inline_code", "brackets", "parentheses", "list"). 
#' If none of the above, the format string is appended to text in front and in the back and used as a regexp.
#' @param freq How often the text should appear with this formatting
#' @param inline_number number of the inline number that is being tested
#' @param student_inline  character string containing the student's inline text.
#' @param solution_inline  character string containing the solution's inline text.
#' @param not_called_msg feedback message if the text was not there
#' @param incorrect_msg  feedback message if the text was not properly formatted
#'
#' @import datacampAPI
#' @export
test_text <- function(text,
                      format = "any",
                      freq = 1,
                      inline_number = get_inline_number(),
                      student_inline = get_student_ds_part(),
                      solution_inline = get_solution_ds_part(),
                      not_called_msg = NULL,
                      incorrect_msg = NULL) {
  
  test_that(sprintf("In inline group %i are set correctly", inline_number), {
    
    # First, check if both student and solution chunk are 'inline' class
    if(class(solution_inline) != "inline") {
      stop("The specified rmd group is not of 'inline' class.")
    }
    expect_that(class(student_inline), equals("inline"), failure_msg = "The student rmd group is not inline!")
          
    
    # Set up default messages
    # message if text was not found
    if(is.null(not_called_msg)) {
      not_called_msg = sprintf("Inline group %i of your submission should contain the text \"%s\".", 
                               inline_number, text)
    }
    
    # message if the properties or not found or set incorrectly
    if(is.null(incorrect_msg)) {
      incorrect_msg = sprintf("In inline group %i of your submission, make sure to correctly format the text \"%s\".",
                              inline_number, text)
    }
    
    # first, check if text is found in student_inline
    hits = gregexpr(pattern = text, student_inline$input)[[1]]
    expect_that(hits[1] == -1, is_false(), failure_msg = not_called_msg)
    expect_that(length(hits) >= freq, is_true(), failure_msg = not_called_msg)
    
    if(hits[1] == -1 || length(hits) < freq) {
      return(FALSE)
    }

    patt <- text;
    for(i in seq_along(format)) {
      if(format[i] == "any") return(TRUE)
      else if(format[i] == "italics") patt <- paste0("((\\*",patt,"\\*)|(_",patt,"_))")
      else if(format[i] == "bold") patt <- paste0("((\\*{2}",patt,"\\*{2})|(_{2}",patt,"_{2}))")
      else if(format[i] == "code") patt <- paste0("`",patt,"`")
      else if(format[i] == "inline_code") patt <- paste0("`r\\s*",patt,"`")
      else if(format[i] == "brackets") patt <- paste0("\\[",patt,"\\]")
      else if(format[i] == "parentheses") patt <- paste0("\\(",patt,"\\)")
      else if(format[i] == "list") patt <- paste0("[-\\*]\\s*",patt)
      else patt <- paste0(format[i],patt,format[i])
    }

    hits = gregexpr(pattern = patt, student_inline$input)[[1]]
    expect_that(hits[1] == -1, is_false(), failure_msg = incorrect_msg)
    expect_that(length(hits) >= freq, is_true(), failure_msg = not_called_msg)
    
  })
}
