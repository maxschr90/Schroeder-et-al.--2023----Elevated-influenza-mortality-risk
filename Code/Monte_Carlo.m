%% Monte Carlo
clear
clc
close all
load('Monte_Carlo_Input.mat')

for j = 1:14
    Estimates(j,:) = [Base_Model(j).lambda, Base_Model(j).eta_zero];
    alpha = 1./(exp(Estimates(j,2))*exp(-Estimates(j,1).*[0:36]));

    rng(1001) %% Seed
    Simulation = simulate_bpareto(10000,alpha, Base_Model(j).dmax, Base_Model(j).dmin);
    parfor i = 1:10000
        theta_hat(i,:,j) = est_parms_bpareto(Simulation(i,:)',dmax,dmin)
    end
    Sim{j} = Simulation;
    save("MC_output_v1.mat", 'theta_hat','Estimates','Sim', '-v7.3')
end

