#' @title checkAssignment
#' 
#' @name checkAssignment
#' 
#' @description Check / mark a given assignment for errors.
#' 
#' @param assignment The assignment to mark / check. Can be a vector of multiple assignments.
#' @param file The path to the file with the suggested solution.
#' 
#' @details The function will check and correct the assignment. 
#' 
#' 
#' @example 
#' 
#' 
#' @export


checkAssignment <- function(assignments, filePath=file.choose(), ...){
  # Assertions
  stopifnot(file.exists(filePath), is.character(assignments))
    
  # Check to see the filenames at the githubRepo
  # Implement later

  # Check if it is possible to source the file 
  # and that the file contains the assignments to test
  redundant <- .sourceTest(path = filePath, assignments = assignments)
  
  # Saving the current workspace (temp)
  tempImage <- tempfile(pattern="image",fileext=".Rdata")
  save(list=ls(envir=.GlobalEnv), file=tempImage)

  # Clean global enviroment
  rm(list=ls(envir=.GlobalEnv), 
     envir=.GlobalEnv)
  
  # Read in the source file into source enviroment
  source(file = filePath, local = .GlobalEnv)
  
  # Test general tasks
  .testTask("general")
  
  # Choose actual object, move it to test enviroment
  for (assignment in assignments){
    cat("\n",assignment,"() :", sep = "")
    .testTask(task=assignment)
  }

  # Clean the global enviroment and load old enviroment
  rm(list=ls(envir=.GlobalEnv), envir=.GlobalEnv)
  load(file=tempImage, envir=.GlobalEnv)
  unlink(tempImage)
}



.sourceTest <- function(path, assignments){
  stopifnot(is.character(path), is.character(assignments))
  
  # Try to source the code
  res <- try(source(path,echo=FALSE,local=TRUE))
  if(class(res) == "try-error") stop("The file couln't be read without error.")

  # Check for objects
  if(!all(assignments %in% ls())) stop("The assignment(s) does not exist in the file.")
  
  # Warning - objects that are in the sourcefile but not an assignment
  redundantObjects <- ls()[which(!ls() %in% assignments)]
  if(length(redundantObjects)>0){
    warning(paste("The following objects were removed before checking:\n",
                  paste(redundantObjects, collapse=", "), sep=""), call.=FALSE)}
  
  return(redundantObjects)  
}



.testTask <- function(task){
  require(testthat)
  require(devtools)

  gitHubPath <- "https://raw.github.com/MansMeg/KursRprgm/master/Labs/Test/"
  cache <- FALSE # Should the files from GitHub be stored temporarily?  
  
  testFile <- tempfile(task, fileext=".R")
  download.file(url=paste(gitHubPath, task, "Test.R", sep=""), 
                destfile=testFile, method="curl", quiet=TRUE)
  testResult <- test_file(testFile)
  if(!cache) unlink(testFile)
}
