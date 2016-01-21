function [rem_char] = featureMatrix_analysis(featureMatrix, rem_char, )

  [num_fts, num_char] = size(featureMatrix);
  std_buckets = zeros(num_fts, 6);
  charVector = zeros(1, num_char);
  avg = zeros(1, num_fts);
  stddev = zeros(1, num_fts);
  
  for i = 1 : num_fts;
    for j = 1 : length(rem_char)
      charVector(j) = featureMatrix(i, rem_char(j));
    end
    [avg(i), stddev(i)] = feature_props(charVector);
    std_buckets(i, :) = charVec_2_std_buckets(charVector, stddev(i), avg(i));
  end

  std_buckets_sorted = rank_matrix(std_buckets); % row is feature index, col is std dev bucket


  % Pick a feature and threshold
  count = 1;
  while (find(std_buckets_sorted(1, :) == 1))
    question_index = 0; 
    for i = length(std_buckets_sorted) : -1 : 1
      if (std_buckets_sorted(1, i) == 1)
        question_index = i;
        break;
      end
    end

    feature_index = std_buckets_sorted(2, question_index);
    bucket_index  = std_buckets_sorted(3, question_index);

    threshold_low =  stddev(feature_index) * (bucket_index - 4);
    threshold_high = stddev(feature_index) * (bucket_index - 3);

    % Find the character fitting this threshold
    char_index = 0;
    for j = 1 : length(rem_char)
      val = featureMatrix(feature_index, rem_char(j)) - avg(feature_index);
      % Test character feature against threshold
      if (val >= threshold_low && val <= threshold_high)
        char_index = j;
        break;
      end
    end

    std_buckets_sorted(1, question_index) = -1;
    char_found_vec(count) = char_index;
    count = count + 1;
  end

  char_found_vec = unique(char_found_vec);

  for i = 1 : length(char_found_vec)
    char_removing = char_found_vec(i);
    for j = 1 : length(rem_char)
      if (rem_char(j) == char_removing)
        rem_char(j) = [];
        break;
      end
    end
  end


end