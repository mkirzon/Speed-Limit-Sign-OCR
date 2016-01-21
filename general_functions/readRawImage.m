%% Read in raw image | by Mark Kirzon

function image = readRawImage(filename, RGB, dim) 
    
    % Create file reference
    fid = fopen(filename, 'r');
    
    % Check if file exists
    if (fid == -1)
        error('can not open input image file \n');
    end
    
    % Set # of color channels
    if (RGB)
        channels = 3;
    else
        channels = 1;
    end
    
    % Read in raw file as bytestream
    pixels = fread(fid, dim(1)*dim(2)*channels, '*uint8');
    fclose(fid);

    % Extract individual channels and rotate image
    size = dim(1)*dim(2); 
    if (RGB) % RGB case
        % Allocate matrix for each color channel
        red = uint8(zeros(dim(1),dim(2)));
        green = uint8(zeros(dim(1),dim(2)));
        blue = uint8(zeros(dim(1),dim(2)));
        
        % Write pixels into matrix
        red(1:size) = pixels(1:3:end); 
        green(1:size) = pixels(2:3:end);
        blue(1:size) = pixels(3:3:end);
        
        % Transpose matrix, to orient it properly
        red = red';
        green = green';
        blue = blue';
        
        % Combine channels into a 3d array
        image = cat(3, red, green, blue);
    else % grayscale case / 1 channel case
        image = uint8(zeros(dim(1),dim(2)));
        image(1:size) = pixels(1:end);
        image = image';
    end
    
end