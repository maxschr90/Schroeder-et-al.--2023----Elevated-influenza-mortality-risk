%% This function evaluates the average log likelihood of the bounded pareto given data x, and vector of parameters y

function [ll] = weibull_ll(y,x)
%% Construct path of tail parameter
t = [1:size(x,1)]'-1;
w = ((y(2))*exp(-t*y(1)));
%% Replace missing values & calculate likelihood
x(isnan(x))=pi;
lik = (((log(w).^3)./(log(w)-2)).*(x.*(x+1)).*w.^x);
%% Drop missing values
lik(x==pi)=[];
%% Calculate average ll
ll=-mean(log(lik));
end
