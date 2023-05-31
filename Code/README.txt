This folder contains the files necessary for replicating the modeling analysis.

To replicate the analysis in the main paper and the Supplementary Information proceed as follows:

	1. Run the function "Fit_Model.m" which fits all the models mentioned in the main text and the supplementary materials. All relevant results and data are stored in 		   a .mat file called 'Fitted_Models_v1.mat' which is called by later functions creating the figures. It also stores the parameters of the base model in the file	   	   "Monte_Carlo_Input.mat" which is used in the Monte Carlo simulations.
	
	2. Run the function "Monte_Carlo.m" to run the Monte Carlo simulations using the parameters saved in "Monte_Carlo_Input.mat". The procedure outputs the simulation 	    	   results to "MC_output_v1.mat". Running the Monte Carlo simulation can take considerable ammount of time and is therefore not recommended. 
	   This repo comes with a finished version of the Monte Carlo simulation which can be used to create the relevant figures.


	3. You can create the Figures used in the main text and the supplementary by running the functions "Figure_*.m", "Fig_Scatter.R" and "Figures_SI_*.m".
	   

All other functions are supplementary functions that are called in the execution of the main functions. They are stored in the "Auxiliary" subfolder.

Please note:

The code includes two functions that were written by contributors to the mathworks community: i) AddLetters2Plots and ii) shadeplot.
We include these codes in line with the their usage policies, including the copyright notice and any further disclaimer 
with the function. We are grateful to the authors for providing us with their work.

For inquiries contact: Max Schroeder, email: m.schroeder.1@bham.ac.uk
