%% This function calculates the probability of an outbreak of a given size for the Weibull distribution
%% w is a sequence of tail parameters for the weibull
%% outbreaksize is the size of the outbreak
function [OutbreakProb] = weibull_outbreakprob(w, outbreaksize)
    OutbreakProb =1 - (1+(w.^outbreaksize).*((2+log(w).*(outbreaksize*(outbreaksize+1).*log(w)-2*outbreaksize-1))./(log(w)-2)));
end