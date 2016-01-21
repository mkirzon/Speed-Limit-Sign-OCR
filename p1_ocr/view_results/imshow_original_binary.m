function imshow_original_binary(I_or, I_bin, titleString)

  figure();
  
  title_or = sprintf('%s - Original', titleString);
  subplot(1,2,1); imshow(I_or); title(title_or);

  title_bin = sprintf('%s - Binarized', titleString);
  subplot(1,2,2); imshow(I_bin); title(title_bin );

end