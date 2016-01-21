function aspect_ratio = char_aspectRatio(char_data)
  [rIn, cIn] = size(char_data);

  aspect_ratio = rIn / cIn;

end