clear
clc
close all

load('Fitted_Models_v1')
Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x'};


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 5  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
ttt =[1:9,12];
for n=1:10
    i=ttt(n);
    outbreakrisk_500(n,:)=bpareto_outbreakprob(Base_Model(i).alpha',Base_Model(i).dmax,Base_Model(i).dmin,500);
end
slope_500(:,1) = (outbreakrisk_500(:,10) - outbreakrisk_500(:,1))./outbreakrisk_500(:,1)/10;
max_500 = outbreakrisk_500(:,1);

figure(5)
subplot(2,4,[4,8])
hold on

for i=1:10
    plot(nan,nan,Markertypes{i}, 'Color','black', 'Markersize',6 );
end
leg = legend([citynames,'United States', 'England & Wales'],'Location','best','FontSize',6,'Color','black')
legend boxoff
axis off

suba = subplot(2,4,1:3)
hold on

for i=1:10
    plot(mean_temp(i,3),max_500(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end

box off
ylim([0.25,0.4])
xlim([1000,3500])
ylabel({'Prob(>500 deaths/million)','maximum'},'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',{[]})
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)


subb = subplot(2,4,[5:7])
hold on
for i=1:10
    plot(mean_temp(i,3),slope_500(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlabel({'Average mortality across main waves (1918-19)'},'fontsize',6)
ylabel({'Prob(>500 deaths/million)','10-year slope'},'fontsize',6)

box off
xlim([1000,3500])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)
AddLetters2Plots({suba,subb}, {'a', 'b'}, 'HShift', -0.05, 'VShift', -0.05, 'Direction', 'TopDown','fontsize',6)



h = figure(5);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 10 12];
exportgraphics(h,'../Figures/Figure_5.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_5.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/Figure_5.eps','BackgroundColor','none','Resolution', 900)
