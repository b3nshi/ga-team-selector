# This is not a known algorithm, but it is similar to the Uniform Crossover
# Having:
#   A = [ 1, 3, 2, 5, 4 ]
#   B = [ 2, 1, 4, 6, 3 ]
# We initially get:
#   C = [ 1, 2, 3, 1, 2, 4, 5, 6, 4, 3 ]
# Now we remove the duplicated values to get
#   C = [ 1, 2, 3, 4, 5, 6 ]
# So we mix them and get the first non-repeated index from each of them
function crossoveredPopulation = crossoverFunction(newPopulation, percentage, lastIndex)
  [total, len] = size(newPopulation);
  totalExcluded = total - (total - lastIndex);
  totalToCrossover = ceil(percentage * total);
  selectedIndexes = zeros(1, totalToCrossover * 2);
  crossoveredPopulation = newPopulation;
  teamSize = len / 2;

  for index=1:totalToCrossover
    do
      selectedIndex1 = ceil(rand()*(totalExcluded-1) + 1);
      selectedIndex2 = ceil(rand()*(totalExcluded-1) + 1);
    until any(selectedIndex1 != selectedIndexes) && any(selectedIndex2 != selectedIndexes)
    

    # This will contain the crossed values with duplicated values
    crossedValues = [newPopulation(selectedIndex1, :);newPopulation(selectedIndex2, :)];
    crossedValues = crossedValues(:)';
   
    # Now I will remove the duplicated values
    [crossedValues1, crossedValues2] = unique(crossedValues, "stable");
    crossedValues2 = crossedValues2';
    generalIndex = lastIndex + index;
    crossoveredPopulation(generalIndex, :) = crossedValues1(1, :);
    selectedIndexes(1, index) = selectedIndex1;
    index += 1;
    generalIndex += 1;
    crossoveredPopulation(generalIndex, :) = crossedValues2(1, :);
    selectedIndexes(1, index) = selectedIndex2;
  endfor
endfunction
