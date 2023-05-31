%% This function evaluates the CDF of the bounded pareto at a given point "x" given parameters alpha,dmax,dmin
function [cdf] = bpareto_evaluatecdf(alpha,dmax,dmin,x)
    cdf = (1-dmin.^alpha.*x.^(-alpha))./(1-(dmin/dmax).^alpha);
end