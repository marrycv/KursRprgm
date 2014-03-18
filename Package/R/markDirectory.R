#' @title markDirectory
#' 
#' @name markDirectory
#' 
#' @description Mark a whole directory with studentfiles. Mainly fo use by teachers.
#' 
#' @param assignments The assignment(s) to mark / check. Can be a vector of multiple assignments.
#' @param dirPath The path to the directori
#' @param testFilesDir a folder with test files (testfiles must end with 'Test.R')
#' @param sinkToDir a folder where to sink student comments
#' 
#' @details The function will mark the assignment given in \code{assignments}. 
#' As a first step all files are checked to see that the files are OK to source. If
#' not all files are ok to source the function stops. If all files are OK to run the
#' tests in assignemnets are marked based on the testfiles at GitHub. 
#' 
#' @export


markDirectory <- function(assignments, dirPath, testFilesDir = NULL, sinkToDir = NULL, encoding = "latin1"){
  
  # Assertions
  stopifnot(file.exists(dirPath),
            is.null(sinkToDir) || file.exists(sinkToDir), 
            is.null(testFilesDir) || file.exists(testFilesDir))
  # Correct dirPath (add / as last letter if not added)
  if(!substr(dirPath,nchar(dirPath),nchar(dirPath))=="/") dirPath <- paste(dirPath,"/",sep="")
  
  # Check to see the filenames at the githubRepo
  .checkTestFiles(assignments)
  
  # Save Image and clean Global enviroment
  tempImage <- tempfile(pattern="image",fileext=".Rdata")
  save(list=ls(envir=.GlobalEnv), file=tempImage)
  # Clean global enviroment
  rm(list=ls(envir=.GlobalEnv), 
     envir=.GlobalEnv)
  
  # Get list of files to Mark
  filesToMark <- dir(dirPath)
  
  # Test to source files to check for errors
  errors <- FALSE 
  for (fileToMark in filesToMark){
    cat(fileToMark, sep="")
    res <- 
      try(expr=suppressWarnings(
        .sourceTest(path = paste(dirPath, fileToMark, sep=""), encoding = encoding,
                    assignments = c(assignments,"Namn", "LiuId"))), silent=TRUE)
    if(class(res)=="try-error") {
      message(res[1])
      errors <- TRUE
    } else {
      cat(" : OK\n")
    }
  }
  if(errors) {
    cat("\nCorrect errors before proceeding.\n")
    return(invisible(NULL))  
  }
  
  cat("\nAll files are OK. \nStarting tests:\n\n")

  # Test the functions fileToMark <- filesToMark[1]
  for (fileToMark in filesToMark){
    cat(fileToMark, "\n")
    rm(list=ls(envir=.GlobalEnv), 
       envir=.GlobalEnv)
    source(file = paste(dirPath, fileToMark, sep=""), local = .GlobalEnv, encoding=encoding)
    if(!is.null(sinkToDir)) sink(file=paste(sinkToDir, paste(LiuId,collapse="_"), ".txt", sep=""))    
    cat("Filename:",fileToMark,"\n")
    cat("Namn:", Namn,"\n")
    cat("LiuID:",LiuId,"\n")
    if(exists("GruppNr")) cat("Grupp:",GruppNr,"\n")
    # Test functions
    try(.testTask("general", cache=TRUE))
  
    # Choose actual object, move it to test enviroment
    for (assignment in assignments){
      cat("\n",assignment,"() :", sep = "")
      try(.testTask(task=assignment, cache=TRUE))
    }
    if(!is.null(sinkToDir)) sink()
  }

  # Clean the global enviroment and load old enviroment
  rm(list=ls(envir=.GlobalEnv), envir=.GlobalEnv)
  load(file=tempImage, envir=.GlobalEnv)
  unlink(tempImage)
}



