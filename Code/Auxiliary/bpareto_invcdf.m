%% This function inverts the bounded pareto CDF at a point p, given parameters alpha,dmax,dmin
function x = bpareto_invcdf(p,alpha,dmax,dmin)
    x = (-(p.*dmax.^alpha-p.*dmin.^alpha-dmax.^alpha)./((dmin*dmax).^alpha)).^(-1./alpha); % invert CDF at specified points p
end