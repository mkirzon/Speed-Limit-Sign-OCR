% morph_stage1
% This function scans an image once looking for potential hits. 

function I_M = morph_stage1(I_F)

  % Declare initial parameter values
  [rIn, cIn] = size(I_F);
  I_M = false(rIn, cIn);
  offset = 1;
  bond = 0;
  global patternSets_conditional flag_shrink flag_thin flag_skeleton;

  % Grow image
  I_F = growBorderLogical(I_F);
    
  % Perform single scan
  for r = 1 : rIn
    for c = 1 : cIn

      % Calculate respective r,c indices in extended version
      rEx = r + offset;
      cEx = c + offset;

      % Extract window of image
      window = I_F(rEx - offset : rEx + offset, cEx - offset : cEx + offset);

      % Calculate Bond
      bond_last = bond;
      bond = bond_calc(window);

      % Continue examining this pixel only if bond > 0
      if (bond > 0)

        % Determine / update which set of patterns to use
        if (bond_last ~= bond)
          patternGroups_indexes = zeros(1,20);
          numGroups = 0;
          for s = 1 : length(patternSets_conditional)
            if (patternSets_conditional{s}.Bond == bond)
              if (flag_shrink && patternSets_conditional{s}.Shrink)
                patternGroups_indexes(numGroups+1) = s;
                numGroups = numGroups + 1;
              elseif (flag_thin && patternSets_conditional{s}.Thin)
                patternGroups_indexes(numGroups+1) = s;
                numGroups = numGroups + 1;
              elseif (flag_skeleton && patternSets_conditional{s}.Skeleton)
                patternGroups_indexes(numGroups+1) = s;
                numGroups = numGroups + 1;
              end
            end
          end
        end

        % Check for matches between window and each of the masks in each group. 
        foundFlag = false;
        for i = 1 : numGroups
          if (foundFlag), break; end
          patternSet = patternSets_conditional{patternGroups_indexes(i)}.Patterns;
          numMasks = size(patternSet, 3);
          for m = 1 : numMasks
            if (window == patternSet(:, :, m))
              I_M(r, c) = true;
              foundFlag = true;
              break;
            end
          end 
        end
      end
    end
  end  
end
