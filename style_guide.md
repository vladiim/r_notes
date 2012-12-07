[Google's R Style Guide](http://google-styleguide.googlecode.com/svn/trunk/google-r-style.html)
======================

R is a high-level programming language used primarily for statistical
computing and graphics. The goal of the R Programming Style Guide is to
make our R code easier to read, share, and verify. The rules below were
designed in collaboration with the entire R user community at Google.

Summary: R Style Rules

1.  [File Names](#filenames): end in `.R`
2.  [Identifiers](#identifiers): `variable.name`, `FunctionName`,
    `kConstantName`
3.  [Line Length](#linelength): maximum 80 characters
4.  [Indentation](#indentation): two spaces, no tabs
5.  [Spacing](#spacing)
6.  [Curly Braces](#curlybraces): first on same line, last on own line
7.  [Assignment](#assignment): use `<-`, not `=`
8.  [Semicolons](#semicolons): don't use them
9.  [General Layout and Ordering](#generallayout)
10. [Commenting Guidelines](#comments): all comments begin with `#`
    followed by a space; inline comments need two spaces before the `#`
11. [Function Definitions and Calls](#functiondefinition)
12. [Function Documentation](#functiondocumentation)
13. [Example Function](#examplefunction)
14. [TODO Style](#todo): `TODO(username)`

Summary: R Language Rules

1.  [`attach`](#attach): avoid using it
2.  [Functions](#functionlanguage): errors should be raised using
    `stop()`
3.  [Objects and Methods](#object): avoid S4 objects and methods when
    possible; never mix S3 and S4

\

Notation and Naming

File Names

File names should end in `.R` and, of course, be meaningful. \
 GOOD: `predict_ad_revenue.R` \
 BAD: `foo.R`

Identifiers

Don't use underscores ( `_` ) or hyphens ( `-` ) in identifiers.
Identifiers should be named according to the following conventions.
Variable names should have all lower case letters and words separated
with dots (`.`); function names have initial capital letters and no dots
(CapWords); constants are named like functions but with an initial `k`.

-   `variable.name ` \
     GOOD: `avg.clicks` \
     BAD: `avg_Clicks                 `, `avgClicks                 `
-   `FunctionName ` \
     GOOD: `CalculateAvgClicks` \
     BAD: `calculate_avg_clicks                 `, `calculateAvgClicks`
    \
     Make function names verbs. \
    *Exception: When creating a classed object, the function name
    (constructor) and class should match (e.g., lm).*
-   `kConstantName `

Syntax

-   Line Length
-   Indentation
-   Spacing
-   Curly Braces
-   Assignment
-   Semicolons

Organization

General Layout and Ordering

If everyone uses the same general ordering, we'll be able to read and
understand each other's scripts faster and more easily.

1.  Copyright statement comment
2.  Author comment
3.  File description comment, including purpose of program, inputs, and
    outputs
4.  `source()` and `library()` statements
5.  Function definitions
6.  Executed statements, if applicable (e.g., ` print`, `plot`)

Unit tests should go in a separate file named
`originalfilename_unittest.R`.

Commenting Guidelines

Comment your code. Entire commented lines should begin with `#` and one
space.

Short comments can be placed after code preceded by two spaces, `#`, and
then one space.

    # Create histogram of frequency of campaigns by pct budget spent.
    hist(df$pctSpent,
         breaks = "scott",  # method for choosing number of buckets
         main   = "Histogram: fraction budget spent by campaignid",
         xlab   = "Fraction of budget spent",
         ylab   = "Frequency (count of campaignids)")

Function Definitions and Calls

Function definitions should first list arguments without default values,
followed by those with default values.

In both function definitions and function calls, multiple arguments per
line are allowed; line breaks are only allowed between assignments. \
GOOD:

    PredictCTR <- function(query, property, numDays,
                           showPlot = TRUE)

BAD:

    PredictCTR <- function(query, property, numDays, showPlot =
                           TRUE)

Ideally, unit tests should serve as sample function calls (for shared
library routines).

Function Documentation

Functions should contain a comments section immediately below the
function definition line. These comments should consist of a
one-sentence description of the function; a list of the function's
arguments, denoted by `Args:`, with a description of each (including the
data type); and a description of the return value, denoted by
`Returns:`. The comments should be descriptive enough that a caller can
use the function without reading any of the function's code.

Example Function


    CalculateSampleCovariance <- function(x, y, verbose = TRUE) {
      # Computes the sample covariance between two vectors.
      #
      # Args:
      #   x: One of two vectors whose sample covariance is to be calculated.
      #   y: The other vector. x and y must have the same length, greater than one,
      #      with no missing values.
      #   verbose: If TRUE, prints sample covariance; if not, not. Default is TRUE.
      #
      # Returns:
      #   The sample covariance between x and y.
      n <- length(x)
      # Error handling
      if (n <= 1 || n != length(y)) {
        stop("Arguments x and y have invalid lengths: ",
             length(x), " and ", length(y), ".")
      }
      if (TRUE %in% is.na(x) || TRUE %in% is.na(y)) {
        stop(" Arguments x and y must not have missing values.")
      }
      covariance <- var(x, y)
      if (verbose)
        cat("Covariance = ", round(covariance, 4), ".\n", sep = "")
      return(covariance)
    }

TODO Style

Use a consistent style for TODOs throughout your code. \
`TODO(username): Explicit description of action to           be taken`

Language

-   Attach
-   Functions
-   Objects and Methods

Exceptions

The coding conventions described above should be followed, unless there
is good reason to do otherwise. Exceptions include legacy code and
modifying third-party code.

Parting Words

Use common sense and BE CONSISTENT.

If you are editing code, take a few minutes to look at the code around
you and determine its style. If others use spaces around their `if `
clauses, you should, too. If their comments have little boxes of stars
around them, make your comments have little boxes of stars around them,
too.

The point of having style guidelines is to have a common vocabulary of
coding so people can concentrate on *what* you are saying, rather than
on *how* you are saying it. We present global style rules here so people
know the vocabulary. But local style is also important. If code you add
to a file looks drastically different from the existing code around it,
the discontinuity will throw readers out of their rhythm when they go to
read it. Try to avoid this. OK, enough writing about writing code; the
code itself is much more interesting. Have fun!

References

[http://www.maths.lth.se/help/R/RCC/](http://www.maths.lth.se/help/R/RCC/)
- R Coding Conventions \
 [http://ess.r-project.org/](http://ess.r-project.org/) - For emacs
users. This runs R in your emacs and has an emacs mode.
