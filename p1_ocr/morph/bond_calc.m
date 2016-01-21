function bond = bond_calc(window)

bondWeights = [1 2 1;
               2 0 2;
               1 2 1];

    if (window(2,2) == 1)
      bond = sum(sum(bondWeights .* window));
    else 
      bond = 0;
    end
end

