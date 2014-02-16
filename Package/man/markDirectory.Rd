\name{markDirectory}
\alias{markDirectory}
\title{markDirectory}
\usage{
  markDirectory(assignments, dirPath, testFilesDir = NULL,
    sinkToDir = NULL)
}
\arguments{
  \item{assignments}{The assignment(s) to mark / check. Can
  be a vector of multiple assignments.}

  \item{dirPath}{The path to the directori}

  \item{testFilesDir}{a folder with test files (testfiles
  must end with 'Test.R')}

  \item{sinkToDir}{a folder where to sink student comments}
}
\description{
  Mark a whole directory with studentfiles. Mainly fo use
  by teachers.
}
\details{
  The function will mark the assignment given in
  \code{assignments}. As a first step all files are checked
  to see that the files are OK to source. If not all files
  are ok to source the function stops. If all files are OK
  to run the tests in assignemnets are marked based on the
  testfiles at GitHub.
}

