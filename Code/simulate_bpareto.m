%% This function simulates random draws from a bounded pareto distribution
%% N is the number of sequences
%% alpha is sequence of tail parameters
%% dmin and dmax are the bounds of the bounded pareto distribution
function [draws] = simulate_bpareto(N,alpha,dmax,dmin)
T = size(alpha,2);
%% Draw from a uniform distribution
U = rand(N,T);
%% invert CDF to obtain random draw
draws = (-(U.*dmax.^alpha-U.*dmin.^alpha-dmax.^alpha)./((dmin*dmax).^alpha)).^(-1./alpha);

end