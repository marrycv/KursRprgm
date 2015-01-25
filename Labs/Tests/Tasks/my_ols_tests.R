### Assignment : MyOLS() ###
# rm(list=ls())
# library(testthat)
# source("/home/joswi05/Dropbox/Rkurs/KursRprgmTeacher/Labs/Solutions/LabSolutions_7.R",encoding="latin1")
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D7/D7_Grupp5.R",encoding="latin1")
# source("/home/joswi05/Dropbox/RCourse2014/Admin/StudentSolutions/D7/lab7_grupp11.R",encoding="latin1")

context("my_ols()")

test_that("Assignment: my_ols()", {

  expect_that(exists("my_ols"), is_true(),
              info = "Fel: my_ols() saknas.")
  expect_that(my_ols, is_a("function"),
              info = "Fel: my_ols ska vara en funktion.")
  expect_self_contained(object = my_ols,
                        "Fel: Funktionen har fria variabler")
  expect_that(all(names(formals(my_ols)) %in% c("X","y")), condition=is_true(),
              info = "Fel: Argumenten har felaktiga namn.")
  expect_is(my_ols(X=data.frame(var1=c(1:5)), y=rep(1,5)), "my_ols",
              info = "Fel: Funktionen returnerar inte en my_ols-klass")
  expect_that(length(my_ols(X=data.frame(var1=c(1:5)), y=rep(1,5))) == 3, is_true(),
            info = "Fel: Funktionen returnerar inte en lista med tre element")
  expect_that(all(names(my_ols(X=data.frame(var1=c(1:5)), y=rep(1,5))) %in% c("beta_hat", "sigma2_hat","e_hat")), is_true(),
              info = "Fel: Funktionen returnerar inte en lista med korrekt elementnamn (beta_hat, sigma2_hat,e_hat).")
  expect_equal(rownames(my_ols(X=data.frame(var1=c(1:5)), y=rep(1,5))$beta_hat)[1], "(Intercept)", 
               info = "Fel: Beta1 har inte (rad)namnet '(Intercept)'")

  data(CO2)
  res_CO2 <- my_ols(X=CO2[,4, drop=FALSE], y = CO2[,5])
  expect_equal(dim(res_CO2$beta_hat), c(2,1), 
               info = "Fel: beta_hat har inte en korrekt storlek (dim())")
  expect_equal(as.vector(round(res_CO2$beta_hat, 4)), c(19.5003, 0.0177), 
               info = "Fel: Beräkningen av beta_hat är felaktig.")
  expect_equal(dim(res_CO2$sigma2_hat), c(1,1), 
               info = "Fel: sigma2_hat har inte en korrekt storlek (dim())")
  expect_equal(as.vector(round(res_CO2$sigma2_hat, 4)), c(90.512), 
               info = "Fel: Beräkningen av sigma2_hat är felaktig.")
  expect_equal(dim(res_CO2$e_hat), c(84,1), 
               info = "Fel: e_hat har inte en korrekt storlek (dim())")
  expect_equal(as.vector(round(res_CO2$e_hat, 4))[1:2], c(-5.1847, 7.7969), 
               info = "Fel: Beräkningen av e_hat är felaktig.")

  data(attitude)
  res_att <- my_ols(X=attitude[,c(2,5,3), drop=FALSE], y = attitude[,1])
  expect_equal(dim(res_att$beta_hat), c(4,1), 
               info = "Fel: beta_hat har inte en korrekt storlek (dim())")
  expect_equal(as.vector(round(res_att$beta_hat, 4)), c(12.8231,0.7379,0.0890,-0.0581), 
               info = "Fel: Beräkningen av beta_hat är felaktig.")
  expect_equal(dim(res_att$sigma2_hat), c(1,1), 
               info = "Fel: sigma2_hat har inte en korrekt storlek (dim())")
  expect_equal(as.vector(round(res_att$sigma2_hat, 4)), c(51.8594), 
               info = "Fel: Beräkningen av sigma2_hat är felaktig.")
  expect_equal(dim(res_att$e_hat), c(30,1), 
               info = "Fel: e_hat har inte en korrekt storlek (dim())")
  expect_equal(as.vector(round(res_att$e_hat, 4))[1:2], c(-11.1419, 0.3067), 
               info = "Fel: Beräkningen av e_hat är felaktig.")
})
