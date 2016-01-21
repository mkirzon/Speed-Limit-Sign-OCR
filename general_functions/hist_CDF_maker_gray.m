function [histNorm, CDF] = hist_CDF_maker_gray(I_in)

    [rIn, cIn] = size(I_in);
    % Make and plot histograms for each channel
    hist = zeros(1, 256, 'double');


    for r = 1:rIn
        for c = 1:cIn
            pixel = I_in(r,c);
            hist(pixel+1) = hist(pixel+1) + 1;
        end
    end

    % Normalized probability histogram
    pixTotal = rIn * cIn;
    histNorm = double(hist) ./ pixTotal;

    % Calculate and plot the CDF
    CDF = histNorm;

    for i = 2:256
        CDF(i) = CDF(i) + CDF(i-1);
    end

end
