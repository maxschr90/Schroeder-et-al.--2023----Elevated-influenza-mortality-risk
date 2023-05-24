This folder contains the files necessary for replicating the modeling analysis.

The function "Fit_Model.m" fits all the models mentioned in the main text and the supplementary materials.
The functions "Figure_*.m", "Fig_Scatter.R" and "Figures_SI_*.m" create the figures used in the main text and the supplementary
material.
The function "Monte_Carlo.m" runs the Monte Carlo simulations using the parameters saved in "Monte_Carlo_Input.mat" and outputs the simulation results to "MC_output_v1.mat".
The file "Fitted_Models_v1.mat" contains the fitted parameter values for all models.
All other functions are supplementary functions that are called in the execution of the main functions. They are stored in the "Auxiliary" subfolder.

For inquiries contact: Max Schroeder, email: m.schroeder.1@bham.ac.uk

Please note:
	1. The code includes two functions that were written by contributors to the mathworks community: i) AddLetters2Plots and ii) shadeplot.
	   We include these codes in line with the their usage policies, including the copyright notice and any further disclaimer 
	   with the function. We are grateful to the authors for providing us with their work.