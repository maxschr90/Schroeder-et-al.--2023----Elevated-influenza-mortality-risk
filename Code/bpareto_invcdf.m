%% This function inverts the bounded pareto cdf
function x = bpareto_invcdf(p,alpha,dmax,dmin)
%% invert CDF at specified points p
x = (-(p.*dmax.^alpha-p.*dmin.^alpha-dmax.^alpha)./((dmin*dmax).^alpha)).^(-1./alpha);

end