%% This Function fits the model of the bounded pareto distribution for the monte carlo simulation
%% x is a vector of mortality rates
%% dmin and dmax are the bounds of the bounded pareto distribution

function [theta_hat] = est_parms_bpareto_mc(x,dmax,dmin)
ms = MultiStart('UseParallel', true);
options = optimset('Algorithm', 'sqp', 'UseParallel', true,'Display', 'off','MaxIter', 1000,  'MaxFunEvals',1000000, 'TolFun', 1e-12, 'TolX', 1e-12, 'FinDiffType', 'central');
problem = createOptimProblem('fmincon', 'objective',@(y)bpareto_ll(y,x,dmax,dmin), 'lb',[0,-36.5], 'ub', [2,36.5], 'x0',[0,0], 'options', options);
[theta_hat] = run(ms,problem,1000);
end