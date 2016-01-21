% compareStringPattern
% Inputs:
%   pattern: 9 character string input corresponding to one mask from the unconditional pattern tables
% Output:
%   match: boolean that is true when the window matched one of the combinations allowed by the pattern

function match = compareStringPattern(pattern, window)

  aFlag = false;   bFlag = false;  cFlag = false; 
  aExist = false; bExist = false; cExist = false;
  wrongFlag = false;
  window = window';

  % Preprocess pattern to check if it has A, B, or C
  for i = 1 : 9
    letter = pattern(i);
    if (strcmp(letter, 'A')), aExist = true; 
    elseif (strcmp(letter, 'C')), cExist = true; 
    end
  end

  for i = 1 : 9
    letter = pattern(i);
    val = window(i);

    if strcmp(letter, 'D')
    elseif strcmp(letter, '0')
      if (val ~= 0)
        wrongFlag = true;
      end
    elseif strcmp(letter, 'M')
      if (val == 0)
        wrongFlag = true;
      end
    elseif strcmp(letter, 'A')
      if (val == 1)
        aFlag = true;
      end
    elseif strcmp(letter, 'B')
      if (val == 1)
        bFlag = true;
      end
    elseif strcmp(letter, 'C')
      if (val == 1)
        cFlag = true;
      end
    end

    if (wrongFlag == true)
      break;
    end
  end

  if (aExist)
    if (cExist)
      match = (wrongFlag == 0) && (aFlag || bFlag || cFlag);
    else
      match = (wrongFlag == 0) && (aFlag || bFlag);
    end
  else
    match = (wrongFlag == 0);
  end

end