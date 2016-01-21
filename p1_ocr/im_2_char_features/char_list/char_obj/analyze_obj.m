function char_obj = analyze_obj(char_obj, height_scale)

  char_data            = char_obj.Data.Original;
  char_data_norm       = bilinear_interpolate(char_data, height_scale);  
  char_data_thin       = char_morph(char_data_norm);
  area                 = char_area(char_data_thin);
  perimeter            = char_perimeter(char_data_thin);
  euler                = char_euler(char_data_thin);
  circularity          = char_circularity(char_data_thin, area, perimeter);
  [moments, centroids] = char_spatialMoment(char_data_norm, area);
  strokes              = char_strokes(char_data_thin);
  aspect_ratio         = char_aspectRatio(char_data_thin);
  symmetries           = char_symmetry(char_data_norm);

  char_obj.Data.Thin = char_data_thin;
  char_obj.Data.Normalized = char_data_norm;
  char_obj.Features.Area = area;
  char_obj.Features.Perimeter = perimeter;
  char_obj.Features.Euler = euler;
  char_obj.Features.Circularity = circularity;
  char_obj.Features.Moments = moments;
  char_obj.Features.Centroids = centroids;
  char_obj.Features.Strokes = strokes;
  char_obj.Features.Aspect_Ratio = aspect_ratio;
  char_obj.Features.Symmetries = symmetries;
end