% remove_large_obj
% This function removes objects from char_list that have at least one dimension that is greater than [thresh]*dim. 
% Inputs:
%   thresh: a value 0-1 
%   dim: dimensions of original input image

function char_list = remove_large_obj(char_list, dim, thresh)

  j = 1;
  for i = 1 : numel(char_list)
    if (   char_list{j}.Bounds.Right -  char_list{j}.Bounds.Left > thresh * dim(2) ...
        || char_list{j}.Bounds.Bottom - char_list{j}.Bounds.Top  > thresh * dim(1))
        char_list(j) = [];
    else
      j = j + 1;
    end
  end

end