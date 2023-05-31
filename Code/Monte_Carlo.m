%% This code runs the Monte Carlo simulation
%% The default option is to simulate 10000 outbreak histories based on the estimated model parameters.
%% Be advised that this might take a long time to run (several days on a standard desktop computer or laptop).

clear
clc
close all

% Load input data
load('Monte_Carlo_Input.mat')

% Add path to auxiliary functions
addpath Auxiliary\

% Set number of simulated histories
n_sim = 10000;

% Loop through each model
for j = 1:14
    % Store lambda and eta_zero values for the current model
    Estimates(j,:) = [Base_Model(j).lambda, Base_Model(j).eta_zero];
    
    % Calculate alpha values based on lambda and eta_zero
    alpha = 1./(exp(Estimates(j,2))*exp(-Estimates(j,1).*[0:36]));

    % Set random number generator seed
    rng(1001)
    
    % Simulate bpareto distribution
    Simulation = simulate_bpareto(n_sim, alpha, Base_Model(j).dmax, Base_Model(j).dmin);
    
    % Estimate parameters using parallel computing
    parfor i = 1:n_sim
        theta_hat(i,:,j) = est_parms_bpareto_mc(Simulation(i,:)', Base_Model(j).dmax, Base_Model(j).dmin);
    end
    
    % Store simulation results and estimated parameters
    Sim{j} = Simulation;
    save("MC_output_v1.mat", 'theta_hat','Estimates','Sim', '-v7.3')
end
