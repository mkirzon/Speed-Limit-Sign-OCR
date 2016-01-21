function value = filterConv(I, filt, RC)

    % Get coordinates of center point in image
    rCenter = RC(1);
    cCenter = RC(2);
       
    % Determine filter size and # of elements
    [fRows, fCols] = size(filt);
    filt = filt / sum(sum(filt));
    
    % Get coordinates of top left point in filter in image
    rTop = rCenter - floor(fRows/2);
    cLeft = cCenter - floor(fCols/2);
    
    % Extract Image section
    Ipart = I(rTop : rTop+fRows-1, cLeft : cLeft+fCols-1);
    value = sum(sum(Ipart.*filt));
    % Apply filter
    %value = 0;
%     for r = 1:fRows
%         for c = 1:fCols
%            value = value + filt(r,c) * I(rTop + r, cLeft + c);
%         end
%     end
end