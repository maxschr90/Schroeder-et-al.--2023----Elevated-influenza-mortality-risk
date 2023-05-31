%% This function sums the 2D matrices X and Y, retaining NaNs only if they are common between both matrices
function [Output] = sumdatatables(X,Y)
    idx = isnan(X)&isnan(Y);
    Output = sum(cat(3,X,Y),3,'omitnan');
    Output(idx) = NaN;
end
