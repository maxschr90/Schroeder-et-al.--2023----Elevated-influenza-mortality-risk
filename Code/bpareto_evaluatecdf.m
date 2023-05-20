
function [ cdf] = bpareto_evaluatecdf(alpha,dmax,dmin, x)
    cdf = (1-dmin.^alpha.*x.^(-alpha))./(1-(dmin/dmax).^alpha);

end