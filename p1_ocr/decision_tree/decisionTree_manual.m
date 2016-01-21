function output = decisionTree_manual(char_obj)

  f = char_obj.Features;
  output = 'unknown';
  
  if (f.Euler == -1)
    output = '8';
  elseif (f.Euler == 0) % 0, 4, 6, 9, P, D
    if (f.Strokes.H == 3)
      output = '6';
    elseif (f.Strokes.V == 3)
      output = '9';
    else % 0, 4, O, P, D
      if (f.Perimeter < 330) % 4, P
        if (f.Moments(4) < 180)
          output = 'P';
        else
          output = '4';
        end
      else % 0, O, D
        if (f.Area < 135)
          output = '0';
        elseif (f.Moments(1) > 1800)
          output = 'O';
        else
          output = 'D';
        end
      end
    end
  elseif (f.Euler == 1) % 1, 2, 3, 5, 7, S, E, L, I, M,
    if (f.Area < 90) % I, L, T, Y, 1, 7
      if (f.Area < 73) % 1, I
        if (f.Circularity > .05)
          output = 'I';
        else
          output = '1';
        end
      else % L, T, Y, 7
        if (f.Perimeter > 200) % 7, Y
          if (f.Perimeter > 250)
            output = 'Y';
          else
            output = '7';
          end
        else % L, T
          if (f.Centroids.X > 4)
            output = 'T';
          else
            output = 'L';
          end
        end
      end

    else % S, E, M, U, 2, 3, 5
      if (f.Strokes.H == 4)
        output = 'M';
      elseif (f.Strokes.V == 1)
        output = 'U';
      elseif (f.Circularity > .0155) 
        output = 'E';
      else % S, 2, 3, 5
        if (f.Strokes.V == 4)
          output = '3';
        else % S, 2, 5
          if (f.Strokes.H == 2) % S, 2
            if (f.Moments(10) < 140)
              output = '2';
            else 
              output = 'S';
            end
          else % 2, 5
            if (f.Moments(10) < 140)
              output = '5';
            else
              output = '2';
            end
          end
        end
      end
    end
  end



end