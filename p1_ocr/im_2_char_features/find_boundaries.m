% find_boundaries
% This function outputs a struct containing the 4 bounds (for use with char_obj)

function bounds = find_boundaries(I_in, label)

  [rIn, cIn] = size(I_in);
  left = cIn; right = 1; top = rIn; bottom = 1;

  for r = 1 : rIn
    for c = 1 : cIn
      if (I_in(r, c) == label)
        if (c < left),   left = c;   end
        if (c > right),  right = c;  end        
        if (r < top),    top = r;    end
        if (r > bottom), bottom = r; end
      end
    end
  end
  
  bounds = struct('Top', top, 'Left', left, 'Bottom', bottom, 'Right', right);


end