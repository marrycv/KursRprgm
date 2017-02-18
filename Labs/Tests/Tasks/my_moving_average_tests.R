### Assignment : my_moving_average() ###

context("my_moving_average()")

test_that("Assignment: my_moving_average()", {
  
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
  package_loaded_function<-function(func,par,pack){
    temp<-do.call(func,par)
    res<-package_loaded(pack)
    return(res)
  }
  
  x <- 1:3
  y <- c(1, 5, 6, 7, 7, 1, -2)
  y_res_n2 <- c(3.0, 5.5, 6.5, 7.0, 4.0, -0.5) 

  expect_true(exists("my_moving_average"),
              info = "Fel: my_moving_average() saknas.")  
  expect_true(is.function(my_moving_average),
              info = "Fel: my_moving_average är inte en funktion.")
  expect_function_self_contained(object = my_moving_average,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_true(test_object_name(target = my_moving_average,true_names = c("x","n")),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_true(is.numeric(my_moving_average(x=y, n=2)),
              info = "Fel: Funktionen returnerar inte en numerisk vector.")
  
  expect_true(all(my_moving_average(x=y, n=2) == y_res_n2),
              info = "Fel: Funktionen returnerar fel om x = c(1,5,6,7,7,1,-2), n=2. Returen ska vara c(3.0, 5.5, 6.5, 7.0, 4.0, -0.5)")
  
  expect_error(my_moving_average(x="Pelle", n=3),
               info = "Fel: Funktionenen stoppar inte om x är icke numerisk.")  
  expect_error(my_moving_average(x=FALSE, n=5), "Not a numeric vector!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande.")
  
  expect_equal(my_moving_average(x = 5:15,n = 4), c( 6.5 , 7.5,  8.5 , 9.5 ,10.5, 11.5, 12.5, 13.5),
               info="Fel: Funktionen returnerar fel om x=5:15 och n=4")
   
  expect_equal(my_moving_average(x = 1:10,n = 2), c( 1.5, 2.5, 3.5, 4.5, 5.5, 6.5, 7.5, 8.5,9.5),
               info="Fel: Funktionen returnerar fel om x=1:10 och n=2")
  
  expect_function_code(object = my_moving_average, expected = "return", 
                       info = "Fel: return() saknas i funktionen.") 
  
  # icke tillåten kod:
  expect_false(body_contain(object = my_moving_average,expected = "filter"),
               info = "Fel: Funktionen filter() används i funktionen.")
  
  expect_false(body_contain(object = my_moving_average, expected = "ma\\("),
               info = "Fel: Funktionen ma() används i funktionen.")
  expect_false(body_contain(object = my_moving_average,expected = "forecast"),
               info = "Fel: Funktioner ur paketet forecast används i funktionen.")
  
  expect_false(body_contain(object = my_moving_average,expected = "rollmean\\("),
               info = "Fel: Funktionen rollmean() används i funktionen.")
  expect_false(body_contain(object = my_moving_average,expected = "zoo"),
               info = "Fel: Funktioner ur paketet zoo används i funktionen.")
  
  expect_false(body_contain(object = my_moving_average,expected = "SMA\\("),
               info = "Fel: Funktionen SMA() används i funktionen.")
  expect_false(body_contain(object = my_moving_average,expected = "TTR"),
               info = "Fel: Funktioner ur paketet TTR används i funktionen.")
  
  expect_false(body_contain(object = my_moving_average,expected = "sma\\("),
               info = "Fel: Funktionen sma() används i funktionen.")
  expect_false(body_contain(object = my_moving_average,expected = "smooth"),
               info = "Fel: Funktioner ur paketet smooth används i funktionen.")
  
  
})
