% This function grows the image by mirroring pixels accros the border
% Inputs:
%    I = image
%    r = number of pixels to grow border by

function image = growBorder(I, r)
    
    % Determine size of input photo
    [rows, cols] = size(I);
    rowsNew = rows + r*2;
    colsNew = cols + r*2; 
    
    % Allocate matrix of output size
    image = uint8(zeros(rowsNew, colsNew));
    
    % Indices for borders
    iTop = r+1;
    iBottom = rowsNew - r;
    iLeft = r+1; 
    iRight = colsNew - r;
    
    % Fill in new matrix with original matrix
    image(iTop:iBottom, iLeft:iRight) = I;

    % Mirror borders and corners
    for i = 1:r
        % Add top and bottom borders
        for c = iLeft : iRight 
            image(iTop-i, c) = image(iTop+i,c); % Top 
            image(iBottom+i, c) = image(iBottom-i, c); % Bottom
        end
        % Add left and right borders
        for r = iTop : iBottom
            image(r, iLeft-i) = image(r, iLeft+i);
            image(r, iRight+i) = image(r, iRight-i);
        end
        % Add corners
        image(iTop-i, iLeft-i) = image(iTop+i, iLeft+i); % Top left
        image(iTop-i, iRight+i) = image(iTop+i, iRight-i); % Top right
        image(iBottom+i, iLeft-i) = image(iBottom-i, iLeft+i); % Bottom left
        image(iBottom+i, iRight+i) = image(iBottom-i, iRight-i); % Bottom right
    end
end