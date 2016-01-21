function char_list = remove_non_char_obj(char_list, dim, I_or)

  % char_list = remove_surround_obj(char_list);
  char_list = remove_small_obj_relative(char_list, .05, 1, dim); % Remove objects w/ height < 10px
  char_list = keep_enclosed_obj(char_list); % Remove any object that isn't surrounded by another object
  char_list = remove_large_obj(char_list, dim, .7); % Remove objects w/ width or height > 70% image dimensions



end