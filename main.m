clc;
NUMBER_OF_PLAYERS = 12;
# NUMBER_OF_PLAYERS = 22;
MAX_SCORE = 10;
MIN_SCORE = 1;
# PLAYERS = floor(rand(1,NUMBER_OF_PLAYERS)*MAX_SCORE + MIN_SCORE);
PLAYERS = [1,2,6,8,3,4,9,7,8,8,2,10];
# PLAYERS = [5,5,2,1,9,7,4,9,4,3,9,5,5,2,6,7,9,4,8,4,6,7];

INDEX_OF_PLAYERS = 1:NUMBER_OF_PLAYERS;
MAX_POSSIBLE_SCORE = (NUMBER_OF_PLAYERS/2*10) - (NUMBER_OF_PLAYERS/2);

# Algorithm configuration
PERCENTAGE_OF_SELECTION = 0.7;
PERCENTAGE_OF_CROSSOVER = 0.2;
PERCENTAGE_OF_MUTATION  = 0.1;
GENERATIONS = 100;
POPULATION_SIZE = 40;

AVG_SCORES = zeros(1, GENERATIONS);

function [newPopulation, scores] = runGeneration(population, 
                                                 players,
                                                 populationSize,
                                                 percentageOfSelection,
                                                 percentageOfCrossover,
                                                 percentageOfMutation
                                                )
    scores = fitCalc(population, players);
    [selectedPopulation, excludedPopulation] = selectFunction(population, 
                                                              percentageOfSelection, 
                                                              scores
                                                             );
    crossoveredPopulation = crossoverFunction(selectedPopulation, 
                                              percentageOfCrossover, 
                                              ceil(populationSize * percentageOfSelection)
                                             );
    newPopulation = mutateFunction(crossoveredPopulation, 
                                   percentageOfMutation, 
                                   ceil(populationSize * (percentageOfCrossover + percentageOfSelection))
                                  );
endfunction

population = generateInitialPopulation(PLAYERS, POPULATION_SIZE, INDEX_OF_PLAYERS);

for generation=1:GENERATIONS
  [population, scores] = runGeneration(
                  population,
                  PLAYERS, 
                  POPULATION_SIZE, 
                  PERCENTAGE_OF_SELECTION, 
                  PERCENTAGE_OF_CROSSOVER, 
                  PERCENTAGE_OF_MUTATION
               );
  AVG_SCORES(1, generation) = mean(scores);
endfor

MAX_POSSIBLE_SCORE
PLAYERS
lastScores = fitCalc(population, PLAYERS);
THE_MAXIMUM_VALUE_WE_GOT_IS = max(lastScores);
THE_POSSIBLE_TEAMS_INDEX_ARE = find(lastScores == THE_MAXIMUM_VALUE_WE_GOT_IS);
SCORES = lastScores(1, THE_POSSIBLE_TEAMS_INDEX_ARE);
AVG_SCORE = mean(SCORES)
THE_POSSIBLE_TEAMS_ARE = population(THE_POSSIBLE_TEAMS_INDEX_ARE, :);
TOTAL_POSSIBLE_TEAMS = size(THE_POSSIBLE_TEAMS_ARE)(1, 1)
UNIQUE_TEAMS = getUniqueSolutionsSorted(THE_POSSIBLE_TEAMS_ARE, SCORES);

# Just to make it nicers
HEADERS = ['      ', '   ', 'Team 1', ' ', ' ', '     |', '      ', '   ', 'Team 2', ' ', ' ', '     |', ' Score'];
[ HEADERS; int2str(UNIQUE_TEAMS) ]
plot(1:GENERATIONS, AVG_SCORES);

