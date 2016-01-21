function output = charlist_2_cellarray(char_list)

  [featureMatrix, num_char, num_features] = charList_to_featureMatrix(char_list);

  row_headers = {'Actual';
                 'Predicted';
                 'Area';
                 'Perimeter';
                 'Euler';
                 'Circularity';
                 'Centroids.X';
                 'Centroids.Y';
                 'Strokes.H';
                 'Strokes.V';
                 'Symmetry.H';
                 'Symmetry.V';
                 'Aspect_Ratio'
                 'Moments, 00';
                 'Moments, 01';
                 'Moments, 10';
                 'Moments, 11';
                 'Moments, 02';
                 'Moments, 20';
                 'Moments, 03';
                 'Moments, 30';
                 'Moments, 12';
                 'Moments, 21'};

  % Initialize cell array
  for c = 1 : num_char + 1
    for f = 1 : num_features + 1
      output{f, c} = '';
    end
  end

  % Create Column Headers
  for c = 1 : num_char
    output{1, c+1} = char_list{c}.Value.Actual;
    output{2, c+1} = char_list{c}.Value.Predicted;
  end
  
  % Create Row Headers
  for r = 1 : num_features
    output{r, 1} = row_headers(r);
  end

  % Add data
  for f = 1 : num_features
    for i = 1 : num_char
      output{f+2, i+1} = featureMatrix(i, f);
    end
  end

end