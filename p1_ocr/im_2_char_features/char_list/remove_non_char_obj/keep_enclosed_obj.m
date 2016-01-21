% keep_enclosed_obj
% This function processes a list of char_obj, determines existance of surrounding object, and if detected, keeps only objects that are surrounded
% (assumption: a char_obj that surrounds others isn't a character)

function char_list = keep_enclosed_obj(char_list)

  % Stage 1: Determine which objects are "surrounding" objects (maintain list of resepctive indices)
  k = 1;
  surroundExist = false; 
  num_char = length(char_list);

  for i = 1 : num_char
    for j = 1 : num_char
      bounds1 = char_list{i}.Bounds;
      bounds2 = char_list{j}.Bounds;

      % Check if bounds 1 surrounds bounds 2
      if (bounds1.Top < bounds2.Top && bounds1.Left < bounds2.Left && bounds1.Bottom > bounds2.Bottom && bounds1.Right > bounds2.Right)
        surrounding_objs(k) = i;
        k = k + 1;
        surroundExist = true;
        break;
      end
    end
  end

  % Proceed only if surrounding objects exist
  if surroundExist
    % Stage 2: Determine which objects (indices in original char_list) are not surrounded by "surrounding" objects
    k = 1;
    for i = 1 : num_char
      bounds2 = char_list{i}.Bounds;
      enclosedFlag = false;

      for j = surrounding_objs
        bounds1 = char_list{j}.Bounds;
        % Check if bounds 1 surrounds bounds 2
        if (bounds1.Top < bounds2.Top && bounds1.Left < bounds2.Left && bounds1.Bottom > bounds2.Bottom && bounds1.Right > bounds2.Right)
          enclosedFlag = true;
          break;
        end
      end

      if ~enclosedFlag
        delete_char_indices(k) = i;
        k = k + 1;
      end
    end

    % Stage 3: Remove objects marked by previous stage
    k = 0; 
    for i = delete_char_indices
      char_list(i-k) = [];
      k = k + 1;
    end
  end