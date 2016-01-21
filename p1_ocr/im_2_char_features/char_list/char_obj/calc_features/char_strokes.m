function strokes = char_strokes(char_data)
  [rIn, cIn] = size(char_data);
  rowCuts = floor(linspace(rIn / 4, 3 * rIn / 4, 3));
  colCuts = floor(linspace(cIn / 4, 3 * cIn / 4, 3));

  % Horizontal Cuts
  stroke_h = 0;
  mask_h = logical([0, 1, 0]);
  for r = rowCuts
    temp = 0;
    for c = 1 : cIn-2
      if (mask_h == char_data(r, c:c+2))
        temp = temp + 1;
      end
    end
    if (temp > stroke_h), stroke_h = temp; end
  end

  % Verical Cuts
  stroke_v = 0;
  mask_v = mask_h';
  for c = colCuts
    temp = 0;
    for r = 1 : rIn-2
      if (mask_v == char_data(r:r+2, c))
        temp = temp + 1;
      end
    end
    if (temp > stroke_v), stroke_v = temp; end
  end

  strokes = struct('H', stroke_h, 'V', stroke_v);


end