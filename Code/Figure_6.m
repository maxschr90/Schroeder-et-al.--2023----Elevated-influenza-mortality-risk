clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 6  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(6)
suba = subplot(1,8,[1:3])
hold on
for i=1:10
    plot(mean_temp(i,3),mean_temp(i,4),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlabel({'Average mortality across main waves (1918-19)'},'Fontsize',6)
ylabel({'Average mortality in', 'first post-pandemic decade'},'Fontsize',6)

box off
xlim([1000,3500])
ylim([230,450])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)

subb = subplot(1,8,[4:6])

hold on
for i=1:10
    plot(average_infant_mort(i),mean_temp(i,4),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlim([120,170])
ylim([230,450])
xticks(125:20:170)
box off
xlabel({'Pre-pandemic infant mortality'},'Fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
set(gca,'yticklabel',{[]})


subplot(1,8,[7:8])

hold on
for i=1:10
    plot(NaN,NaN,Markertypes{i}, 'Color','black', 'Markersize',6 );
end
legend([citynames,'United States', 'England & Wales'],'Location','best','FontSize',6,'Color','black')
legend boxoff
axis off


AddLetters2Plots({suba  ,subb }, {'a', 'b'}, 'HShift', -0.02, 'VShift', -0.075, 'Direction', 'TopDown','fontsize',6)

h = figure(6);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 8];
exportgraphics(h,'../Figures/Figure_6.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_6.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_6.eps','BackgroundColor','none','Resolution', 900)
