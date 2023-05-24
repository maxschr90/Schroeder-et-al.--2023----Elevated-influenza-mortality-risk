%% This function evaluates the average log likelihood of the bounded pareto 
%% with estimated bounds
function ll = bpareto_ll_v2(y,x)
%% Construct path of tail parameter    
    ozero =y(2);
    lambda = y(1);
    t = [1:size(x,1)]'-1;
    alpha = 1./(exp(ozero)*exp(-t*lambda));
    dmax = y(3);
    dmin = y(4);
%% Replace missing values & calculate likelihood
    x(isnan(x))=pi;
    lik = (alpha.*dmin.^alpha.*x.^(-alpha-1))./(1-(dmin/dmax).^alpha);
%% Drop missing values
    lik(x==pi)=[];
%% Calculate average ll
    ll = - mean(log(lik));

end