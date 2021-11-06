# This will filter repeated results
function uniqueSolutions = getUniqueSolutionsSorted(population, scores)
  [sortedScores, changedIndexes] = sort(scores);
  [total, len] = size(population);
  sortedPopulation = population(changedIndexes.', :);
  firstTeamPopulation = sort(sortedPopulation(:, 1:len/2), 2);
  [result, uniqueIndexes] = unique(firstTeamPopulation, 'rows');
  uniqueSolutions = [sortedPopulation(uniqueIndexes, :), sortedScores(1, uniqueIndexes.').'];
endfunction