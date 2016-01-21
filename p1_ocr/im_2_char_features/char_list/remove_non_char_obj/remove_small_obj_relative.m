% remove_small_obj_relative
% This function removes objects from char_list that have a size smaller
% than specified threshold along specified dimension
% Inputs:
%   thresh: number of pixels
%   dimSelect: 1=row or y dimension, 2=col or x dimension
%   dim: original image dimensions

function char_list = remove_small_obj_relative(char_list, thresh, dimSelect, dim)

  % Row or Y-dimension
  if (dimSelect == 1)
    j = 1;
    for i = 1 : numel(char_list)
      length = (char_list{j}.Bounds.Bottom - char_list{j}.Bounds.Top);
      if (length < thresh * dim(dimSelect))
        char_list(j) = [];
      else
        j = j + 1;
      end
    end
    
  elseif (dimSelect == 2)
    j = 1;
    for i = 1 : numel(char_list)
      length = (char_list{j}.Bounds.Right -  char_list{j}.Bounds.Left);
      if (length < thresh * dim(dimSelect))
        char_list(j) = [];
      else
        j = j + 1;
      end
    end
  end
  

end