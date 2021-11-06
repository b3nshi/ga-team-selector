function mutatedPopulation = mutateFunction(newPopulation, percentage, lastIndex)
  [total, len] = size(newPopulation);
  totalExcluded = total - (total - lastIndex);
  totalToSelect = ceil(percentage * total);
  selectedIndexes = zeros(1, totalToSelect);
  mutatedPopulation = newPopulation;
  teamSize = len / 2;
  for index=1:totalToSelect
    do
      selectedIndex = ceil(rand()*(totalExcluded-1) + 1);
    until any(selectedIndex != selectedIndexes);
    
    leftTeamIndex = ceil(rand()*(teamSize-1) + 1);
    rightTeamIndex = ceil(rand()*(teamSize-1) + teamSize + 1);
    
    generalIndex = lastIndex + index;
    
    mutatedPopulation(generalIndex, :) = newPopulation(selectedIndex, :);
    backupLeftItem = mutatedPopulation(generalIndex, leftTeamIndex);
    mutatedPopulation(generalIndex, leftTeamIndex) = mutatedPopulation(generalIndex, rightTeamIndex);
    mutatedPopulation(generalIndex, rightTeamIndex) = backupLeftItem;
    
    selectedIndexes(1, index) = selectedIndex;
  endfor
endfunction
