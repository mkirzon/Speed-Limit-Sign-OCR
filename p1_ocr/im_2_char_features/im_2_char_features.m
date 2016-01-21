% im_2_char_features
% This function takes in a binarized image and outputs the char_list containing a char_obj for each character
% 

function [char_list, max_height] = im_2_char_features(I_bin, dim, max_height)

  % Segment image and create list of character objects
  char_list = segment_image(I_bin);

  % Detect and remove non-character objects in char_list
  char_list = remove_non_char_obj(char_list, dim, I_bin);

  % Find maximum height of characters for normalization (use on training data only)
  if ~exist('max_height', 'var')
    [max_height, max_height_i] = find_max_height(char_list);
  end

  % Calculate features for each object
  load_morphmasks();
  for i = 1 : numel(char_list);
    char_list{i} = analyze_obj(char_list{i}, max_height);
  end  

end