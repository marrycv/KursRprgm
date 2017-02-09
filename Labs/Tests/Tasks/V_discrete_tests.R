context("V_discrete()")

test_that("V_discrete()", {
  
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
  
  x<-1:10
  px<-rep(1/10,10)
  x_mat<-cbind(x,px)
  
  y<-1:3
  py<-c(0.2,0.7,0.1)
  y_mat<-cbind(y,py)
  
  expect_true(exists("V_discrete"),
              info = "Fel: V_discrete() saknas.")
  expect_true(is.function(V_discrete),
              info = "Fel: V_discrete är inte en funktion.")
  
  expect_function_self_contained(object = V_discrete,
                        "Fel: Funktionen innehåller fria variabler")
  
  expect_true(test_object_name(target = V_discrete,true_names = c("density_matrix", "trans")),
              info = "Fel: Argumenten i funktionen har felaktiga namn.")
  
  expect_function_code(object = V_discrete, expected = "return", 
                       info = "Fel: return() saknas i funktionen.")
  
  expect_error(V_discrete(density_matrix = matrix("hej")),
               info = "Fel: Funktionen stoppar inte när density_matrix är icke numerisk.")  
  
  expect_error(V_discrete(density_matrix = matrix("hej")), "density_matrix is not numeric!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande då density_matrix är icke numerisk.")  
  
  
  expect_error(V_discrete(trans = matrix("hej")),
               info = "Fel: Funktionenen stoppar inte när trans är icke numerisk.")  
  
  expect_error(V_discrete(trans = matrix("hej")), "trans is not numeric!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande då trans är icke numerisk.")  
  
  
  expect_error(V_discrete(density_matrix = cbind(y,c(0.4,0.6,0.8))),
               info = "Fel: Funktionenen stoppar inte när sannolikheterna inte summerar till 1.")  
  
  expect_error(V_discrete(density_matrix = cbind(y,c(0.4,0.6,0.8))), "probabilities do not sum to 1!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande när sannolikheterna inte summerar till 1.") 
  
  expect_error(V_discrete(trans = c(1,2,3)),
               info = "Fel: Funktionenen stoppar inte när trans inte har längd 2.")  
  
  expect_error(V_discrete(trans = c(1,2,3)), "trans has not length 1!",
               info = "Fel: Funktionen returnerar inte rätt felmeddelande när när trans inte har längd 2.")
  
  
  expect_true(is.numeric(V_discrete()), 
              info="Fel: Funktionen returnerar inte en numerisk vector")
  
  expect_equal(length(V_discrete(density_matrix = x_mat)), c(1),
               info="Fel: Funktionen returnerar inte en vektor av längd 1")
  
  expect_equal(V_discrete(),c(0),
               info="Fel: funktionen returnerar inte rätt värde vid V_discrete()")
  
  expect_equal(V_discrete(trans=c(2)),c(0),
               info="Fel: funktionen returnerar inte rätt värde vid V_discrete(trans=c(2))")
  
  expect_equal(V_discrete(density_matrix = x_mat),c(8.25),
               info="Fel: funktionen returnerar inte rätt värde vid V_discrete(density_matrix = x_mat)")
  
  expect_equal(V_discrete(density_matrix = y_mat),c(0.29),
               info="Fel: funktionen returnerar inte rätt värde vid V_discrete(density_matrix = y_mat)")
  
  expect_equal(V_discrete(density_matrix = y_mat,trans = c(4)),c(4.64),
               info="Fel: funktionen returnerar inte rätt värde med density_matrix = y_mat,trans = c(4)")
  
  expect_equal(V_discrete(density_matrix = y_mat,trans = c(1)),c(0.29),
               info="Fel: funktionen returnerar inte rätt värde med density_matrix = y_mat,trans = c(1)")
  
  expect_equal(V_discrete(density_matrix = y_mat,trans = c(0)),c(0),
               info="Fel: funktionen returnerar inte rätt värde med density_matrix = y_mat,trans = c(0)")
  
  
})
