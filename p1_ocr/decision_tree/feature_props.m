function [avg, stddev] = feature_props(charVector)

%   max = max(charVector);
%   min = min(charVector);
  avg = mean(charVector);
  stddev = std(charVector);

end