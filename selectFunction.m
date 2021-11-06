# Selection
function [selectedPopulation, excludedPopulation] = selectFunction(population, percentage, weights)
  [total, len] = size(population);
  totalToSelect = percentage * total;
  selectedIndexes = zeros(1, totalToSelect);
  selectedPopulation = zeros(total, len);
  excludedPopulation = zeros(total, len);
  for index=1:totalToSelect
    do
      selectedIndex = wheelSelection(weights);
    until any(selectedIndex != selectedIndexes);
    selectedPopulation(index, :) = population(selectedIndex, :);
    selectedIndexes(1, index) = selectedIndex;
  endfor
  
  excludedPopulation = population;
  excludedPopulation(selectedIndexes', :) = [];
endfunction