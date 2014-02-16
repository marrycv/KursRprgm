#' @title markAssignment
#' 
#' @name markAssignment
#' 
#' @description Check / mark given assignment(s) for errors.
#' 
#' @param assignments The assignment(s) to mark / check. Can be a vector of multiple assignments.
#' @param filePath The path to the file with the suggested solution.
#' 
#' @details The function will mark the assignment given in  
#' 
#' @export


markAssignment <- function(assignments, filePath=file.choose()){
  # Assertions
  stopifnot(file.exists(filePath), is.character(assignments))
    
  # Check to see the filenames at the githubRepo
  .checkTestFiles(assignments)

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
  res <- try(source(path, echo=FALSE, local=TRUE, encoding="latin1"))
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



.testTask <- function(task, testfolder = NULL, cache = FALSE){

  if(is.null(testfolder)){
    gitHubPath <- "https://raw.github.com/MansMeg/KursRprgm/master/Labs/Test/"
    cachedFile <- dir(tempdir())[which(grepl(paste("Test",toupper(task),sep=""), dir(tempdir())))]
    if(length(cachedFile) == 1 & cache){
      testFile <- paste(tempdir(), "/", cachedFile, sep="")
    } else {
      testFile <- tempfile(pattern=paste("Test",toupper(task),sep=""), fileext=".R")
      download.file(url=paste(gitHubPath, task, "Test.R", sep=""), 
                    destfile=testFile, method="curl", quiet=TRUE)
    }
  } else {
    testFile <- paste(testfolder, "/", task, "Test.R", sep = "")
  }
  
  testResult <- test_file(testFile)
  
  if(!cache & is.null(testfolder)) unlink(testFile)
}


.checkTestFiles <- function(assignments, testfolder = NULL){

  # Download content of testfolder if needed
  if (is.null(testfolder)){
    tempFileNo <- which(grepl(pattern="myTestFolderContent", x=dir(tempdir())))
    if(length(tempFileNo) == 0){
      tempFile <- tempfile("myTestFolderContent")
      testFolder <- 
        GET("https://api.github.com/repos/MansMeg/KursRprgm/contents/Labs/Test/", 
            user_agent("LabTests"))
      tests <- unlist(lapply(X=content(testFolder), FUN=function(X) X$name))
      tests <- unlist(strsplit(tests,split="Test.R"))
      save(tests,file=tempFile)
    } else {
      load(file=paste(tempdir(), dir(tempdir())[tempFileNo], sep="/"))
    }
  } else {
    tests <- unlist(strsplit(dir(testfolder), split="Test.R"))
  }
  
  # Stop if assignments don't exist
  missing <- which(!(assignments %in% tests))
  if(length(missing) != 0) {
    stop (paste("The following assignments do not exist:", 
                paste(assignments[missing], collapse=", ")),
          call.=FALSE)
  }
  return(invisible(NULL))
}

# testfolder <- "/Users/manma97/Dropbox/Doktorandstudier/Undervisning/Statistisk programmering i R/RCourse2014/KursRprgm/Labs/Test"