# Data from provided FUN FACTS
total_km_run_instructor <- 5224
number_of_shoes <- 7

average_shoes_lifetime <- total_km_run_instructor / number_of_shoes
total_km_run_forrest <- 24700
shoes_for_forrest_run <- total_km_run_forrest %/% average_shoes_lifetime
cat(sprintf('Forrest Gump would need %d pairs of shoes!\n', shoes_for_forrest_run))
