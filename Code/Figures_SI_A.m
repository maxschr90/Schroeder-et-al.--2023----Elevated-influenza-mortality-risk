%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Appendix  Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models_v1.mat')
load("MC_output_v1.mat")
addpath Auxiliary\

Load_Data

Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x','>'};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1 A  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
temp =sumdatatables(table2array(Pneumonia),table2array(Bronchitis));
Respiratory = sumdatatables(temp,table2array(Bronchitis));



figure(1)
for b = 1:8
    subplot(4,2,b)
    plot(years,Respiratory(:,b),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6 ,'MarkerEdgeColor','red')
    ylim([0,max(Respiratory(:,b))*1.05])
    yticks([0,1000,round(max(Respiratory(:,b)),0)])
    xlim([1895,1950])
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',8)
    aa = get(gca,'YTickLabel');
    set(gca,'YTickLabel',aa,'fontsize',8)
    title(citynames(b),'FontSize',8,'FontWeight','bold');
    box off
end
AddLetters2Plots(figure(1), {'a', 'c', 'e', 'g' 'b', 'd', 'f', 'h'},'HShift', -0.07, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',8)

h = figure(1);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 14 15];
exportgraphics(h,'../Figures/SI_Figure_A-1.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_A-1.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_A-1.eps','BackgroundColor','none','Resolution', 900)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3 A  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all

London_SES = readtable('..\Data\London_SES_data.xlsx','Sheet', 'SES Data');
Glasgow_SES = readtable('..\Data\Glasgow_SES_data.xlsx','Sheet', 'SES Data');


figure(2)
temp = table2array(London_SES(:,[2,3]));
[b,bint] = regress(temp(:,1),[ones(length(temp),1),temp(:,2)]);
prediction = [ones(length(temp),1),temp(:,2)]*b;

subplot(1,2,1)
hold on
plot(temp(:,2),temp(:,1),'*','Color','black')
plot(temp(:,2),prediction,'-','Color','black')
xlabel({'Share of population','living in overcrowded conditions'})
ylabel({'Pre-pandemic infant mortality', '(deaths/1,000 births)'})
ylim([70,180])

title('London')

subplot(1,2,2)
temp = table2array(Glasgow_SES(:,[2,3]));
[b,bint] = regress(temp(:,1),[ones(length(temp),1),temp(:,2)]);
prediction = [ones(length(temp),1),temp(:,2)]*b;
hold on
plot(temp(:,2),temp(:,1),'*','Color','black')
plot(temp(:,2),prediction,'-','Color','black')
xlabel('Number of persons per room')
title('Glasgow')
ylim([70,180])
set(gca,'YTickLabel',{[]})

AddLetters2Plots(figure(2), {'a', 'b'},'HShift', -0.05, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',8)

h = figure(2);
h.Units='centimeters';
h.OuterPosition=[0 0 18 15];
exportgraphics(figure(2),'../Figures/SI_Figure_A-3.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(figure(2),'../Figures/SI_Figure_A-3.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(figure(2),'../Figures/SI_Figure_A-3.eps','BackgroundColor','none','Resolution', 900)