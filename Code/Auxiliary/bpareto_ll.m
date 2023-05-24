%% This function evaluates the average log likelihood of the bounded pareto 
function ll = bpareto_ll(y,x,dmax,dmin)
%% Construct path of tail parameter    
    ozero = y(2);
    lambda = y(1);
    t = [1:size(x,1)]'-1;
    alpha = 1./(exp(ozero)*exp(-t*lambda));
%% Replace missing values & calculate likelihood
    x(isnan(x))=pi;
    lik = (alpha.*dmin.^alpha.*x.^(-alpha-1))./(1-(dmin/dmax).^alpha);
%% Drop missing values
    lik(x==pi)=[];
%% Calculate average ll
    ll = - mean(log(lik));

end