% normalize_array
% This function will normalize a vector or matrix to range 0-1

function array_norm = normalize_array(A)
    
    array_norm = (A - min(A(:))) ./ (max(A(:)) - min(A(:)));

end