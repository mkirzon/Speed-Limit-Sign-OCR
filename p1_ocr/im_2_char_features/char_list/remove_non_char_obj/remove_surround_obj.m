% remove_surround_obj
% This function processes a list of char_obj and removes any char objects that surround others 
% (assumption: a char_obj that surrounds others isn't a character)


function char_list = remove_surround_obj(char_list)

  % Detect if there are connected components inside another connected component
  surroundExist = true;

  while (surroundExist)
    num_char = numel(char_list);
    bounds1 = char_list{1}.Bounds;
    border_char_index = 1;
    surroundExist = false;

    for i = 2 : num_char
      bounds2 = char_list{i}.Bounds;

      % Check if bounds 1 surrounds bounds 2
      if (bounds1.Top < bounds2.Top && bounds1.Left < bounds2.Left && bounds1.Bottom > bounds2.Bottom && bounds1.Right > bounds2.Right)
        surroundExist = true;
        break;
      else
        bounds1 = bounds2;
        border_char_index = i;
      end
    end

    % If border found, remove the object from character list
    if (surroundExist)
      char_list(border_char_index) = [];
    end
  end
end

