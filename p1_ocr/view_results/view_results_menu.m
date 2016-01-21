function output = view_results_menu(char_list)
  usrAns = 1;
  num_char = numel(char_list);
  optionList = {'Exit', 'Original', 'Normalized', 'Thin', 'Bounds', 'Area', 'Perimeter', 'Holes', 'Centroids', 'Moments', 'Strokes', 'Symmetry', 'Aspect Ratio', 'Actual', 'Predicted', 'All'};
  
  while (usrAns > 0)
    fprintf('You can see the results for the following parameters:\n');
    for i = 1 : numel(optionList)
      fprintf('%d: %s\n', i-1, optionList{i});
    end

    usrAns = input('\nSelection: '); clc;
    pause_t = 0;

    switch (usrAns)
      case (0)
        break;
      case (1)
        feature = 'Original';
        subtitleString = sprintf('\n%s Results\n', feature);
        pause_t = .3;
      case (2)
        feature = 'Normalized';
        subtitleString = sprintf('\n%s Results\n', feature);
        pause_t = .3;  
      case (3)
        feature = 'Thin';
        subtitleString = sprintf('\n%s Results\n', feature);
        pause_t = .3;
      case (4)
        feature = 'Bounds';
        subtitleString = sprintf('\n%s\n[Top\tLeft\tBottom\tRight]\n', feature);
      case (5)
        feature = 'Area';
        subtitleString = sprintf('\nArea:\n');
      case (6)
        feature = 'Perimeter';
        subtitleString = sprintf('\nPerimeter:\n');
      case (7)
        feature = 'Holes';
        subtitleString = sprintf('\nNumber of Holes:\n');
      case (8)
        feature = 'Centroids';
        subtitleString = sprintf('\n%s\n  X\t\t\tY\n', feature);
      case (9)
        feature = 'Moments';
        subtitleString = sprintf('\n%s (1:10):\n', feature);        
      case (10)
        feature = 'Strokes';
        subtitleString = sprintf('\n%s\n  H\t\t\tV\n', feature);
      case (11)
        feature = 'Symmetry';
        subtitleString = sprintf('\nSymmetry:\n');
      case (12)
        feature = 'Aspect Ratio';
        subtitleString = sprintf('\nAspect Ratio:\n');
      case (13)
        feature = 'Actual';
        subtitleString = sprintf('\nActual letter:\n'); 
      case (14)
        feature = 'Predicted';
        subtitleString = sprintf('\nPredicted Letter:\n');        
      otherwise
        
    end

    % Results grouped by Attribute Type
    if (usrAns < 15)
      % Print label of current results
      fprintf('%s', subtitleString);

      for i = 1 : num_char
        print_feature(char_list{i}, feature);
        pause(pause_t);
      end
      
    % Results grouped by character (Option = All)
    else
      for i = 1 : num_char
        clc;
        for f = 2 : numel(optionList) - 1
          fprintf('\n%s\n', optionList{f});
          print_feature(char_list{i}, optionList{f});
        end
        pause();
      end
    end
  end
  
end