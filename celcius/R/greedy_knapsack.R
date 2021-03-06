#' @title Greedy knapsack
#'
#' @description A function that solve the knapsack problem using a 'greedy' approach. The greedy_knapsack search 
#' is to use the a heuristic or approximation for the problem. This algorithm will not give an exact result 
#' (but it can be shown that it will return at least 50% of the true maximum value), but it
#' will reduce the computational complexity considerably (actually to O(n log n) due to the sorting part of
#' the algorithm).
#'
#' @param x A data.frame cx with two variables v and w
#' @param W The weight capacity of the knapsack
#' @return The maximum knapsack value and corresponding elements that contributes to the value. 
#' 
#' @examples knapsack_objects <- knapsack_data_gen(n = 2000, seed = 42)
#' @examples greedy_knapsack(x = knapsack_objects[1:800,], W = 3500)
#' 
#' 
#' @seealso see also similar functions:
#' \code{\link{brute_force_knapsack}}
#' \code{\link{knapsack_dynamic}}
#'  
#' 
#'
#' @references \url{https://en.wikipedia.org/wiki/Knapsack_problem#Greedy_approximation_algorithm}
#'
#' @export
greedy_knapsack <- function(x, W){
  
  if(!is.data.frame(x)){
    stop("x must be a data.frame")
  }
  
  if(ncol(x) != 2){
    stop("x should only have 2 columns, a value columns and a weight column")
  }
  
  if(!all(names(x) %in% c("v","w"))){
    stop("Names of columns in x should only be 'v' for value and 'w' for weight")
  }
  if(length(W) >1 | !is.numeric(W)){
    stop("W must be numeric with length 1 ")
  }
  
  if(any(x[,c("w","v")] < 0)){
    stop("Data.frame contains non-positive values")
  }
  
  #Creating the a fractional variable and sorting the
  # row according to the new variable
  x$frac <- x$v/x$w
  x <- x[order(x$frac, decreasing = TRUE), ]
  
  #Creating two vectors for holding the result 
  value <- vector("numeric")
  elements <- vector("numeric")
  
  #Initilazing values
  weight <- 0
  value <- 0
  
  
  i <- 1
  while(weight + x[i,"w"] < W){
      value <- value + x[i,"v"] 
      weight <- weight + x[i,"w"]
      elements[i] <- as.numeric(rownames(x[i,]))
      i <- i + 1

  }
  
  res <- list(
    "value" = round(value,digits = 0),
    "elements" = elements
  )
  
  return(res)
  
}