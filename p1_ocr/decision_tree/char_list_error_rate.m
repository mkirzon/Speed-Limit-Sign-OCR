function error = char_list_error_rate(char_list, title)

  num_char = length(char_list);
  error = 0;
  
  for i = 1 : num_char
    if ~strcmp(char_list{i}.Value.Actual, char_list{i}.Value.Predicted)
      error = error + 1;
    end
  end
  
  error = error / num_char;
  
  fprintf('%s error rate: %.2f%%\n', title, 100*error);

end
