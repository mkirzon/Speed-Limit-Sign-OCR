function I_morph = char_morph(char_data)

  I_morph = bwmorph(char_data, 'fill');
  I_morph = bwmorph(I_morph, 'thin', inf);

end