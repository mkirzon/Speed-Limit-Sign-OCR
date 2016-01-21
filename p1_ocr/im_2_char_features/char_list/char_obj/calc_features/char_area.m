function area = char_area(char_data)
  [rIn, cIn] = size(char_data);
  area = 0;

  for r = 1 : rIn
    for c = 1 : cIn
      if (char_data(r, c))
        area = area + 1;
      end
    end
  end

end