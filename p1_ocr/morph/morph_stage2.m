function [I_G, converged] = morph_stage2(I_M, I_F)

  % Declare initial parameter values
  [rIn, cIn] = size(I_M);
  I_G = false(rIn, cIn);
  converged = true;
  global patternSets_unconditional;
  numMasks = length(patternSets_unconditional) / 9;
  
  % Grow image
  I_M = growBorderLogical(I_M);

  % Perform scan
  for r = 1 : rIn
    for c = 1 : cIn
      % Calculate respective r,c indices in extended version
      rEx = r + 1;
      cEx = c + 1;

      if (I_M(rEx, cEx) == 0)
        I_G(r,c) = I_F(r,c);
      else
        % Extract window of I_M
        window = I_M(rEx - 1 : rEx + 1, cEx - 1 : cEx + 1);

        % Create and check masks, stop if hit        
        miss = true;
        for m = 1 : numMasks
          mask = patternSets_unconditional(1 + (m-1)*9 : 9 + (m-1)*9);
          if (compareStringPattern(mask, window))
            I_G(r,c) = I_F(r,c);
            miss = false;
            break;
          end
        end
        if (miss == true)
          converged = false;
        end
      end
    end % end col scan
  end % end row scan
end % end function


