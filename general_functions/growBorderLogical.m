% growBorderLogical
% This function grows the image by 1 pixel with the value corresponding to the background of the image. 
% The background is assumed to be false. 
% Inputs:
%   I: input image (size: RxC)
% Outputs:
%   image: output image (size: (R+2)x(C+2))

function image = growBorderLogical(I)
    
    % Determine size of input
    [rows, cols] = size(I);
    rowsNew = rows + 2;
    colsNew = cols + 2;
    
    image = false(rowsNew, colsNew);
    
    % Fill in new matrix with original matrix
    image(2:rows+1, 2:cols+1) = I;
    
end