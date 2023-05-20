
clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
plot(Influenza_EW(1:end,1),Influenza_EW(1:end,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')
hold on
patch([1846.5,1846.5, 1889.5, 1889.5],[0 max(ylim) max(ylim) 0], [0.9 0.9 0.9],'EdgeColor','none')
patch([1889.5,1889.5, 1917.5, 1917.5],[0 max(ylim) max(ylim) 0], [0.8 0.8 0.8],'EdgeColor','none')
patch([1917.5,1917.5, 1956.5, 1956.5],[0 max(ylim) max(ylim) 0], [0.9 0.9 0.9],'EdgeColor','none')
patch([1956.5,1956.5, 1967.5, 1967.5],[0 max(ylim) max(ylim) 0], [0.8 0.8 0.8],'EdgeColor','none')
patch([1967.5,1967.5, 2000.5, 2000.5],[0 max(ylim) max(ylim) 0], [0.9 0.9 0.9],'EdgeColor','none')

plot(Influenza_EW(1:end,1),Influenza_EW(1:end,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')
set(gca, 'Layer', 'top')
ylabel('Mortality rate (deaths/million)')
box off
xticks([1840:20:2000])
xtickangle(0)
xlim([1833,2000])
ylim([-0,3500])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',8)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',8)

axes('Position',[.704 .45 .2005 .25])
box on
plot(Influenza_EW(120:end,1),Influenza_EW(120:end,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')
yticks([0,100,200])

xticks([1960:10:2000])
xtickangle(0)
xlim([1957,2000])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)

axes('Position',[.1525 .45 .35 .25])
box on
plot(Influenza_EW(1:80,1),Influenza_EW(1:80,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')
yticks([0,250,500])

xticks([1840:10:1920])
xtickangle(0)
xlim([1838,1914])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
h = figure(2);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 10];
exportgraphics(h,'../Figures/Figure_2.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_2.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_2.eps','BackgroundColor','none','Resolution', 900)

