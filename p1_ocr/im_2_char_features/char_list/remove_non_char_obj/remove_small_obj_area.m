% remove_small_obj
% This function removes objects from char_list that have a bounding region area < [thresh] * [original image area]. 

function char_list = remove_small_obj_area(char_list, dim, thresh)

  area_thresh = dim(1) * dim(2) * thresh;
  
  j = 1;
  for i = 1 : numel(char_list)
    area =  (char_list{j}.Bounds.Right -  char_list{j}.Bounds.Left) * (char_list{j}.Bounds.Bottom - char_list{j}.Bounds.Top);
    if ( area < area_thresh)
        char_list(j) = [];
    else
      j = j + 1;
    end
  end

end