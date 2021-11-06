# The best score is (players/2 * 10) - (players/2) and the worst one is 0
function scores = fitCalc(population, players)
  [total, len] = size(population);
  maxScore = ((len/2)*10 - (len/2));
  scores = zeros(1, total);

  for i=1:total
    selectedPopulation = players(1, population(i, :));
    teamA = sum(selectedPopulation(1, 1:(len/2)));
    teamB = sum(selectedPopulation(1, (len/2)+1:len));
    score = maxScore - abs(teamA - teamB);
    scores(1, i) = score; # to invert the definition of Max and Min
  endfor
endfunction