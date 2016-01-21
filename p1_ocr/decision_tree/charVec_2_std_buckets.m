function std_buckets = charVec_2_std_buckets(charVector, stddev, mean)

  std_buckets = zeros(1, 6); % -3, -2, -1, 1, 2, 3

  for i = 1 : length(charVector)
    val = charVector(i) - mean;


    if     (val > -3*stddev && val <= -2*stddev)
      std_buckets(1) = std_buckets(1) + 1;
    elseif (val > -2*stddev && val <= -1*stddev)
      std_buckets(2) = std_buckets(2) + 1;
    elseif (val > -1*stddev && val <= 0*stddev)
      std_buckets(3) = std_buckets(3) + 1;
    elseif (val >  0*stddev && val <= 1*stddev)
      std_buckets(4) = std_buckets(4) + 1;
    elseif (val >  1*stddev && val <= 2*stddev)
      std_buckets(5) = std_buckets(5) + 1;
    elseif (val >  2*stddev && val <= 3*stddev)
      std_buckets(6) = std_buckets(6) + 1;
    end
  end


end