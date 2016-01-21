function patternSets_conditional = load_patternGroups_conditional()
  S1 = false(3,3,4);
  S1(:,:,1) = [0 0 1; 0 1 0; 0 0 0];
  S1(:,:,2) = [1 0 0; 0 1 0; 0 0 0];
  S1(:,:,3) = [0 0 0; 0 1 0; 1 0 0];
  S1(:,:,4) = [0 0 0; 0 1 0; 0 0 1];

  S2 = false(3,3,4);
  S2(:,:,1) = [0 0 0; 0 1 1; 0 0 0];
  S2(:,:,2) = [0 1 0; 0 1 0; 0 0 0];
  S2(:,:,3) = [0 0 0; 1 1 0; 0 0 0];
  S2(:,:,4) = [0 0 0; 0 1 0; 0 1 0];

  S3 = false(3,3,8);
  S3(:,:,1) = [0 0 1; 0 1 1; 0 0 0];
  S3(:,:,2) = [0 1 1; 0 1 0; 0 0 0];
  S3(:,:,3) = [1 1 0; 0 1 0; 0 0 0];
  S3(:,:,4) = [1 0 0; 1 1 0; 0 0 0];
  S3(:,:,5) = [0 0 0; 1 1 0; 1 0 0];
  S3(:,:,6) = [0 0 0; 0 1 0; 1 1 0];
  S3(:,:,7) = [0 0 0; 0 1 0; 0 1 1];
  S3(:,:,8) = [0 0 0; 0 1 1; 0 0 1];

  TK4 = false(3,3,4);
  TK4(:,:,1) = [0 1 0; 0 1 1; 0 0 0];
  TK4(:,:,2) = [0 1 0; 1 1 0; 0 0 0];
  TK4(:,:,3) = [0 0 0; 1 1 0; 0 1 0];
  TK4(:,:,4) = [0 0 0; 0 1 1; 0 1 0];

  STK4 = false(3,3,4);
  STK4(:,:,1) = [0 0 1; 0 1 1; 0 0 1];
  STK4(:,:,2) = [1 1 1; 0 1 0; 0 0 0];
  STK4(:,:,3) = [1 0 0; 1 1 0; 1 0 0];
  STK4(:,:,4) = [0 0 0; 0 1 0; 1 1 1];

  ST5_1 = false(3,3,4);
  ST5_1(:,:,1) = [1 1 0; 0 1 1; 0 0 0];
  ST5_1(:,:,2) = [0 1 0; 0 1 1; 0 0 1];
  ST5_1(:,:,3) = [0 1 1; 1 1 0; 0 0 0];
  ST5_1(:,:,4) = [0 0 1; 0 1 1; 0 1 0];

  ST5_2 = false(3,3,4);
  ST5_2(:,:,1) = [0 1 1; 0 1 1; 0 0 0];
  ST5_2(:,:,2) = [1 1 0; 1 1 0; 0 0 0];
  ST5_2(:,:,3) = [0 0 0; 1 1 0; 1 1 0];
  ST5_2(:,:,4) = [0 0 0; 0 1 1; 0 1 1];

  ST6 = false(3,3,2);
  ST6(:,:,1) = [1 1 0; 0 1 1; 0 0 1];
  ST6(:,:,2) = [0 1 1; 1 1 0; 1 0 0];             

  STK6 = false(3,3,8);
  STK6(:,:,1) = [1 1 1; 0 1 1; 0 0 0];
  STK6(:,:,2) = [0 1 1; 0 1 1; 0 0 1];
  STK6(:,:,3) = [1 1 1; 1 1 0; 0 0 0];
  STK6(:,:,4) = [1 1 0; 1 1 0; 1 0 0];
  STK6(:,:,5) = [1 0 0; 1 1 0; 1 1 0];
  STK6(:,:,6) = [0 0 0; 1 1 0; 1 1 1];
  STK6(:,:,7) = [0 0 0; 0 1 1; 1 1 1];
  STK6(:,:,8) = [0 0 1; 0 1 1; 0 1 1];

  STK7 = false(3,3,4);
  STK7(:,:,1) = [1 1 1; 0 1 1; 0 0 1];
  STK7(:,:,2) = [1 1 1; 1 1 0; 1 0 0];
  STK7(:,:,3) = [1 0 0; 1 1 0; 1 1 1];
  STK7(:,:,4) = [0 0 1; 0 1 1; 1 1 1];

  STK8 = false(3,3,4);
  STK8(:,:,1) = [0 1 1; 0 1 1; 0 1 1];
  STK8(:,:,2) = [1 1 1; 1 1 1; 0 0 0];
  STK8(:,:,3) = [1 1 0; 1 1 0; 1 1 0];
  STK8(:,:,4) = [0 0 0; 1 1 1; 1 1 1];

  STK9 = false(3,3,8);
  STK9(:,:,1) = [1 1 1; 0 1 1; 0 1 1];
  STK9(:,:,2) = [0 1 1; 0 1 1; 1 1 1];
  STK9(:,:,3) = [1 1 1; 1 1 1; 1 0 0];
  STK9(:,:,4) = [1 1 1; 1 1 1; 0 0 1];
  STK9(:,:,5) = [1 1 1; 1 1 0; 1 1 0];
  STK9(:,:,6) = [1 1 0; 1 1 0; 1 1 1];
  STK9(:,:,7) = [1 0 0; 1 1 1; 1 1 1];
  STK9(:,:,8) = [0 0 1; 1 1 1; 1 1 1];

  STK10 = false(3,3,4);        
  STK10(:,:,1) = [1 1 1; 0 1 1; 1 1 1];
  STK10(:,:,2) = [1 1 1; 1 1 1; 1 0 1];
  STK10(:,:,3) = [1 1 1; 1 1 0; 1 1 1];
  STK10(:,:,4) = [1 0 1; 1 1 1; 1 1 1];

  K11 = false(3,3,4);
  K11(:,:,1) = [1 1 1; 1 1 1; 0 1 1];
  K11(:,:,2) = [1 1 1; 1 1 1; 1 1 0];
  K11(:,:,3) = [1 1 0; 1 1 1; 1 1 1];
  K11(:,:,4) = [0 1 1; 1 1 1; 1 1 1];

  % Create objects
  S1 =    struct('Name', 'S',     'Patterns', S1,    'Bond', 1,  'Shrink', true,  'Thin', false, 'Skeleton', false);
  S2 =    struct('Name', 'S',     'Patterns', S2,    'Bond', 2,  'Shrink', true,  'Thin', false, 'Skeleton', false);
  S3 =    struct('Name', 'S',     'Patterns', S3,    'Bond', 3,  'Shrink', true,  'Thin', false, 'Skeleton', false);
  TK4 =   struct('Name', 'TK',    'Patterns', TK4,   'Bond', 4,  'Shrink', false, 'Thin', true,  'Skeleton', true);
  STK4 =  struct('Name', 'STK',   'Patterns', STK4,  'Bond', 4,  'Shrink', true,  'Thin', true,  'Skeleton', true);
  ST5_1 = struct('Name', 'ST_1',  'Patterns', ST5_1, 'Bond', 5,  'Shrink', true,  'Thin', true,  'Skeleton', false);
  ST5_2 = struct('Name', 'ST_2',  'Patterns', ST5_2, 'Bond', 5,  'Shrink', true,  'Thin', true,  'Skeleton', false);
  ST6 =   struct('Name', 'ST',    'Patterns', ST6,   'Bond', 6,  'Shrink', true,  'Thin', true,  'Skeleton', false);
  STK6 =  struct('Name', 'STK',   'Patterns', STK6,  'Bond', 6,  'Shrink', true,  'Thin', true,  'Skeleton', true);
  STK7 =  struct('Name', 'STK',   'Patterns', STK7,  'Bond', 7,  'Shrink', true,  'Thin', true,  'Skeleton', true);
  STK8 =  struct('Name', 'STK',   'Patterns', STK8,  'Bond', 8,  'Shrink', true,  'Thin', true,  'Skeleton', true);
  STK9 =  struct('Name', 'STK',   'Patterns', STK9,  'Bond', 9,  'Shrink', true,  'Thin', true,  'Skeleton', true);
  STK10 = struct('Name', 'STK10', 'Patterns', STK10, 'Bond', 10, 'Shrink', true,  'Thin', true,  'Skeleton', true);
  K11 =   struct('Name', 'K',     'Patterns', K11,   'Bond', 11, 'Shrink', false, 'Thin', false, 'Skeleton', true);

  patternSets_conditional = {S1, S2, S3, TK4, STK4, ST5_1, ST5_2, ST6, STK6, STK7, STK8, STK9, STK10, K11};

end