function choice = wheelSelection(weights = [10, 1, 3, 5, 9, 8, 10])
  [weights, indexes] = sort(weights, "ascend");
  accumulation = cumsum(weights);
  p = rand() * accumulation(end);
  chosen_index = 0;
  for index = 1 : length(accumulation)
    if (accumulation(index) > p)
      chosen_index = indexes(1, index);
      break
    endif
  endfor
  choice = chosen_index;
endfunction