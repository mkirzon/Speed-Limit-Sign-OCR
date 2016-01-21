function mat_rank = rank_matrix(mat_in)


  [rows, cols] = size(mat_in);
  mat_rank = zeros(3, rows*cols); % r1 = value, r2 = row index, r3 = col index

  doneFlag = false;
  curr_index = 1;

  while ~doneFlag

    % Locate max value and indices
    [max_row_vals, max_row_i] = max(mat_in);
    [max_val, max_col_i] = max(max_row_vals);

    if (max_val < 1)
      doneFlag = true;
    else
      % Add entry to mat_rank matrix
      mat_rank(1, curr_index) = max_val;
      mat_rank(2, curr_index) = max_row_i(max_col_i);
      mat_rank(3, curr_index) = max_col_i;
      curr_index = curr_index + 1;     
      
      % Replace the value in original matrix with -1 to mark as explored
      mat_in(max_row_i(max_col_i), max_col_i) = -1;
      
    end
  end 
  
end