% im_2_binary
% Inputs
%   dim: image dimensions (r,c)
%   thresh: lower threshold (logical 1 if image value is < thresh)
%   RGB: true or false, if image is RGB or grayscale
%   hist: true or false for performing histogram equalization
function [I_bin, I_or] = im_2_binary(filename, dim, thresh, RGB, histFlag)

  % Read in dimensions
  rIn = dim(1); 
  cIn = dim(2);

  % Read in image and convert to gray
  I_or = readRawImage(filename, RGB, [cIn, rIn]);
  I_gray = rgb2gray(I_or);
  
  % Perform histogram equalization if requested
  if histFlag
    I_gray = hist_equalization_gray(I_gray);
  end
  
  % Binarize against threshold
  I_bin = I_gray < thresh;

end