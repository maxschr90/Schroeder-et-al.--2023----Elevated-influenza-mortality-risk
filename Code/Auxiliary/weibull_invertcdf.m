%% This function inverts the Weibull cdf
%% W is sequence of tail parameters
function [x] = weibull_invertcdf(p,W)

T = size(W,2);
%% Numerically invert CDF to obtain random draw
solve_weibull = @(y,w,u)  w^y*(2+log(w)*(y*(y+1)*log(w)-2*y-1))-((u-1)*(log(w)-2));

    for t = 1:T
        w = W(t);
        for n = 1:size(p,1)
            x(n,t) = fzero(@(x)solve_weibull(x,w,p(n)), 0);
        end
    end
end