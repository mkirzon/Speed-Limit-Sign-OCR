function I_resize = bilinear_interpolate(I, target_height)

  [rIn, cIn] = size(I);
  rP = target_height;
  cP = floor(cIn * target_height / rIn);
  
  % Row & Column scale factors
  if (rIn > rP), S_r = rIn / rP; else S_r = (rIn - 1) / rP; end;
  if (cIn > cP), S_c = cIn / cP; else S_c = (cIn - 1) / cP; end;

  % (rf, cf) is fractional location in input image from which to sample
  % output image
  [cf, rf] = meshgrid(1:cP, 1:rP);
  rf = rf * S_r;
  cf = cf * S_c;

  % (r c) are the row and column indices of the pixels in the input image to
  % use in the algorithm
  r = floor(rf); r(r < 1) = 1; r(r > rIn - 1) = rIn - 1;
  c = floor(cf); c(c < 1) = 1; c(c > cIn - 1) = cIn - 1;

  % (dr, dc) are the fractional parts of the row and column locations 
  dr_Mat = rf - r;
  dc_Mat = cf - c;

  % Define the bilinear interpolation function
  bilinearInterpoloation = @(I, r, c, dr, dc)...
      I(r,c,:)*(1-dr)*(1-dc) + I(r+1,c,:)*dr*(1-dc) + I(r,c+1,:)*(1-dr)*dc + ...
      I(r+1,c+1,:)*dr*dc;

  % Allocate array for output image
  I_resize = false(rP, cP);

  % Loop through indices in output array and calculate pixel values using the
  % bilinear interpolation function (defined above)
  for i = 1:rP
      for j = 1:cP
          I_resize(i,j) = bilinearInterpoloation(I, r(i,j), c(i,j), dr_Mat(i,j), dc_Mat(i,j));
      end
  end

end