function char_obj = init_charObj()

  emptyVal = 999;
  
  struct_centroids = struct('X', emptyVal, 'Y', emptyVal);
  struct_strokes = struct('H', emptyVal, 'V', emptyVal);
  struct_symmetries = struct('H', emptyVal, 'V', emptyVal);
  
  struct_data = struct('Original', emptyVal, 'Thin', emptyVal, 'Normalized', emptyVal);
  struct_value = struct('Actual', 'n/a', 'Predicted', 'n/a');
  struct_bounds = struct('Top', emptyVal, 'Left', emptyVal, 'Bottom', emptyVal, 'Right', emptyVal);
  struct_features = struct('Area', emptyVal, 'Perimeter', emptyVal, 'Euler', emptyVal, 'Circularity', emptyVal, 'Centroids', struct_centroids, 'Moments', emptyVal*ones(1, 10), 'Strokes', struct_strokes, 'Symmetries', struct_symmetries, 'Aspect_Ratio', emptyVal);

  char_obj = struct('Data', struct_data, 'Value', struct_value, 'Bounds', struct_bounds, 'Features', struct_features);
  
end