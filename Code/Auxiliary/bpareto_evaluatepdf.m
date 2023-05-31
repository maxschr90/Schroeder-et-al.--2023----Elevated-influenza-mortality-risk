%% This function evaluates the PDF of the bounded pareto at a given point "x" given parameters alpha,dmax,dmin

function [pdf] = bpareto_evaluatepdf(alpha,dmax,dmin,x)
    pdf = (alpha.*dmin.^alpha.*x.^(-alpha-1))./(1-(dmin/dmax).^alpha);
end