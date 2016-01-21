% component_label
% This function scans a binary image and outputs connected component labels

function I_labels = component_label(I_in)

[rIn, cIn] = size(I_in);
undiscovered = 999;
I_labels = undiscovered * ones(rIn, cIn); % undiscovered = 99
I_labels_ext = growBorderRGB(I_labels, 1);
eq_table_size = 1000;
eq_table = zeros(eq_table_size, eq_table_size); % hash table style
eq_table_rowIndex = ones(1, eq_table_size);

unique_label_counter = 1;

% 1st pass
for r = 1 : rIn
  for c = 1 : cIn
    val = I_in(r,c);
    % If current pixel is not background
    if (val == true)
      % Get neighbor non-background pixels
      rEx = r + 1;
      cEx = c + 1;
      
      window = I_labels_ext(rEx-1 : rEx+1, cEx-1 : cEx+1);
      min_label = min(min(window));
      if (min_label < undiscovered)
        I_labels_ext(rEx, cEx) = min_label;
        % Update equivalence table
        window_labels = unique(window);
        for i = 1 : length(window_labels)
          current_label = window_labels(i);
          if (current_label ~= undiscovered)
            for k = 1 : length(window_labels)
              search_label = window_labels(k);
              if (search_label ~= undiscovered)
                col1_rows = eq_table_rowIndex(current_label)-1;
                col2_rows = eq_table_rowIndex(search_label)-1;
                col1 = eq_table(1 : col1_rows, current_label);
                col2 = eq_table(1 : col2_rows, search_label);
                eq_table(1 : col1_rows + col2_rows, current_label) = union(col1, col2);
              end
            end
          end
        end
      else
        I_labels_ext(rEx, cEx) = unique_label_counter;
        eq_table(eq_table_rowIndex(unique_label_counter), unique_label_counter) = unique_label_counter;
        eq_table_rowIndex(unique_label_counter) = eq_table_rowIndex(unique_label_counter) + 1;
        unique_label_counter = unique_label_counter + 1;        
      end

      
    end
  end % c
end % r

% Remove extended border of the labels array
I_labels = I_labels_ext(2 : rIn+1, 2 : cIn+1);

% 2nd pass
for r = 1 : rIn
  for c = 1 : cIn
    current_label = I_labels(r, c);
    if (current_label ~= undiscovered)
      
      converged = false;
      linked_label = current_label;
      while (converged == false)
        equivalences = eq_table(1:eq_table_rowIndex(linked_label)-1, linked_label);
        min_label = min(equivalences);
        if (min_label == linked_label)
          converged = true;
        else 
          linked_label = min_label;
        end
      end
      I_labels(r, c) = min_label;
    end
  end % c
end % r

end