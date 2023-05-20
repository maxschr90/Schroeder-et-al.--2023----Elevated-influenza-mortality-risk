%% This function calculates the value of the cdf to the right of x
function cdf =  weibullcdf(x,w)

cdf =1 - (1+(w.^x).*((2+log(w).*(x*(x+1).*log(w)-2*x-1))./(log(w)-2)));

end
