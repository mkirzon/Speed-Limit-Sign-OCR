function char_list = run_decisionTree(char_list)

  for i = 1 : length(char_list)
    char_list{i}.Value.Predicted = decisionTree_manual(char_list{i});
  end

end