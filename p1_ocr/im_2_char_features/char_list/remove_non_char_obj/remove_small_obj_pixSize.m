% remove_small_obj
% This function removes objects from char_list that have a size smaller
% than thresh along specified dimension
% Inputs:
%   thresh: number of pixels
%   dim: 1=row or y dimension, 2=col or x dimension

function char_list = remove_small_obj_pixSize(char_list, thresh, dim)

  % Row or Y-dimension
  if (dim == 1)
    j = 1;
    for i = 1 : numel(char_list)
      length = (char_list{j}.Bounds.Bottom - char_list{j}.Bounds.Top);
      if (length < thresh)
        char_list(j) = [];
      else
        j = j + 1;
      end
  	end
    
  elseif (dim == 2)
    j = 1;
    for i = 1 : numel(char_list)
      length = (char_list{j}.Bounds.Right -  char_list{j}.Bounds.Left);
      if (length < thresh)
        char_list(j) = [];
      else
        j = j + 1;
      end
    end
  end
  

end