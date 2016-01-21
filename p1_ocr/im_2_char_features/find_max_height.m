function [max_height, max_i] = find_max_height(char_list)

  max_height = 0;
  max_i = 0;
  for i = 1 : numel(char_list)
    height = char_list{i}.Bounds.Bottom - char_list{i}.Bounds.Top;
    if (height > max_height)
      max_height = height;
      max_i = i;
    end    
  end
end