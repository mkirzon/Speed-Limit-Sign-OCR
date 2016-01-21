function perimeter = char_perimeter(char_data)
  [rIn, cIn] = size(char_data);
  char_data_ext = growBorderLogical(char_data);
  perimeter = 0;
  windowH = [false  true];
  windowV = windowH';
  
  for r = 1 : rIn
    for c = 1 : cIn
      rEx = r + 1;
      cEx = c + 1;
      window1 = char_data_ext(rEx,       cEx:cEx+1);
      window2 = char_data_ext(rEx:rEx+1, cEx);
      if (window1 == windowH)
        perimeter = perimeter + 1;
      end
      if (window2 == windowV)
        perimeter = perimeter + 1;
      end
    end
  end
  perimeter = perimeter * 2;
end