## ------------------------------------------------------------------------
library(celcius)
knapsack_objects <- knapsack_data_gen(n = 2000, seed = 42)
head(knapsack_objects, n = 5)

## ---- warning= FALSE, message= FALSE-------------------------------------
brute_force_knapsack(knapsack_objects[1:8,], W = 3500)

## ------------------------------------------------------------------------
knapsack_dynamic(knapsack_objects[1:8,], W = 3500)

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  library(microbenchmark)
#  
#  knapsack_object_brute <- knapsack_data_gen(n = 16)
#  knapsack_object_dynamic <- knapsack_data_gen(n = 500)
#  knapsack_object_greedy <- knapsack_data_gen(n = 1000000)
#  
#  microbenchmark(
#    "Brute Normal" = brute_force_knapsack(x = knapsack_object_brute, W = 3500),
#    "Brute Parallel" = brute_force_knapsack(x = knapsack_object_brute, W = 3500, parallel = TRUE),
#    "Dynamic" = knapsack_dynamic(x = knapsack_object_dynamic, W = 3500),
#    "Greedy" = greedy_knapsack(x = knapsack_object_greedy, W = 3500),
#    times = 1
#  )

## ---- echo=TRUE, eval=FALSE----------------------------------------------
#  Unit: seconds
#             expr       min        lq      mean    median        uq       max neval
#     Brute Normal  2.718805  2.718805  2.718805  2.718805  2.718805  2.718805     1
#   Brute Parallel  1.693102  1.693102  1.693102  1.693102  1.693102  1.693102     1
#          Dynamic 82.915175 82.915175 82.915175 82.915175 82.915175 82.915175     1
#           Greedy  1.109075  1.109075  1.109075  1.109075  1.109075  1.109075     1
#  

