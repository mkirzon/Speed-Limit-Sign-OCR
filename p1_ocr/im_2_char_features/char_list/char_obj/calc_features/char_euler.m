function euler = char_euler(char_data)
  [rIn, cIn] = size(char_data);
  Q0 = 0; Q1 = 0; Q2 = 0; Q3 = 0; Q4 = 0; QD = 0;
  char_data = growBorderLogical(char_data);
  
  for r = 1 : rIn + 1
    for c = 1 : cIn + 1
      window = char_data(r:r+1, c:c+1);
      bit_count = sum(sum(window));
      switch bit_count
        case (0)
          Q0 = Q0 + 1;
        case (1)
          Q1 = Q1 + 1;
        case (3)
          Q3 = Q3 + 1;
        case (4)
          Q4 = Q4 + 1;
        case (2)
          if (window(1,1) == window(2,2))
            QD = QD + 1;
          else
            Q2 = Q2 + 1;
          end
      end
    end
  end

  % Using 8-connectivity euler formula
  euler = (1/4) * (Q1 - Q3 - 2*QD);
  
end