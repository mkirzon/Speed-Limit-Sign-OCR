% local_hist_equalization
% This function applies local histogram equalization.
% Inputs:
%   I_in = input image
%   win_size = vector w/ 2 elements [height width] of window used for local histogram equalization.
%              height and width dimension must be factors of  

function I_out = local_hist_equalization(I_in, win_size)

  % Declare parameters
  [rIn, cIn, chan] = size(I_in);
  I_out = zeros(rIn, cIn, chan, class(I_in));

  % Determine scan ranges
  row_max = rIn - mod(rIn, win_size(1))+1;
  col_max = cIn - mod(cIn, win_size(2))+1;


  for r = 1 : win_size(1) : row_max
    if (r < row_max), row_range = r : r+win_size(1)-1;
    else row_range = r : rIn;
    end
    
    for c = 1 : win_size(2) : col_max
      if (c < col_max), col_range = c : c+win_size(2)-1;
      else, col_range = c : cIn;
      end
      
      % Compute Histogram and CDF
      window = I_in(row_range, col_range, :);
      [hist, CDF] = hist_CDF_maker_gray(window);
      figure(1);
      subplot(1,2,1); imshow(window);
      subplot(1,2,2); bar(hist);
      
      % I_out(row_range, col_range, :) = hist_equalization_gray(window);
    end
  end
end