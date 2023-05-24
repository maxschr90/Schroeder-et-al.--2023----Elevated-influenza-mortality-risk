%% This Function fits the model of the bounded pareto distribution
%% x is a vector of mortality rates
%% dmin and dmax are the bounds of the bounded pareto distribution
%% if no bounds are supplied the function will fit them as well
function [Calibrated_Model] = est_parms_bpareto(x,dmax,dmin,name)
t = [1:size(x,1)]'-1;
ms = MultiStart('UseParallel', true);
options = optimset('Algorithm', 'sqp', 'UseParallel', true,'Display', 'off','MaxIter', 1000,  'MaxFunEvals',1000000, 'TolFun', 1e-12, 'TolX', 1e-12, 'FinDiffType', 'central');
if max(isempty(dmax),isempty(dmin)) == 0
    problem = createOptimProblem('fmincon', 'objective',@(y)bpareto_ll(y,x,dmax,dmin), 'lb',[0,0], 'ub', [2,10], 'x0',[0,0], 'options', options);
    [theta_hat,Fval] = run(ms,problem,1000);
    alpha = 1./(exp(theta_hat(2))*exp(-t*theta_hat(1)));
    Calibrated_Model = struct('Model', name,'lambda', theta_hat(1),'eta_zero', theta_hat(2), 'alpha', alpha, 'dmin',dmin, 'dmax', dmax, 'LL',-Fval, 'Estimated_Bounds',0,'Problem', problem);
else
    problem = createOptimProblem('fmincon', 'objective',@(y)bpareto_ll_v2(y,x), 'lb',[0,0, max(x),0], 'ub', [2,10,10000000, min(x)], 'x0',[0, 0, max(x), min(x)], 'options', options);
    [theta_hat,Fval] = run(ms,problem,1000);
    alpha = 1./(exp(theta_hat(2))*exp(-t*theta_hat(1)));
    Calibrated_Model = struct('Model', name,'lambda', theta_hat(1),'eta_zero', theta_hat(2), 'alpha', alpha, 'dmin',theta_hat(4), 'dmax', theta_hat(3), 'LL',-Fval, 'Estimated_Bounds',1,'Problem', problem);
end

end