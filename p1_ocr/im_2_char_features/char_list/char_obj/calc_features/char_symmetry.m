function symmetries = char_symmetry(char_data)

  [rIn, cIn] = size(char_data);

  % X-axis symmetry
  h_count = 0;
  x_axis = ceil(rIn / 2);
  if (mod(rIn, 2) == 0)
    for r = 1 : x_axis
      for c = 1 : cIn
        h_count = h_count + (char_data(r, c) && char_data(rIn + 1 - r, c));
      end
    end
  else
    for r = 1 : x_axis - 1
      for c = 1 : cIn
        h_count = h_count + (char_data(r, c) && char_data(rIn + 1 - r, c));
      end
    end
    h_count = h_count + sum(char_data(x_axis, :));
  end

  % Vertical Symmetry
  v_count = 0;
  y_axis = ceil(cIn / 2);
    if (mod(cIn, 2) == 0)
    for c = 1 : y_axis
      for r = 1 : rIn
        v_count = v_count + (char_data(r, c) && char_data(r, cIn + 1 - c));
      end
    end
  else
    for c = 1 : y_axis - 1
      for r = 1 : rIn
        v_count = v_count + (char_data(r, c) && char_data(r, cIn + 1 - c));
      end
    end
    v_count = v_count + sum(char_data(:, y_axis));
  end

  h_sym = h_count / (rIn * cIn);
  v_sym = v_count / (rIn * cIn);

  symmetries = struct('H', h_sym, 'V', v_sym);

end