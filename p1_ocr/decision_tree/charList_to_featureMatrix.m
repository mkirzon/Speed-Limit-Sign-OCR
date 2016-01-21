function [featureMatrix, num_char, num_features] = charList_to_featureMatrix(char_list)
  num_char = numel(char_list);
  num_features = length(charObj_to_featureVector(char_list{1}));

  featureMatrix = zeros(num_char, num_features);

  for i = 1 : num_char
    featureMatrix(i, :) = charObj_to_featureVector(char_list{i});
  end
end