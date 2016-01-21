function output = print_feature(char_obj, feature)

  if strcmp(feature, 'Original')
    figure(1);
    imshow(char_obj.Data.Original); title('Original');
    
  elseif strcmp(feature, 'Thin')
    figure(2);
    imshow(char_obj.Data.Thin); title('Thin');
    
  elseif strcmp(feature, 'Normalized')
    figure(3);
    imshow(char_obj.Data.Normalized); title('Normalized');

  elseif strcmp(feature, 'Bounds')
    top = char_obj.Bounds.Top;
    left = char_obj.Bounds.Left;
    bottom = char_obj.Bounds.Bottom;
    right = char_obj.Bounds.Right;
    fprintf('%5.d\t', top, left, bottom, right);
    fprintf('\n');
    
  elseif strcmp(feature, 'Area')
    fprintf('%d\n', char_obj.Features.Area);
    
  elseif strcmp(feature, 'Perimeter')
    fprintf('%d\n', char_obj.Features.Perimeter);

  elseif strcmp(feature, 'Holes')
    fprintf('%d\n', 1 - char_obj.Features.Euler);

  elseif strcmp(feature, 'Centroids')
    cx = char_obj.Features.Centroids.X;
    cy = char_obj.Features.Centroids.Y;
    fprintf('%5.2f\t ', [cx cy]);
    fprintf('\n');  

  elseif strcmp(feature, 'Moments')
    fprintf('%.2f\t ', char_obj.Features.Moments);
    fprintf('\n');
    
  elseif strcmp(feature, 'Strokes')
    sh = char_obj.Features.Strokes.H;
    sv = char_obj.Features.Strokes.V;
    fprintf('%4.0f\t ', [sh sv]);
    fprintf('\n'); 
    
  elseif strcmp(feature, 'Symmetry')
    sh = 100*char_obj.Features.Symmetries.H;
    sv = 100*char_obj.Features.Symmetries.V;
    fprintf('%4.2f%%\t ', [sh sv]);
    fprintf('\n'); 

  elseif strcmp(feature, 'Aspect Ratio')
    fprintf('%d\n', char_obj.Features.Aspect_Ratio);

  elseif strcmp(feature, 'Actual')
    fprintf('%s\n', char_obj.Value.Actual);
    
  elseif strcmp(feature, 'Predicted')
    fprintf('%s\n', char_obj.Value.Predicted);
  else
    warning('Display command not found');
     
  end


end