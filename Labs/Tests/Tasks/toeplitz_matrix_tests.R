
context("toeplitz_matrix()")

test_that("toeplitz_matrix()", {  
  test_object_name<-function(target,true_names=NULL){
    if(is.function(target)){
      temp_name<-names(formals(target))
    }else if(is.list(target)){
      temp_name<-names(target)
    }else{
      stop("target has non valid class!")
    }
    
    if(is.null(true_names)){
      if(is.null(temp_name)){
        return(TRUE)
      }else{
        return(FALSE)
      }
    }else if(is.character(true_names)&length(true_names)>=1){
      no_names<-length(true_names)
      no_match<-vector("logical",no_names)
      if(length(temp_name)!=length(true_names)){
        return(FALSE)
      }
      for(i in 1:no_names){
        no_match[i]<-any(temp_name%in%true_names[i])
      }
      return(all(no_match))
    }else{
      stop("true_names has non valid class!") 
    } 
  }
  body_contain<-function(object,expected) {any(grepl(x = as.character(body(object)), pattern = expected))}
  package_loaded<-function(object){any(grepl(object, search()))}
  
  
  
  
  test1<-matrix(c(1,4,5,2,1,4,3,2,1),3,3)
  test2<-matrix(c("a","c","b","a"),2,2)
  test3<-matrix(c(11,22,33,44,22,11,22,33,33,22,11,22,44,33,22,11),4,4)

  expect_that(exists("toeplitz_matrix"), is_true(),
              info = "Fel: toeplitz_matrix() saknas.")
  expect_that(toeplitz_matrix, is_a("function"),
              info = "Fel: toeplitz_matrix är inte en funktion.")
  expect_self_contained(object = toeplitz_matrix,
                        "Fel: Funktionen innehåller fria variabler")
  expect_that(all(names(formals(toeplitz_matrix)) %in% c("x")), condition=is_true(),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  expect_that(class(toeplitz_matrix(1:3)), 
              is_equivalent_to("matrix"),
              info="Fel: Funktionen returnerar inte en matrix")
  expect_equal(dim(toeplitz_matrix(1:5)), c(3,3),
               info="Fel: Funktionen returnerar en matrix med fel dimension")
  
  expect_equal(dim(toeplitz_matrix(1)), c(1,1),
               info="Fel: Funktionen returnerar en matrix med fel dimension för toeplitz_matrix(1)")
  expect_equal(toeplitz_matrix(1:9)[3:4,5], c(3,2),
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(1:9)")
  expect_equal(toeplitz_matrix(1:11)[6,6], c(1),
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(1:11)")
  expect_equal(toeplitz_matrix(1:11)[1,6], c(6),
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(1:11)")
  expect_equal(toeplitz_matrix(1:11)[6,1], c(11),
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(1:11)")
  
  expect_equal(toeplitz_matrix(1:5), test1,
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(1:5)")
  expect_equal(toeplitz_matrix(c("a","b","c")), test2,
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(c(\"a\",\"b\",\"c\"))")
  expect_equal(toeplitz_matrix(c(11,22,33,44,22,33,44)), test3,
               info="Fel: Funktionen returnerar en felaktig matris med toeplitz_matrix(c(11,22,33,44,22,33,44))")
  
  
  
  expect_error(toeplitz_matrix(1:4),
               info="Fel: Funktionen avbryter/stoppar inte om x har jämt antal element.")
  expect_error(toeplitz_matrix(1:4),"x not of odd length.",
               info="Fel: Funktionen ger inte rätt felmeddlende när x har jämt antal element.")
  expect_function_code(object = toeplitz_matrix, expected = "return", 
                       info = "Fel: return() saknas i funktionen.") 
  
  # testa så att inte toeplitz() (base) och toeplitz.spam() eller toeplitz {ts} används!
  
  # lägg till test för return()!
  
})