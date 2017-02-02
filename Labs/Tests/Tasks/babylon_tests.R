### Assignment : babylon() ###
context("babylon()")

test_that("Assignment: babylon()", {
  
  
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
  
    
  # börja här!!!!  
  expect_true(exists("babylon"),
              info = "Fel: babylon() saknas.")
  
  expect_true(is.function(babylon),
              info = "Fel: babylon är inte en funktion.")
  
  expect_function_self_contained(object = babylon,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_true(test_object_name(target = babylon,true_names =  c("x", "init", "tol")),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_true(is.list(babylon(x=2, init=1.5, tol=0.01)),
              info = "Fel: Funktionen returnerar inte en lista.")
  
  temp_list<-babylon(x=2, init=1.5, tol=0.01)
  expect_true(test_object_name(target = temp_list,true_names = c("iter", "rot")),
              info = "Fel: Funktionen returnerar inte en lista med rätt namngivna element.")
  
  expect_equal(babylon(x=2, init=1.5, tol=0.01)$rot, 1.414216, tolerance = .01,
              info = "Fel: Approximationen är felaktig för x = 2, init = 1.5 och tol = 0.01.")
  
  expect_equal(babylon(x=2, init=1.5, tol=0.01)$iter, 2,
               info = "Fel: Antalet iterationer är felaktig för x = 2, init = 1.5 och tol = 0.01.")  
  
  test_exact<-babylon(x=2, init=1.5, tol=0.01)$rot == sqrt(2)
  if(length(test_exact)==1){
    expect_false(test_exact,
                 info = "Fel: Ingen approximation gjorde, utan det exakta värdet används.") 
  }
  
  expect_equal(babylon(x=15, init=1.5, tol=0.01)$rot, 3.872, tolerance = .01,
               info = "Fel: Approximationen är felaktig för x = 15, init = 1.5 och tol = 0.01.")
  
  expect_equal(babylon(x=15, init=1.5, tol=0.01)$iter, 5,
               info = "Fel: Antalet iterationer är felaktig för x = 15, init = 1.5 och tol = 0.01.")
  
  expect_equal(babylon(x=15, init=0.1, tol=0.01)$rot, 3.872, tolerance = .01,
               info = "Fel: Approximationen är felaktig för x = 15, init = 1.5 och tol = 0.01.")
  
  expect_equal(babylon(x=15, init=0.1, tol=0.01)$iter, 9,
               info = "Fel: Antalet iterationer är felaktig för x = 15, init = 1.5 och tol = 0.01.")  
  
  expect_function_code(object = babylon, expected = "return\\(", 
                       info = "Fel: return() saknas i funktionen.")
  
  
  expect_false(body_contain(object = babylon,expected = "sqrt"), "Fel: Funktionen sqrt() används i funktionen.")
})

