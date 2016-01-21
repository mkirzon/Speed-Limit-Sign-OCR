% hist_equalization
% This function applies transfer function based histogram equalization

function I_out = hist_equalization_gray(I_in)

  [rIn, cIn] = size(I_in);

  % Compute Histogram and CDF
  [histNorm, CDF] = hist_CDF_maker_gray(I_in);

  % Create transfer functions / mapping table
  map = CDF .* 255; 
  
  % Creating and displaying equalized image
  I_out = zeros(rIn, cIn, 'uint8');
  for r = 1:rIn
      for c = 1:cIn
          pixel = I_in(r,c);
          if (pixel == 0)
            pixel = 1; 
          end
          I_out(r,c,1) = map(pixel);      
      end
  end

end