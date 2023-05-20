%%% This code fits the models presented in the main paper and the
%%% supplementary materials
clear
clc
close all
%%% 1. Load Data & Prepare Data
Load_Data % Loads data for Cities cities from excel file

%%% 2. Estimate Base Model
dmax_Cities = (max(Influenza_Cities(24:end,2:end)));
dmin_Cities = (min(Influenza_Cities(24:end,2:end)));
for n = 1:8
    [Base_Model(n)] = est_parms_bpareto(Influenza_Cities(26:end,n+1),dmax_Cities(n),dmin_Cities(n), citynames(n));
end
dmax_US = max(Influenza_US(19:end,2)');
dmin_US = min(Influenza_US(19:end,2)');
[Base_Model(n+1)] = est_parms_bpareto(Influenza_US(21:end,2),dmax_US,dmin_US, 'US');

dmax_EW_1848 = max(Influenza_EW(10:52,2)');
dmin_EW_1848 = min(Influenza_EW(10:52,2)');
[Base_Model(n+2)] = est_parms_bpareto(Influenza_EW(12:52,2),dmax_EW_1848,dmin_EW_1848, 'England&Wales 1848');

dmax_EW_1890 = max(Influenza_EW(53:80,2)');
dmin_EW_1890 = min(Influenza_EW(53:80,2)');
[Base_Model(n+3)] = est_parms_bpareto(Influenza_EW(55:80,2),dmax_EW_1890,dmin_EW_1890, 'England&Wales 1890');

dmax_EW_1918 = max(Influenza_EW(81:119,2)');
dmin_EW_1918 = min(Influenza_EW(81:119,2)');
[Base_Model(n+4)] = est_parms_bpareto(Influenza_EW(83:119,2),dmax_EW_1918,dmin_EW_1918, 'England&Wales 1918');

dmax_EW_1957 = max(Influenza_EW(120:130,2)');
dmin_EW_1957 = min(Influenza_EW(120:130,2)');
[Base_Model(n+5)] = est_parms_bpareto(Influenza_EW(123:130,2),dmax_EW_1957,dmin_EW_1957, 'England&Wales 1957');

dmax_EW_1968 = max(Influenza_EW(131:end,2)');
dmin_EW_1968 = min(Influenza_EW(131:end,2)');
[Base_Model(n+6)] = est_parms_bpareto(Influenza_EW(134:end,2),dmax_EW_1968,dmin_EW_1968, 'England&Wales 1968');

%%% 3. Estimate Model with common Bounds
dmax_Cities = (max(dmax_Cities));
dmin_Cities = (min(dmin_Cities));
for n = 1:8
    [Common_Bounds_Model(n)] = est_parms_bpareto(Influenza_Cities(26:end,n+1),dmax_Cities,dmin_Cities, citynames(n));
end

%%% 4. Estimate Model with theoretical Bounds

for n = 1:8
    [Theoretical_Bounds_Model(n)] = est_parms_bpareto(Influenza_Cities(26:end,n+1),1000000,1, citynames(n));
end

[Theoretical_Bounds_Model(n+1)] = est_parms_bpareto(Influenza_US(21:end,2),1000000,1, 'US');

[Theoretical_Bounds_Model(n+2)] = est_parms_bpareto(Influenza_EW(12:52,2),1000000,1, 'England&Wales 1848');

[Theoretical_Bounds_Model(n+3)] = est_parms_bpareto(Influenza_EW(55:80,2),1000000,1, 'England&Wales 1890');

[Theoretical_Bounds_Model(n+4)] = est_parms_bpareto(Influenza_EW(83:119,2),1000000,1, 'England&Wales 1918');

[Theoretical_Bounds_Model(n+5)] = est_parms_bpareto(Influenza_EW(123:130,2),1000000,1, 'England&Wales 1957');

[Theoretical_Bounds_Model(n+6)] = est_parms_bpareto(Influenza_EW(134:end,2),1000000,1, 'England&Wales 1968');


%%% 5. Estimate Model with estimated Bounds

for n = 1:8
    [Estimated_Bounds_Model(n)] = est_parms_bpareto(Influenza_Cities(24:end,n+1),[],[], citynames(n));
end
[Estimated_Bounds_Model(n+1)] = est_parms_bpareto(Influenza_US(19:end,2),[],[], 'US');

[Estimated_Bounds_Model(n+2)] = est_parms_bpareto(Influenza_EW(11:52,2),[],[], 'England&Wales 1848');

[Estimated_Bounds_Model(n+3)] = est_parms_bpareto(Influenza_EW(53:80,2),[],[], 'England&Wales 1890');

[Estimated_Bounds_Model(n+4)] = est_parms_bpareto(Influenza_EW(81:119,2),[],[], 'England&Wales 1918');

[Estimated_Bounds_Model(n+5)] = est_parms_bpareto(Influenza_EW(120:130,2),[],[], 'England&Wales 1957');

[Estimated_Bounds_Model(n+6)] = est_parms_bpareto(Influenza_EW(131:end,2),[],[], 'England&Wales 1968');


%%% 6. Estimate Weibull Model
%%% Deaths need to be rescaled for Weibull Distribution
for n = 1:8
    [Weibull_Model(n)] = est_parms_weibull(Influenza_Cities(26:end,n+1)/10, citynames(n));
end
[Weibull_Model(n+1)] = est_parms_weibull(Influenza_US(21:end,2)/10, 'US');

[Weibull_Model(n+2)] = est_parms_weibull(Influenza_EW(12:52,2)/10, 'England&Wales 1848');

[Weibull_Model(n+3)] = est_parms_weibull(Influenza_EW(55:80,2)/10, 'England&Wales 1890');

[Weibull_Model(n+4)] = est_parms_weibull(Influenza_EW(83:119,2)/10, 'England&Wales 1918');

[Weibull_Model(n+5)] = est_parms_weibull(Influenza_EW(123:130,2)/10, 'England&Wales 1957');

[Weibull_Model(n+6)] = est_parms_weibull(Influenza_EW(134:end,2)/10, 'England&Wales 1968');


%%% 7. Model Summary Tables
% Base Model
Obs = [sum(Influenza_Cities(26:end,2:9)==Influenza_Cities(26:end,2:9)), sum(Influenza_US(21:end,2)==Influenza_US(21:end,2)),sum(Influenza_EW(12:52,2)==Influenza_EW(12:52,2)),sum(Influenza_EW(55:80,2)==Influenza_EW(55:80,2)),sum(Influenza_EW(83:119,2)==Influenza_EW(83:119,2)),sum(Influenza_EW(123:130,2)==Influenza_EW(123:130,2)),sum(Influenza_EW(133:end,2)==Influenza_EW(133:end,2))];

for n=1:14
    Parameters(:,n) = round([(Base_Model(n).lambda) (Base_Model(n).eta_zero) (Base_Model(n).dmin) (Base_Model(n).dmax)],3);
end

names = {'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales 1848','England & Wales 1890','England & Wales 1918','England & Wales 1957','England & Wales 1968'};

for b =1:14
    T1(:,b) = table([Parameters(:,b);Obs(b)]);
end
T1.Properties.VariableNames = names;
T1 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations'}') T1];
writetable(T1,'../Figures/Table_3_v2.xlsx', 'Sheet', 'Base Model')

% Model with common bounds
for n=1:8
    Parameters(:,n) = round([(Common_Bounds_Model(n).lambda) (Common_Bounds_Model(n).eta_zero) (Common_Bounds_Model(n).dmin) (Common_Bounds_Model(n).dmax) ],3);
end

names = { 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'};

for b =1:8
    T2(:,b) = table([Parameters(:,b);Obs(b)]);
end
T2.Properties.VariableNames = names;
T2 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations'}') T2];
writetable(T2,'../Figures/Table_3_v2.xlsx', 'Sheet', 'Common Bounds Model')

% Model with estimated bounds
for n=1:14
    Parameters(:,n) = round([(Estimated_Bounds_Model(n).lambda) (Estimated_Bounds_Model(n).eta_zero) (Estimated_Bounds_Model(n).dmin) (Estimated_Bounds_Model(n).dmax) ],3);
end

names = {'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales 1848','England & Wales 1890','England & Wales 1918','England & Wales 1957','England & Wales 1968'};

for b =1:14
    T3(:,b) = table([Parameters(:,b);Obs(b)]);
end
T3.Properties.VariableNames = names;
T3 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations' }') T3];
writetable(T3,'../Figures/Table_3_v2.xlsx', 'Sheet', 'Estimated Bounds Model')


% Model with theoretical bounds
for n=1:14
    Parameters(:,n) = round([(Theoretical_Bounds_Model(n).lambda) (Theoretical_Bounds_Model(n).eta_zero) (Theoretical_Bounds_Model(n).dmin) (Theoretical_Bounds_Model(n).dmax) ],3);
end

names = {'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales 1848','England & Wales 1890','England & Wales 1918','England & Wales 1957','England & Wales 1968'};

for b =1:14
    T4(:,b) = table([Parameters(:,b);Obs(b)]);
end
T4.Properties.VariableNames = names;
T4 = [table({ '\lambda', '\eta_{0}', 'd_{min}', 'd_{max}', 'Observations'}') T4];
writetable(T4,'../Figures/Table_3_v2.xlsx', 'Sheet', 'Theoretical Bounds Model')

% Weibull
Parameters =[];
for n=1:14
    Parameters(:,n) = round([(Weibull_Model(n).lambda) (Weibull_Model(n).eta_zero)  ],3);
end

names = {'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales 1848','England & Wales 1890','England & Wales 1918','England & Wales 1957','England & Wales 1968'};

for b =1:14
    T5(:,b) = table([Parameters(:,b);Obs(b)]);
end
T5.Properties.VariableNames = names;
T5 = [table({ '\lambda', '\eta_{0}', 'Observations'}') T5];
writetable(T5,'../Figures/Table_3_v2.xlsx', 'Sheet', 'Weibull Model')

%%% 8. Mortality Summary Tables
Influenza_Cities(25,2) = 996; %% Add missing Belfast number
mean_temp = [mean(Influenza_Cities(4:13,2:end),'omitnan')'; mean(Influenza_US(1:8,2)); mean(Influenza_EW(61:70,2))];
mean_temp = [mean_temp,[mean(Influenza_Cities(14:23,2:end),'omitnan')'; mean(Influenza_US(9:18,2)); mean(Influenza_EW(71:80,2))]];
mean_temp = [mean_temp,[mean(Influenza_Cities(24:25,2:end),'omitnan')'; mean(Influenza_US(19:21,2)); mean(Influenza_EW(81:82,2))]];
mean_temp = [mean_temp,[mean(Influenza_Cities(26:35,2:end),'omitnan')'; mean(Influenza_US(22:31,2)); mean(Influenza_EW(83:92,2))]];
mean_temp = [mean_temp,[mean(Influenza_Cities(36:45,2:end),'omitnan')'; mean(Influenza_US(32:41,2)); mean(Influenza_EW(93:102,2))]];
mean_temp = [mean_temp,[mean(Influenza_Cities(46:55,2:end),'omitnan')'; mean(Influenza_US(42:51,2)); mean(Influenza_EW(103:112,2))]];
mean_temp = round(mean_temp);

max_temp = [max(Influenza_Cities(4:13,2:end))'; max(Influenza_US(1:8,2)); max(Influenza_EW(61:70,2))];
max_temp = [max_temp,[max(Influenza_Cities(14:23,2:end))'; max(Influenza_US(9:18,2)); max(Influenza_EW(71:80,2))]];
max_temp = [max_temp,[max(Influenza_Cities(24:25,2:end))'; max(Influenza_US(19:21,2)); max(Influenza_EW(81:82,2))]];
max_temp = [max_temp,[max(Influenza_Cities(26:35,2:end))'; max(Influenza_US(22:31,2)); max(Influenza_EW(83:92,2))]];
max_temp = [max_temp,[max(Influenza_Cities(36:45,2:end))'; max(Influenza_US(32:41,2)); max(Influenza_EW(93:102,2))]];
max_temp = [max_temp,[max(Influenza_Cities(46:55,2:end))'; max(Influenza_US(42:51,2)); max(Influenza_EW(103:112,2))]];
max_temp = round(max_temp);

min_temp = [min(Influenza_Cities(4:13,2:end))'; min(Influenza_US(1:8,2)); min(Influenza_EW(61:70,2))];
min_temp = [min_temp,[min(Influenza_Cities(14:23,2:end))'; min(Influenza_US(9:18,2)); min(Influenza_EW(71:80,2))]];
min_temp = [min_temp,[min(Influenza_Cities(24:25,2:end))'; min(Influenza_US(19:21,2)); min(Influenza_EW(81:82,2))]];
min_temp = [min_temp,[min(Influenza_Cities(26:35,2:end))'; min(Influenza_US(22:31,2)); min(Influenza_EW(83:92,2))]];
min_temp = [min_temp,[min(Influenza_Cities(36:45,2:end))'; min(Influenza_US(32:41,2)); min(Influenza_EW(93:102,2))]];
min_temp = [min_temp,[min(Influenza_Cities(46:55,2:end))'; min(Influenza_US(42:51,2)); min(Influenza_EW(103:112,2))]];
min_temp = round(min_temp);

for i=1:10
    for j=1:6
        ttt(i,j)= {strcat(int2str(min_temp(i,j)),'-',int2str(max_temp(i,j)))};
    end
end
ttt = splitvars(cell2table(ttt));
tt = splitvars(table(mean_temp));
t = table({'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield','US','England & Wales'}');

ttt.Properties.VariableNames = {'1898-1907',	'1908-1917',	'1918/19',	'1920-29',	'1930-39',	'1940-1949'};
tt.Properties.VariableNames = {'1898-1907',	'1908-1917',	'1918/19',	'1920-29',	'1930-39',	'1940-1949'};

writetable(tt,'../Figures/Table_1_v2.xlsx', 'Sheet', 'Means', 'Range', 'B2:G12','WriteVariableNames',true)
writetable(t,'../Figures/Table_1_v2.xlsx', 'Sheet', 'Means', 'Range', 'A2:A12')
writetable(ttt,'../Figures/Table_1_v2.xlsx', 'Sheet', 'Range', 'Range', 'B2:G12','WriteVariableNames',true)
writetable(t,'../Figures/Table_1_v2.xlsx', 'Sheet', 'Range', 'Range', 'A2:A12')

mean_temp_1848 = [mean(Influenza_EW(1:9,2)),mean(Influenza_EW(10:11,2)),mean(Influenza_EW(12:21,2)),mean(Influenza_EW(22:31,2))];
mean_temp_1890 = [mean(Influenza_EW(43:52,2)),mean(Influenza_EW(53:54,2)),mean(Influenza_EW(55:64,2)),mean(Influenza_EW(65:74,2))];
mean_temp_1918 = [mean(Influenza_EW(71:80,2)),mean(Influenza_EW(81:82,2)),mean(Influenza_EW(83:92,2)),mean(Influenza_EW(93:102,2))];
mean_temp_1957 = [mean(Influenza_EW(110:119,2)),mean(Influenza_EW(120:122,2)),mean(Influenza_EW(123:132,2)),mean(Influenza_EW(133:142,2))];
mean_temp_1968 = [mean(Influenza_EW(121:130,2)),mean(Influenza_EW(131:133,2)),mean(Influenza_EW(134:143,2)),mean(Influenza_EW(144:153,2))];
mean_EW = [mean_temp_1848;mean_temp_1890;mean_temp_1918;mean_temp_1957;mean_temp_1968];

max_temp_1848 = [max(Influenza_EW(1:9,2)),max(Influenza_EW(10:11,2)),max(Influenza_EW(12:21,2)),max(Influenza_EW(22:31,2))];
max_temp_1890 = [max(Influenza_EW(43:52,2)),max(Influenza_EW(53:54,2)),max(Influenza_EW(55:64,2)),max(Influenza_EW(65:74,2))];
max_temp_1918 = [max(Influenza_EW(71:80,2)),max(Influenza_EW(81:82,2)),max(Influenza_EW(83:92,2)),max(Influenza_EW(93:102,2))];
max_temp_1957 = [max(Influenza_EW(110:119,2)),max(Influenza_EW(120:122,2)),max(Influenza_EW(123:132,2)),max(Influenza_EW(133:142,2))];
max_temp_1968 = [max(Influenza_EW(121:130,2)),max(Influenza_EW(131:133,2)),max(Influenza_EW(134:143,2)),max(Influenza_EW(144:153,2))];
max_EW = [max_temp_1848;max_temp_1890;max_temp_1918;max_temp_1957;max_temp_1968];

min_temp_1848 = [min(Influenza_EW(1:9,2)),min(Influenza_EW(10:11,2)),min(Influenza_EW(12:21,2)),min(Influenza_EW(22:31,2))];
min_temp_1890 = [min(Influenza_EW(43:52,2)),min(Influenza_EW(53:54,2)),min(Influenza_EW(55:64,2)),min(Influenza_EW(65:74,2))];
min_temp_1918 = [min(Influenza_EW(71:80,2)),min(Influenza_EW(81:82,2)),min(Influenza_EW(83:92,2)),min(Influenza_EW(93:102,2))];
min_temp_1957 = [min(Influenza_EW(110:119,2)),min(Influenza_EW(120:122,2)),min(Influenza_EW(123:132,2)),min(Influenza_EW(133:142,2))];
min_temp_1968 = [min(Influenza_EW(121:130,2)),min(Influenza_EW(131:133,2)),min(Influenza_EW(134:143,2)),min(Influenza_EW(144:153,2))];
min_EW = [min_temp_1848;min_temp_1890;min_temp_1918;min_temp_1957;min_temp_1968];

for i=1:5
    for j=1:4
        tttt(i,j)= {strcat(int2str(min_EW(i,j)),'-',int2str(max_EW(i,j)))};
    end
end
tttt = splitvars(cell2table(tttt));
tt = splitvars(table(mean_EW));
t = table({'England & Wales 1848-49','England & Wales 1890-91','England & Wales 1918-19','England & Wales 1967-59','England & Wales 1968-70'}');

tttt.Properties.VariableNames = {'Preceeding decade',	'Main waves',	'Post-pandemic decade I',	'Post-pandemic decade II' };
tt.Properties.VariableNames = {'Preceeding decade',	'Main waves',	'Post-pandemic decade I',	'Post-pandemic decade II' };

writetable(tt,'../Figures/Table_2_v2.xlsx', 'Sheet', 'Means', 'Range', 'B2:G12','WriteVariableNames',true)
writetable(t,'../Figures/Table_2_v2.xlsx', 'Sheet', 'Means', 'Range', 'A2:A12')
writetable(tttt,'../Figures/Table_2_v2.xlsx', 'Sheet', 'Range', 'Range', 'B2:G12','WriteVariableNames',true)
writetable(t,'../Figures/Table_2_v2.xlsx', 'Sheet', 'Range', 'Range', 'A2:A12')


%%% Save Results

save('Fitted_Models_v1')
save('Monte_Carlo_Input','Base_Model')
clearvars






