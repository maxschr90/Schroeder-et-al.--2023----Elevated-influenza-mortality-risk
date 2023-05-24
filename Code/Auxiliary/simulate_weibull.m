%% This function simulates random draws from a Weibull distribution
%% N is the number of sequences
%% W is sequence of tail parameters
function [draws] = simulate_weibull(N,W)

T = size(W,2);
%% Draw from a uniform distribution
U = rand(N,T);

%% Numerically invert CDF to obtain random draw

solve_weibull = @(y,w,u)  w^y*(2+log(w)*(y*(y+1)*log(w)-2*y-1))-((u-1)*(log(w)-2));

for t = 1:T
    w = W(t);
    parfor n = 1:N
        u = U(n,t);
        draws(n,t) = fzero(@(x)solve_weibull(x,w,u), 0);
    end
end
end