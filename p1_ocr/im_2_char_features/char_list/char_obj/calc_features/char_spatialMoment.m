function [moments, centroids] = char_spatialMoment(char_data, area)

  [rIn, cIn] = size(char_data);

  % Calculate 0th and 1st order moments
  M_00 = area;
  M_10 = 0; M_01 = 0;

  for k = 1 : rIn
    for j = 1 : cIn
      if (char_data(k, j))
        M_10 = M_10 + j;
        M_01 = M_01 + k;
      end
    end
  end
  M_10 = M_10 / cIn;
  M_01 = M_01 / rIn;

  % Calculate centroid 
  centroid_x = round(M_10 / M_00);
  centroid_y = round(M_01 / M_00);
  centroids = struct('X', centroid_x, 'Y', centroid_y);

  % Calculate all unscaled spatial central moments
  calc_U = @(m, n, k, j) (j - centroid_x)^m * (k - centroid_y)^n / (cIn^m * rIn^n);
  moments = zeros(1, 10);

  for k = 1 : rIn
    for j = 1 : cIn
      if (char_data(k, j))
        moments(1)  = moments(1)  + calc_U(0, 0, k, j);
        moments(2)  = moments(2)  + calc_U(0, 1, k, j);
        moments(3)  = moments(3)  + calc_U(1, 0, k, j);
        moments(4)  = moments(4)  + calc_U(1, 1, k, j);
        moments(5)  = moments(5)  + calc_U(0, 2, k, j);
        moments(6)  = moments(6)  + calc_U(2, 0, k, j);
        moments(7)  = moments(7)  + calc_U(0, 3, k, j);
        moments(8)  = moments(8)  + calc_U(3, 0, k, j);
        moments(9)  = moments(9)  + calc_U(1, 2, k, j);
        moments(10) = moments(10) + calc_U(2, 1, k, j);
      end
    end
  end
end