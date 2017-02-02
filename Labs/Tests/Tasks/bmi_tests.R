### Assignment : bmi() ###
context("bmi()")

test_that("Assignment: bmi()", {
  
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
  
  
  expect_true(exists("bmi"),
              info = "Fel: bmi() saknas.")
  expect_true(is.function(bmi),
              info = "Fel: bmi är inte en funktion.")
  expect_function_self_contained(object = bmi,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_true(test_object_name(target = bmi,true_names = c("body_weight","body_height")),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_true(is.numeric(bmi(body_weight = 71, body_height = 1.78)),
              info = "Fel: Funktionen returnerar inte ett numeriskt värde.")
  
  expect_equal(bmi(body_weight = 71, body_height = 1.78), 22.40879, tolerance = .001,
               info = "Fel: Fungerar inte för body_weight > 0 och body_height > 0")
  
  expect_equal(bmi(body_weight = 93, body_height = 1.88), 26.31281, tolerance = .001,
               info = "Fel: Fungerar inte för body_weight > 0 och body_height > 0")
  
  expect_warning(bmi(body_weight = 0, body_height = 1.78),
               info = "Fel: Genererar inget varningsmeddelande (då body_weight <= 0)")
  
  expect_warning(bmi(body_weight = -3, body_height = 1.78), "body_weight is not positive, calculation is not meaningful",
                 info = "Fel: Genererar fel varningsmeddelande (då body_weight <= 0)")
  
  expect_warning(bmi(body_weight = 71, body_height = 0),
                 info = "Fel: Genererar inget varningsmeddelande (då body_height <= 0)")
  expect_warning(bmi(body_weight = 71, body_height = -2), "body_height is not positive, calculation is not meaningful",
                 info = "Fel: Genererar fel varningsmeddelande (då body_height <= 0)")

  expect_warning(bmi(body_weight = -1, body_height = 0), 
                 info = "Fel: Genererar inte varningsmeddelande (då body_weight <= 0 och body_height<=0)")

# fix the test below to test for two warnings!
#   expect_warning(bmi(body_weight = 0, body_height = -2), "body_height is not positive",
#                  info = "Fel: Genererar fel varningsmeddelande (då body_weight <= 0)")   
#   
  
#   expect_warning(bmi(body_weight = -1, body_height = 0), "body_weight is not positive",
#                  info = "Fel: Genererar fel varningsmeddelande (då body_weight <= 0)")  
#   expect_warning(bmi(body_weight = 0, body_height = -2), "body_height is not positive",
#                  info = "Fel: Genererar fel varningsmeddelande (då body_weight <= 0)")  
  
  
  expect_function_code(object = bmi, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")  
})
