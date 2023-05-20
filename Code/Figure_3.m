clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)
pa = subplot(2,2,1)
for n=1:8
    hold on
    plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
hold on
ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.4])
ylim([0,0.45])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)

pb = subplot(2,2,2)
%         p = get(pb, 'position');
%         p(1) = p(1) + 0.03;
%         p(3) = p(3) - 0.03;
%         set(pb, 'position', p);
for n=1:8
    hold on
    plot(years(26:end), bpareto_outbreakprob(Base_Model(n).alpha',Base_Model(n).dmax,Base_Model(n).dmin,750), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
hold on
ylabel(sprintf('Prob(>750 deaths/million)'),'fontsize',6)
leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',2);
leg.ItemTokenSize = [9,4.5];
legend boxoff
title(leg,'UK Cities (1918-19)','fontsize',6);
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.4])
ylim([0,0.45])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

pc = subplot(2,2,3)
plot(Influenza_EW(83:119,1),bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
hold on
plot(Influenza_EW(83:119,1),bpareto_outbreakprob(Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin,750), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
leg=legend('500 deaths/million', '750 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
leg.ItemTokenSize = [9,4.5];

legend boxoff
title(leg,'England & Wales (1918-19)','fontsize',6);
box off

ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.4])
ylim([0,0.45])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

pd = subplot(2,2,4)
plot(Influenza_US(21:end,1),bpareto_outbreakprob(Base_Model(9).alpha',Base_Model(9).dmax,Base_Model(9).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
hold on
plot(Influenza_US(21:end,1),bpareto_outbreakprob(Base_Model(9).alpha',Base_Model(9).dmax,Base_Model(9).dmin,750), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
leg=legend('500 deaths/million', '750 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
leg.ItemTokenSize = [9,4.5];
legend boxoff
title(leg,'United States (1918-19)','fontsize',6);
box off

ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.4])
ylim([0,0.45])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})

AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.04, 'VShift', -0.03, 'Direction', 'TopDown','fontsize',6)


h = figure(3);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 15];
exportgraphics(h,'../Figures/Figure_3.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_3.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_3.eps','BackgroundColor','none','Resolution', 900)
