clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
for b = 1:8
    subplot(5,2,b)
    plot(years,Influenza_Cities(:,b+1),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6 ,'MarkerEdgeColor','red')
    ylim([0,max(Influenza_Cities(:,b+1))*1.05])
    yticks([0,1000,round(max(Influenza_Cities(:,b+1)),0)])
    xticks([])
    xlim([1895,1956])
    a = get(gca,'XTickLabel');
    set(gca,'XTickLabel',a,'fontsize',8)
    aa = get(gca,'YTickLabel');
    set(gca,'YTickLabel',aa,'fontsize',8)
    title(citynames(b),'FontSize',8,'FontWeight','bold');
    box off
end

subplot(5,2,b+1)
plot(Influenza_EW(58:119,1),Influenza_EW(58:119,2),'.-', 'Linewidth', 0.5, 'Color','red', 'Markersize',6  ,'MarkerEdgeColor','red')
ylim([0,max(Influenza_EW(58:119,2))*1.05])
yticks([0,1000,round(max(Influenza_EW(58:119,2)),0)])
xticks([1900:10:1950])
xtickangle(0)
xlim([1895,1956])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',8)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',8)
title('England & Wales','FontSize',8,'FontWeight','bold')
box off
subplot(5,2,b+2)
plot(Influenza_US(:,1),Influenza_US(:,2),'.-',  'Linewidth', 0.5, 'Color','red', 'Markersize', 6  ,'MarkerEdgeColor','red')
ylim([0,max(Influenza_US(:,2))*1.05])
yticks([0,1000,round(max(Influenza_US(:,2)),0)])
xticks([1900:10:1950])
xlim([1895,1956])
xtickangle(0)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',8)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',8)
title('United States','FontSize',8,'FontWeight','bold')
box off



AddLetters2Plots(figure(1), {'a', 'c', 'e', 'g', 'i', 'b', 'd', 'f', 'h', 'j'}, 'HShift', -0.07, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',8)

h = figure(1);
h.Units='centimeters';
h.OuterPosition=[0 0 18 15];
exportgraphics(figure(1),'../Figures/Figure_1.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(figure(1),'../Figures/Figure_1.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(figure(1),'../Figures/Figure_1.eps','BackgroundColor','none','Resolution', 900)

