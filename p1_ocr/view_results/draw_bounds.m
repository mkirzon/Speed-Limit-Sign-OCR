function output = draw_bounds(I_in, character_list, filename)

  [rIn, cIn] = size(I_in);
  
  if (islogical(I_in))
    I = 255*uint8(I_in);
    I_in = zeros(rIn, cIn, 3);
    I_in(:, :, 1) = I;
    I_in(:, :, 2) = I;
    I_in(:, :, 3) = I;
  end

  for i = 1 : numel(character_list)
    bounds = character_list{i}.Bounds;
    top = bounds.Top;
    bottom = bounds.Bottom;
    left = bounds.Left;
    right = bounds.Right;
    I_in(top, left:right, :) = 0;
    I_in(bottom, left:right, :) = 0;
    I_in(top:bottom, left, :) = 0;
    I_in(top:bottom, right, :) = 0; 
    I_in(top, left:right, 1) = 255;
    I_in(bottom, left:right, 1) = 255;
    I_in(top:bottom, left, 1) = 255;
    I_in(top:bottom, right, 1) = 255; 
  end

  figure(); imshow(I_in);
  
  filename = ['bounding_', filename, '.png'];
  imwrite(I_in, filename);

end