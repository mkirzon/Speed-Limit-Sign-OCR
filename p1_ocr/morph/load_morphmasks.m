function output = load_morphmasks()
  % Declare morphing operations
  global flag_shrink flag_thin flag_skeleton;
  flag_shrink = false;
  flag_thin = true;
  flag_skeleton = false;

  % Load pattern groups
  global patternSets_conditional patternSets_unconditional;
  patternSets_conditional = load_patternGroups_conditional();
  patternSets_unconditional = '';

  if (flag_skeleton)
    patternSets_unconditional = [patternSets_unconditional load_unconditional_skeletonize()];
  end
  if (flag_thin || flag_shrink)
    patternSets_unconditional  = [patternSets_unconditional load_unconditional_shrink_thin()];
  end

end