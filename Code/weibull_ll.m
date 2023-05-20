%% This function evaluates the average log likelihood of the Weibull 

function [ll] = weibull_ll(lam,x)
%% Construct path of tail parameter    
    t = [1:size(x,1)]'-1;
    w =  ((lam(2))*exp(-t*lam(1)));
%% Replace missing values & calculate likelihood
    x(isnan(x))=pi;
    lik = (((log(w).^3)./(log(w)-2)).*(x.*(x+1)).*w.^x);
%% Drop missing values
    lik(x==pi)=[];
%% Calculate average ll
    ll=-mean(log(lik));
end
