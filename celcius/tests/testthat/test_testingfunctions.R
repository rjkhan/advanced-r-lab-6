library(celcius)
library(testthat)
knapsack_objects <- knapsack_data_gen()

######################################DATA FOR TESTING###############################

context("knapsack")



#####################################Brute_force_knapsack###############################

test_that("Brute_force_knapsack", {

  expect_that(brute_force_knapsack(x = knapsack_objects[1:8,], W = 3500),
              equals(list(value = 16770, elements = c(5,8))))
  
  expect_that(brute_force_knapsack(x = knapsack_objects[1:12,], W = 2000),
              equals(list(value = 15428, elements = c(3,8))))
  
  expect_that(brute_force_knapsack(x = data.frame("v" = 1:30,
                                                  "z" = 30:1), W = 2000),
              throws_error("Names of columns in x should only be 'v' for value and 'w' for weight"))
  
  expect_that(brute_force_knapsack(x = c(1:3), W = 2000),
              throws_error("x must be a data.frame"))
  
  expect_that(colnames(knapsack_objects[1:8,])[1],
              equals("w"))
  expect_that(colnames(knapsack_objects[1:8,])[2],
              equals("v"))
})
 
#####################################greedy_knapsack###############################

test_that("greedy_knapsack", {
  
  expect_that(greedy_knapsack(x = knapsack_objects[1:800,], W = 3500),
              equals(list(value= 192647, 
                          elements= as.character(c(92, 574, 472, 80, 110, 537, 332, 117, 37, 
                                      776, 577, 288, 234, 255, 500, 794, 55,
                                      290, 436, 346, 282, 764, 599, 303, 345, 
                                      300, 243, 43, 747, 35, 77, 229, 719, 564)))))

  
  #expect_that(greedy_knapsack(x = knapsack_objects[1:12,], W = 2000),
  #            equals(list(value = 15428, elements = c(3,8))))
  
  
  expect_that(greedy_knapsack(x = data.frame("v" = c(1,2), 
                                       "l"=c(2,3)), W = 2000),
                                   throws_error("Names of columns in x should only be 'v' for value and 'w' for weight"))
  
  
  expect_that(greedy_knapsack(x = c(1:3), W = 2000),
              throws_error("x must be a data.frame"))
  
  expect_that(greedy_knapsack(x = knapsack_objects[1:12,], W = 2000:2001),
              throws_error("W must be numeric with length 1 "))
  
}
)


#####################################knapsack_dynamic###############################

test_that("knapsack_dynamic", {
  
  expect_that(knapsack_dynamic(x = knapsack_objects[1:8,], W = 3500),
              equals(list(value = 16770, elements = c(5,8))))
              
  
  expect_that(knapsack_dynamic(x = knapsack_objects[1:12,], W = 2000),
              equals(list(value = 15428, elements = c(3,8))))
  
  
  expect_that(knapsack_dynamic(x = data.frame("v" = c(1,2), "l"=c(2,3)), W = 2000),
                              throws_error("Names of columns in x should only be 'v' for value and 'w' for weight"))
  
  
  expect_that(knapsack_dynamic(x = c(1:3), W = 2000),
              throws_error("x must be a data.frame"))
  expect_that(knapsack_dynamic(x = knapsack_objects[1:12,], W = 2000:2001),
              throws_error("W must be numeric with length 1 "))
  
})


