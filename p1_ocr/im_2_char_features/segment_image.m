% segment_image
% This function processes a well-defined binary image containing only
% segmentable character objects. The output is a char_list (cell array)
% containing character objects with these calculated fields:
%    1. Data.original
%    2. Bounds

function char_list = segment_image(I_bin)
  
  % Identify connected components
  I_labels = component_label(I_bin);
  labels = unique(I_labels);
  num_char = numel(labels) - 1;

  % Initialize character obj template and character object list
  char_list = cell(1, num_char);
  char_obj_template = init_charObj();

  % Segment characters and create cell array of character objects
  for i = 1 : num_char

    % Create instance of character object
    char_obj = char_obj_template;

    % Scan image to find boundaries for each character
    bounds = find_boundaries(I_labels, labels(i));
    char_obj.Bounds = bounds;

    % Crop character data to store as original data in character object
    char_data = I_bin(bounds.Top:bounds.Bottom, bounds.Left:bounds.Right);
    char_obj.Data.Original = char_data;

    % Append character object to character list
    char_list{i} = char_obj;

  end

end