%% This function calculates the probability of an outbreak of a given size
%% alpha is a sequence of tail parameters for the bounded pareto
%% dmin and dmax are the bounds of the pareto
%% outbreaksize is the size of the outbreak
function [OutbreakProb] = bpareto_outbreakprob(alpha,dmax,dmin, outbreaksize)
    OutbreakProb = 1-((1-dmin'.^alpha.*(outbreaksize).^(-alpha))./(1-(dmin'./dmax').^alpha));
    if min(OutbreakProb)<0
        OutbreakProb = NaN(1,size(alpha,2));
    end
end