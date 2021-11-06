# Function to generate the initial population, we need to indicate the size of the population
function retval = generateInitialPopulation(players, total, indexOfPlayers)
  population = zeros(total, length(players));

  for i=1:total
    population(i, :) = indexOfPlayers(randperm(length(indexOfPlayers)));
  endfor

  retval = population;
endfunction