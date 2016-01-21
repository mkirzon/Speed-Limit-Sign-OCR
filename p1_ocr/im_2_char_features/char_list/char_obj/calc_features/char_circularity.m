function circularity = char_circularity(char_data, area, perimeter)
  [rIn, cIn] = size(char_data);

  circularity = 4 * pi * area / (perimeter^2);
end