%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};

MainWave(1) = mean([285, 459]);
MainWave(2) = mean([157, 574]);
MainWave(3) = mean([3301.46362304688,1264.60046386719]);
MainWave(4) = mean([95.9169845581055,97.1312026977539,148.288146972656]);

figure(4)
pa = subplot(2,2,1)
plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin,MainWave(1)/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin,MainWave(1)/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(12:52,1), bpareto_outbreakprob(Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin,MainWave(1)/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
leg=legend('2/3','1/2','1/3')
leg.ItemTokenSize = [9,4.5];
title(leg,{'Threshold relative', 'to average across', 'main waves'})
legend boxoff
xlim([1848,1890])
xticks([1850:5:1890])
xtickangle(0)
yticks([0:0.05:0.3])
ylim([0,0.3])
yticklabels([0:0.05:0.3])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1847-48')
box off
ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)

pb = subplot(2,2,2)

plot(Influenza_EW(55:80,1), bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,MainWave(2)/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(55:80,1), bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,MainWave(2)/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(55:80,1), bpareto_outbreakprob(Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin,MainWave(2)/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

xlim([1891,1918])
xticks([1890:5:1915])
xticklabels([1890:5:1915])
xtickangle(0)
yticks([0:0.1:1])
ylim([0,1])
yticklabels([0:0.1:1])
b = get(gca,'XTickLabel');
set(gca,'XTickLabel',b,'fontsize',6)
bb = get(gca,'YTickLabel');
set(gca,'YTickLabel',bb,'fontsize',6)
title('England & Wales 1890-91')
box off

ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)

pc = subplot(2,2,3)

plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,MainWave(3)/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,MainWave(3)/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(83:119,1), bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,MainWave(3)/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

xlim([1919,1957])
xticks([1920:5:1955])
xtickangle(0)
yticks([0:0.05:0.35])
ylim([0,0.35])
yticklabels([0:0.05:0.35])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1918-19')
box off
ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)

pd = subplot(2,2,4)
plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Base_Model(14).alpha',Base_Model(14).dmax,Base_Model(14).dmin,MainWave(4)/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Base_Model(14).alpha',Base_Model(14).dmax,Base_Model(14).dmin,MainWave(4)/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(134:end,1), bpareto_outbreakprob(Base_Model(14).alpha',Base_Model(14).dmax,Base_Model(14).dmin,MainWave(4)/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

xlim([1970,2001])
xticks([1970:5:2000])
xtickangle(0)
yticks([0:0.05:0.3])
ylim([0,0.3])
yticklabels([0:0.05:0.3])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1968-70')
box off
ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)

AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.06, 'VShift', -0.045, 'Direction', 'TopDown','fontsize',6)

h = figure(4);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 14];
exportgraphics(h,'../Figures/Figure_4.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_4.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_4.eps','BackgroundColor','none','Resolution', 900)
