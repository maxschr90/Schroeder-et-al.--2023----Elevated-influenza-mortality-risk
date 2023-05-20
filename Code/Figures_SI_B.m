%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% SI B  Figures  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
clc
close all
load('Fitted_Models_v1.mat')
load("MC_output_v1.mat")

Linemarkertypes = {'-p','-o','-h','-s','-d','-*','-v','-^','-+','-x'};
Markertypes = {'p','o','h','s','d','*','v','^','+','x','>'};

MainWave(1) = mean([285, 459]);
MainWave(2) = mean([157, 574]);
MainWave(3) = mean([3301.46362304688,1264.60046386719]);
MainWave(4) = mean([95.9169845581055,97.1312026977539,148.288146972656]);

ttt =[1:9,12];
for n=1:10
    i=ttt(n);
    outbreakrisk_500(n,:)=bpareto_outbreakprob(Base_Model(i).alpha',Base_Model(i).dmax,Base_Model(i).dmin,500);
    outbreakrisk_750(n,:)=bpareto_outbreakprob(Base_Model(i).alpha',Base_Model(i).dmax,Base_Model(i).dmin,750);
end
slope_500(:,1) = (outbreakrisk_500(:,10) - outbreakrisk_500(:,1))./outbreakrisk_500(:,1)/10;
slope_500(:,2) = (outbreakrisk_500(:,20) - outbreakrisk_500(:,1))./outbreakrisk_500(:,1)/20;
max_500 = outbreakrisk_500(:,1);
slope_750(:,1) = (outbreakrisk_750(:,10) - outbreakrisk_750(:,1))./outbreakrisk_750(:,1)/10;
slope_750(:,2) = (outbreakrisk_750(:,20) - outbreakrisk_750(:,1))./outbreakrisk_750(:,1)/20;
max_750 = outbreakrisk_750(:,1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 1 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(3)
pa=subplot(5,2,1)
C = theta_hat(:,:,1);
trueparms = Estimates(1,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Belfast','1918-19'},'FontSize',8,'FontWeight','bold')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pb=subplot(5,2,2)
C = theta_hat(:,:,2);
trueparms = Estimates(2,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")
% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Birmingham','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pc=subplot(5,2,3)
C = theta_hat(:,:,3);
trueparms = Estimates(3,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Cardiff','1918-19'},'FontSize',8,'FontWeight','bold')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pd=subplot(5,2,4)
C = theta_hat(:,:,4);
trueparms = Estimates(4,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Glasgow','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pe=subplot(5,2,5)
C = theta_hat(:,:,5);
trueparms = Estimates(5,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Liverpool', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pf=subplot(5,2,6)
C = theta_hat(:,:,6);
trueparms = Estimates(6,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'London', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
% ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pg=subplot(5,2,7)
C = theta_hat(:,:,7);
trueparms = Estimates(7,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Manchester', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pj=subplot(5,2,8);
C = theta_hat(:,:,8);
trueparms = Estimates(8,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0.0,prctile(C(:,1),90),50)],[linspace(0.,prctile(C(:,2),90),50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'Sheffield', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
% xlabel('\lambda')
box off

pk=subplot(5,2,9);

C = theta_hat(:,:,12);
trueparms = Estimates(12,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0,0.25,50)],[linspace(0.,7.5,50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
xlabel('\lambda')
box off

pl=subplot(5,2,10);
C = theta_hat(:,:,9);
trueparms = Estimates(9,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0.,0.6,50)],[linspace(0,16,50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'United States','1918-19'},'FontSize',8,'FontWeight','bold')
% ylabel('\eta_{0}')
xlabel('\lambda')
box off

AddLetters2Plots({pa, pb, pc, pd, pe, pf, pg, pj, pk, pl},{'a','b','c','d','e','f','g','h','i','j'}, 'HShift', -0.05, 'VShift', -0.03, 'Direction', 'TopDown','FontSize',8)

h = figure(3);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 25];
exportgraphics(h,'../Figures/SI_Figure_B-1.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-1.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-1.eps','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 2 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(4)
pa=subplot(4,1,1)
C = theta_hat(:,:,10);
trueparms = Estimates(10,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0,0.5,50)],[linspace(0.,14,50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1847-48'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pb=subplot(4,1,2)
C = theta_hat(:,:,11);
trueparms = Estimates(11,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0,0.2,50)],[linspace(0.,5,50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1890-91'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
% xlabel('\lambda')
box off

pc = subplot(4,1,3)
C = theta_hat(:,:,12);
trueparms = Estimates(12,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0,0.25,50)],[linspace(0.,7.5,50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1918-19'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
box off


pd=subplot(4,1,4)
C = theta_hat(:,:,14);
trueparms = Estimates(14,1:2);
[~, xi]= ksdensity(C(:,1));
[~, yi]= ksdensity(C(:,2));
[x1,x2] = meshgrid([linspace(0,0.3,50)],[linspace(0.,10,50)]);
[A,B]=ksdensity(C,[x1(:) x2(:)]);

contour(x1,x2,reshape(A,[size(x1,1)],[]),'ShowText','off')
colormap("jet")

% colorbar
hold on
ha=plot(trueparms(1),trueparms(2),'*','Color','black','MarkerSize',6)
hb=plot(median(C(:,1)),median(C(:,2)),'o','Color','black','MarkerSize',6)
title({'England & Wales', '1968-70'},'FontSize',8,'FontWeight','bold')
% legend([ha,hb],'True Parameter',  'Median of Estimates')
ylabel('\eta_{0}')
xlabel('\lambda')
box off
AddLetters2Plots({pa, pb, pc, pd },{'a','b','c','d' }, 'HShift', -0.05, 'VShift', -0.025, 'Direction', 'TopDown','FontSize',8)

h = figure(4);
%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 25];
exportgraphics(h,'../Figures/SI_Figure_B-2.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-2.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-2.eps','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 3 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for b = 1:8
    InvCdf(:,:,b) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b).alpha',Base_Model(b).dmax,Base_Model(b).dmin);
end
InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(b+1).alpha',Base_Model(b+1).dmax,Base_Model(b+1).dmin);
InvCdf_EW_1918(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(12).alpha',Base_Model(12).dmax,Base_Model(12).dmin);

figure(5)
for b = 1:8
    subplot(5,2,b)
    [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:,b), InvCdf(5,:,b), [0.95 0.95 0.95],[0.95 0.95 0.95]);
    hold on
    [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:,b), InvCdf(4,:,b), [0.9 0.9 0.9],[0.9 0.9 0.9]);
    hold on
    plot(InvCdf(3,:,b),'Color','black')
    hf = plot((Influenza_Cities(26:end,b+1)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3 )
    xlim([0,37])
    ylim([0,max(InvCdf(5,:,b)*1.05)])
    xticks([1 6 11 16 21 26 31 36])
    xtickangle(0)
    xticklabels([])
    yticks([0,sort(round(max(Influenza_Cities(26:end,b+1)),0)),round(max(InvCdf(5,:,b)))])
    title({citynames{b},'1918-19'},'FontSize',8,'FontWeight','bold')
    box off
end
subplot(5,2,9)
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(1,:), InvCdf_EW_1918(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(2,:), InvCdf_EW_1918(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1918(3,:),'Color','black')

hf = plot((Influenza_EW(83:119,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3)
xlim([0,37])
xticks([1 6 11 16 21 26 31 36])
xtickangle(0)
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
ylim([0,max(max(InvCdf_EW_1918(5,:)),max(Influenza_EW(83:end,2)))*1.05])

yticks(sort([0,round(max(InvCdf_EW_1918(5,:))),round(max(Influenza_EW(83:end,2)),0)]))
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1918-19'},'FontSize',8,'FontWeight','bold')
box off

subplot(5,2,10)

InvCdf_US(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(9).alpha',Base_Model(9).dmax,Base_Model(9).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_US(3,:),'Color','black')

hf = plot((Influenza_US(21:end,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,37])
xticks([1 6 11 16 21 26 31 36])
xtickangle(0)
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
ylim([0,max(InvCdf_US(5,:)*1.05)])
yticks([0,round(max(Influenza_US(21:end,2)),0),round(max(InvCdf_US(5,:)))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'United States','1918-19'},'FontSize',8,'FontWeight','bold')
box off

AddLetters2Plots(figure(5), {'a', 'b', 'c', 'd', 'e',  'f', 'g', 'h','i','j'}, 'HShift', -0.07, 'VShift', -0.07, 'Direction', 'TopDown','fontsize',8)

h = figure(5);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 25];
exportgraphics(h,'../Figures/SI_Figure_B-3.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-3.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-3.eps','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 4 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



figure(6)

subplot(4,1,1)
InvCdf_EW_1848(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(10).alpha',Base_Model(10).dmax,Base_Model(10).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1848,2), InvCdf_EW_1848(1,:), InvCdf_EW_1848(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1848,2), InvCdf_EW_1848(2,:), InvCdf_EW_1848(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1848(3,:),'Color','black')

hf = plot((Influenza_EW(12:52,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,42])
xticks([2 12 22 32 42])
xticklabels({'1850', '1860','1870','1880','1890'})

ylim([0,max(max(InvCdf_EW_1848(5,:)),max(Influenza_EW(12:52,2)))*1.05])
yticks([0,round(max(Influenza_EW(12:52,2)),0),round(max(InvCdf_EW_1848(5,:)))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1847-48'},'FontSize',8,'FontWeight','bold')
box off

subplot(4,1,2)
InvCdf_EW_1890(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(11).alpha',Base_Model(11).dmax,Base_Model(11).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1890,2), InvCdf_EW_1890(1,:), InvCdf_EW_1890(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1890,2), InvCdf_EW_1890(2,:), InvCdf_EW_1890(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1890(3,:),'Color','black')

hf = plot((Influenza_EW(55:80,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,27])
xticks([1 6 11 16 21 26])
xticklabels({'1892', '1897','1902','1907','1912','1917'})

ylim([0,max(max(InvCdf_EW_1890(5,:)),max(Influenza_EW(55:80,2)))*1.05])
yticks([0,sort(round(max(Influenza_EW(55:80,2)),0),round(max(InvCdf_EW_1890(5,:))))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1890-91'},'FontSize',8,'FontWeight','bold')
box off

subplot(4,1,3)
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(1,:), InvCdf_EW_1918(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(2,:), InvCdf_EW_1918(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1918(3,:),'Color','black')

hf = plot((Influenza_EW(83:119,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3)
xlim([0,37])
xticks([1 6 11 16 21 26 31 36])
xtickangle(0)
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
ylim([0,max(max(InvCdf_EW_1918(5,:)),max(Influenza_EW(83:end,2)))*1.05])

yticks(sort([0,round(max(InvCdf_EW_1918(5,:))),round(max(Influenza_EW(83:end,2)),0)]))
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1918-19'},'FontSize',8,'FontWeight','bold')
box off

subplot(4,1,4)
InvCdf_EW_1968(:,:) = bpareto_invcdf(0.01*[10, 25, 50, 75, 90]',Base_Model(14).alpha',Base_Model(14).dmax,Base_Model(14).dmin);
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1968,2), InvCdf_EW_1968(1,:), InvCdf_EW_1968(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1968,2), InvCdf_EW_1968(2,:), InvCdf_EW_1968(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1968(3,:),'Color','black')

hf = plot((Influenza_EW(134:end,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,31])
xticks([1 6 11 16 21 26, 31])
xticklabels({'1971', '1976','1981','1986','1991','1996'})

ylim([0,max(max(InvCdf_EW_1968(5,:)),max(Influenza_EW(133:end,2)))*1.05])
yticks([0,sort([round(max(Influenza_EW(134:end,2))),round(max(InvCdf_EW_1968(5,:)),0)])])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1968-70'},'FontSize',8,'FontWeight','bold')
box off
AddLetters2Plots(figure(6), {'a', 'b', 'c', 'd'}, 'HShift', -0.07, 'VShift', -0.07, 'Direction', 'TopDown','fontsize',8)

h = figure(6);
h.Units='centimeters';
h.OuterPosition=[0 0 19 25];
exportgraphics(h,'../Figures/SI_Figure_B-4.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-4.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-4.eps','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure B 5  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(13)
subplot(2,3,1)
hold on

for i=1:10
    plot(nan,nan,Markertypes{i}, 'Color','black', 'Markersize',6 );
end
leg = legend([citynames,'United States', 'England & Wales'],'Location','best','FontSize',6,'Color','black')
legend boxoff
axis off

suba = subplot(2,3,4)
hold on

for i=1:10
    plot(mean_temp(i,3),max_750(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end

box off
% ylim([0.25,0.4])
xlim([1000,3500])
ylabel({'Prob(>750 deaths/million)','maximum'},'fontsize',6)
xlabel({'Average mortality across main waves (1918-19)'},'fontsize',6)
xticks([1000:500:3500])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)


subb = subplot(2,3,2)
hold on
for i=1:10
    plot(mean_temp(i,3),slope_500(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
% xlabel({'Average mortality across main waves (1918-19)'},'fontsize',6)
ylabel({'Prob(>500 deaths/million)','10-year slope'},'fontsize',6)

box off
xlim([1000,3500])
xticks([1000:500:3500])

a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)

subc = subplot(2,3,3)
hold on
for i=1:10
    plot(mean_temp(i,3),slope_500(i,2),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
% xlabel({'Average mortality across main waves (1918-19)'},'fontsize',6)
ylabel({'Prob(>500 deaths/million)','20-year slope'},'fontsize',6)

box off
xlim([1000,3500])
xticks([1000:500:3500])

a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)



subd = subplot(2,3,5)
hold on
for i=1:10
    plot(mean_temp(i,3),slope_750(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlabel({'Average mortality across main waves (1918-19)'},'fontsize',6)
ylabel({'Prob(>750 deaths/million)','10-year slope'},'fontsize',6)

box off
xlim([1000,3500])
xticks([1000:500:3500])

a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)

sube = subplot(2,3,6)
hold on
for i=1:10
    plot(mean_temp(i,3),slope_750(i,2),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlabel({'Average mortality across main waves (1918-19)'},'fontsize',6)
ylabel({'Prob(>750 deaths/million)','20-year slope'},'fontsize',6)

box off
xlim([1000,3500])
xticks([1000:500:3500])

a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)

AddLetters2Plots({subb,subc,suba,subd,sube}, {'a', 'b', 'c', 'd', 'e'}, 'HShift', -0.05, 'VShift', -0.05, 'Direction', 'TopDown','fontsize',8)



h = figure(13);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 12];
exportgraphics(h,'../Figures/SI_Figure_B-5.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-5.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-5.eps','BackgroundColor','none','Resolution', 900)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure B 6  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(14)
subplot(2,3,1)
hold on

for i=[1:8,10]
    plot(nan,nan,Markertypes{i}, 'Color','black', 'Markersize',6 );
end
leg = legend([citynames, 'England & Wales'],'Location','best','FontSize',6,'Color','black')
legend boxoff
axis off

suba = subplot(2,3,4)
hold on

for i=1:10
    plot(average_infant_mort(i),max_750(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end

box off
xlim([120,170])
xticks(125:20:170)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)
ylabel({'Prob(>750 deaths/million)','maximum'},'fontsize',6)
xlabel({'Pre-pandemic infant mortality'},'fontsize',6)

a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)


subb = subplot(2,3,2)
hold on
for i=1:10
    plot(average_infant_mort(i),slope_500(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
% xlabel({'Average mortality across main waves (1918-19)'},'fontsize',6)
ylabel({'Prob(>500 deaths/million)','10-year slope'},'fontsize',6)

box off
xlim([120,170])
xticks(125:20:170)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)

subc = subplot(2,3,3)
hold on
for i=1:10
    plot(average_infant_mort(i),slope_500(i,2),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
ylabel({'Prob(>500 deaths/million)','20-year slope'},'fontsize',6)

box off

xlim([120,170])
xticks(125:20:170)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)



subd = subplot(2,3,5)
hold on
for i=1:10
    plot(average_infant_mort(i),slope_750(i,1),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlabel({'Pre-pandemic infant mortality'},'fontsize',6)
ylabel({'Prob(>750 deaths/million)','10-year slope'},'fontsize',6)

box off
xlim([120,170])
xticks(125:20:170)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)

sube = subplot(2,3,6)
hold on
for i=1:10
    plot(average_infant_mort(i),slope_750(i,2),Markertypes{i}, 'Color','red', 'Markersize',6 );
end
xlabel({'Pre-pandemic infant mortality'},'fontsize',6)
ylabel({'Prob(>750 deaths/million)','20-year slope'},'fontsize',6)

box off
xlim([120,170])
xticks(125:20:170)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
a = get(gca,'YTickLabel');
set(gca,'YTickLabel',a,'fontsize',6)

AddLetters2Plots({subb,subc,suba,subd,sube}, {'a', 'b', 'c', 'd', 'e'}, 'HShift', -0.05, 'VShift', -0.05, 'Direction', 'TopDown','fontsize',8)



h = figure(14);

%set (h, 'Units','centimeters', 'Positioff', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 12];
exportgraphics(h,'../Figures/SI_Figure_B-6.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-6.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-6.eps','BackgroundColor','none','Resolution', 900)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 7 B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(7)
pa = subplot(2,2,1)
for n=1:8
    hold on
    plot(years(24:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,500), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
hold on
ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',6)

xlim([1917,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.45])
ylim([0,0.5])
%         yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4'})
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
    plot(years(24:end), bpareto_outbreakprob(Estimated_Bounds_Model(n).alpha',Estimated_Bounds_Model(n).dmax,Estimated_Bounds_Model(n).dmin,750), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
hold on
ylabel(sprintf('Prob(>750 deaths/million)'),'fontsize',6)
leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',2);
leg.ItemTokenSize = [9,4.5];
title(leg,'UK Cities (1918-19)','fontsize',6);
legend boxoff
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1917,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.45])
ylim([0,0.5])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45'})

pc = subplot(2,2,3)
plot(Influenza_EW(81:119,1),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
hold on
plot(Influenza_EW(81:119,1),bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,750), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
leg=legend('500 deaths/million', '750 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
legend boxoff
title(leg,'England & Wales (1918-19)','fontsize',6);
box off
leg.ItemTokenSize = [9,4.5];

ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1917,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.45])
ylim([0,0.5])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

pd = subplot(2,2,4)
plot(Influenza_US(19:end,1),bpareto_outbreakprob(Estimated_Bounds_Model(9).alpha',Estimated_Bounds_Model(9).dmax,Estimated_Bounds_Model(9).dmin,500), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
hold on
plot(Influenza_US(19:end,1),bpareto_outbreakprob(Estimated_Bounds_Model(9).alpha',Estimated_Bounds_Model(9).dmax,Estimated_Bounds_Model(9).dmin,750), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
leg=legend('500 deaths/million', '750 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
legend boxoff
title(leg,'United States (1918-19)','fontsize',6);
box off
leg.ItemTokenSize = [9,4.5];

ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1917,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.45])
ylim([0,0.5])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5'})

AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.06, 'VShift', -0.03, 'Direction', 'TopDown','fontsize',8)


h = figure(7);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 20];
exportgraphics(h,'../Figures/SI_Figure_B-7.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-7.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-7.eps','BackgroundColor','none','Resolution', 900)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 8 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


figure(8)
pa = subplot(2,2,1)
plot(Influenza_EW(11:52,1), bpareto_outbreakprob(Estimated_Bounds_Model(10).alpha',Estimated_Bounds_Model(10).dmax,Estimated_Bounds_Model(10).dmin,MainWave(1)/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(11:52,1), bpareto_outbreakprob(Estimated_Bounds_Model(10).alpha',Estimated_Bounds_Model(10).dmax,Estimated_Bounds_Model(10).dmin,MainWave(1)/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(11:52,1), bpareto_outbreakprob(Estimated_Bounds_Model(10).alpha',Estimated_Bounds_Model(10).dmax,Estimated_Bounds_Model(10).dmin,MainWave(1)/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
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

plot(Influenza_EW(53:80,1), bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,MainWave(2)/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(53:80,1), bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,MainWave(2)/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(53:80,1), bpareto_outbreakprob(Estimated_Bounds_Model(11).alpha',Estimated_Bounds_Model(11).dmax,Estimated_Bounds_Model(11).dmin,MainWave(2)/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

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

plot(Influenza_EW(81:119,1), bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,MainWave(3)/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(81:119,1), bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,MainWave(3)/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(81:119,1), bpareto_outbreakprob(Estimated_Bounds_Model(12).alpha',Estimated_Bounds_Model(12).dmax,Estimated_Bounds_Model(12).dmin,MainWave(3)/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

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
plot(Influenza_EW(131:end,1), bpareto_outbreakprob(Estimated_Bounds_Model(14).alpha',Estimated_Bounds_Model(14).dmax,Estimated_Bounds_Model(14).dmin,MainWave(4)/3*2),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(131:end,1), bpareto_outbreakprob(Estimated_Bounds_Model(14).alpha',Estimated_Bounds_Model(14).dmax,Estimated_Bounds_Model(14).dmin,MainWave(4)/2),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(131:end,1), bpareto_outbreakprob(Estimated_Bounds_Model(14).alpha',Estimated_Bounds_Model(14).dmax,Estimated_Bounds_Model(14).dmin,MainWave(4)/3),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

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

AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.05, 'VShift', -0.035, 'Direction', 'TopDown','fontsize',8)

h = figure(8);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 20];
exportgraphics(h,'../Figures/SI_Figure_B-8.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-8.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-8.eps','BackgroundColor','none','Resolution', 900)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 9 B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(9)
pa = subplot(2,2,1)
for n=1:8
    hold on
    plot(years(26:end), weibull_outbreakprob(Weibull_Model(n).w',50), Linemarkertypes{n} , 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
hold on
ylabel(sprintf('Prob(>500 deaths/million)'),'fontsize',6)
leg = legend({ 'Belfast', 'Birmingham' ,'Cardiff','Glasgow', 'Liverpool', 'London', 'Manchester', 'Sheffield'},'FontSize',6, 'Location','best', 'NumColumns',1);
leg.ItemTokenSize = [9,4.5];
title(leg,'UK Cities (1918-19)','fontsize',6);
legend boxoff
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.7])
ylim([0,0.7])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
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
    plot(years(26:end), weibull_outbreakprob(Weibull_Model(n).w',75), Linemarkertypes{n}, 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
end
hold on
ylabel(sprintf('Prob(>750 deaths/million)'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.7])
ylim([0,0.7])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})

pc = subplot(2,2,3)
plot(Influenza_EW(83:119,1),weibull_outbreakprob(Weibull_Model(12).w',50), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
hold on
plot(Influenza_EW(83:119,1),weibull_outbreakprob(Weibull_Model(12).w',75), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
leg=legend('500 deaths/million', '750 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
legend boxoff
title(leg,'England & Wales (1918-19)','fontsize',6);
box off
leg.ItemTokenSize = [9,4.5];

ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.7])
ylim([0,0.7])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})

pd = subplot(2,2,4)
plot(Influenza_US(21:end,1),weibull_outbreakprob(Weibull_Model(9).w',50), '-+', 'Linewidth', .5, 'Markersize', 5,  'Color' ,'black')
hold on
plot(Influenza_US(21:end,1),weibull_outbreakprob(Weibull_Model(9).w',75), '-o', 'Linewidth', .5, 'Markersize', 5, 'Color' ,'black')
leg=legend('500 deaths/million', '750 deaths/million','FontSize',6, 'location', 'northeast', 'NumColumns' ,1)
legend boxoff
title(leg,'United States (1918-19)','fontsize',6);
box off
leg.ItemTokenSize = [9,4.5];

ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
xlim([1919,1956])
xticks([1920:5:1956])
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
xtickangle(0)
yticks([0:0.05:0.7])
ylim([0,0.7])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})

AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.06, 'VShift', -0.03, 'Direction', 'TopDown','fontsize',8)


h = figure(9);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 20];
exportgraphics(h,'../Figures/SI_Figure_B-9.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-9.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-9.eps','BackgroundColor','none','Resolution', 900)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 10 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(10)
pa = subplot(2,2,1)
plot(Influenza_EW(12:52,1), weibull_outbreakprob(Weibull_Model(10).w',MainWave(1)/3*2/10),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(12:52,1), weibull_outbreakprob(Weibull_Model(10).w',MainWave(1)/2/10),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(12:52,1), weibull_outbreakprob(Weibull_Model(10).w',MainWave(1)/3/10),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
legend boxoff

        leg=legend('2/3','1/2','1/3')
        leg.ItemTokenSize = [9,4.5];
        title(leg,{'Threshold relative', 'to average across', 'main waves'})

xlim([1848,1890])
xticks([1850:5:1890])
xtickangle(0)
ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
yticks([0:0.1:1])
ylim([0,1])
yticklabels({'0','0.1', '0.2', '0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1847-48')
box off

pb = subplot(2,2,2)

plot(Influenza_EW(55:80,1), weibull_outbreakprob(Weibull_Model(11).w',MainWave(2)/3*2/10),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(55:80,1), weibull_outbreakprob(Weibull_Model(11).w',MainWave(2)/2/10),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(55:80,1), weibull_outbreakprob(Weibull_Model(11).w',MainWave(2)/3/10),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

xlim([1891,1918])
xticks([1895:5:1915])
xtickangle(0)
yticks([0:0.1:1])
ylim([0,1])
yticklabels({'0','0.1', '0.2', '0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1890-91')
box off

pc = subplot(2,2,3)

plot(Influenza_EW(83:119,1), weibull_outbreakprob(Weibull_Model(12).w',MainWave(3)/3*2/10),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(83:119,1), weibull_outbreakprob(Weibull_Model(12).w',MainWave(3)/2/10),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(83:119,1), weibull_outbreakprob(Weibull_Model(12).w',MainWave(3)/3/10),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

xlim([1919,1957])
xticks([1920:5:1955])
ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
xtickangle(0)
yticks([0:0.05:0.45])
ylim([0,0.25])
yticklabels({'0','0.05','0.1', '0.15', '0.2', '0.25','0.3','0.35','0.4','0.45','0.5','0.55','0.6','0.65','0.7'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1918-19')
box off

pd = subplot(2,2,4)
plot(Influenza_EW(134:end,1), weibull_outbreakprob(Weibull_Model(14).w',MainWave(4)/3*2/10),'-o', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
hold on
plot(Influenza_EW(134:end,1), weibull_outbreakprob(Weibull_Model(14).w',MainWave(4)/2/10),'-*', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')
plot(Influenza_EW(134:end,1), weibull_outbreakprob(Weibull_Model(14).w',MainWave(4)/3/10),'-x', 'Linewidth', 0.5, 'Markersize', 4 , 'Color', 'black')

xlim([1970,2001])
xticks([1970:5:2000])
xtickangle(0)
ylabel(sprintf('Probability of exceeding threshold'),'fontsize',6)
yticks([0:0.1:1])
ylim([0,1])
yticklabels({'0','0.1', '0.2', '0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'})
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'fontsize',6)
aa = get(gca,'YTickLabel');
set(gca,'YTickLabel',aa,'fontsize',6)
title('England & Wales 1968-70')
box off

AddLetters2Plots({pa, pb, pc, pd},{'a','b','c','d'}, 'HShift', -0.07, 'VShift', -0.045, 'Direction', 'TopDown','fontsize',8)

h = figure(10);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 20];
exportgraphics(h,'../Figures/SI_Figure_B-10.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-10.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-10.eps','BackgroundColor','none','Resolution', 900)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 11 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for b = 1:8
    InvCdf(:,:,b) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(b).w')*10;
end
InvCdf_US(:,:) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(b+1).w')*10;
InvCdf_EW_1918(:,:) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(12).w')*10;

figure(11)
for b = 1:8
    subplot(5,2,b)
    [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(1,:,b), InvCdf(5,:,b), [0.95 0.95 0.95],[0.95 0.95 0.95]);
    hold on
    [ha,~,~] = shadedplot(1:size(InvCdf,2), InvCdf(2,:,b), InvCdf(4,:,b), [0.9 0.9 0.9],[0.9 0.9 0.9]);
    hold on
    plot(InvCdf(3,:,b),'Color','black')
    hf = plot((Influenza_Cities(26:end,b+1)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3 )
    xlim([0,37])
    ylim([0,max(max(InvCdf(5,:,b),max(Influenza_Cities(26:end,b+1))))*1.05])
    xticks([1 6 11 16 21 26 31 36])
    xtickangle(0)
    xticklabels([])
    yticks([0,sort([(round(max(Influenza_Cities(26:end,b+1)),0)),round(max(InvCdf(5,:,b)))])])
    title({citynames{b},'1918-19'},'fontsize',6,'FontWeight','bold')
    box off
end
subplot(5,2,9)
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(1,:), InvCdf_EW_1918(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(2,:), InvCdf_EW_1918(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1918(3,:),'Color','black')

hf = plot((Influenza_EW(83:119,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3)
xlim([0,37])
xticks([1 6 11 16 21 26 31 36])
xtickangle(0)
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
ylim([0,max(max(InvCdf_EW_1918(5,:)),max(Influenza_EW(83:end,2)))*1.05])

yticks(sort([0,round(max(InvCdf_EW_1918(5,:))),round(max(Influenza_EW(83:end,2)),0)]))
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1918-19'},'fontsize',6,'FontWeight','bold')
box off

subplot(5,2,10)

InvCdf_US(:,:) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(9).w')*10;
[ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(1,:), InvCdf_US(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_US,2), InvCdf_US(2,:), InvCdf_US(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_US(3,:),'Color','black')

hf = plot((Influenza_US(21:end,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,37])
xticks([1 6 11 16 21 26 31 36])
xtickangle(0)
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
ylim([0,max(InvCdf_US(5,:)*1.05)])
yticks([0,round(max(Influenza_US(21:end,2)),0),round(max(InvCdf_US(5,:)))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'United States','1918-19'},'fontsize',6,'FontWeight','bold')
box off

AddLetters2Plots(figure(11), {'a', 'b', 'c', 'd', 'e',  'f', 'g', 'h','i','j'}, 'HShift', -0.07, 'VShift', -0.07, 'Direction', 'TopDown','fontsize',8)

h = figure(11);
%set (h, 'Units','centimeters', 'Position', [0 0 14.5 14.5]);
h.Units='centimeters';
h.OuterPosition=[0 0 19 25];
exportgraphics(h,'../Figures/SI_Figure_B-11.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-11.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-11.eps','BackgroundColor','none','Resolution', 900)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% Figure 12 B  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



figure(12)

subplot(4,1,1)
InvCdf_EW_1848(:,:) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(10).w')*10;
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1848,2), InvCdf_EW_1848(1,:), InvCdf_EW_1848(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1848,2), InvCdf_EW_1848(2,:), InvCdf_EW_1848(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1848(3,:),'Color','black')

hf = plot((Influenza_EW(12:52,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,42])
xticks([2 12 22 32 42])
xticklabels({'1850', '1860','1870','1880','1890'})

ylim([0,max(max(InvCdf_EW_1848(5,:)),max(Influenza_EW(12:52,2)))*1.05])
yticks([0,round(max(Influenza_EW(12:52,2)),0),round(max(InvCdf_EW_1848(5,:)))])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1847-48'},'fontsize',6,'FontWeight','bold')
box off

subplot(4,1,2)
InvCdf_EW_1890(:,:) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(11).w')*10;
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1890,2), InvCdf_EW_1890(1,:), InvCdf_EW_1890(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1890,2), InvCdf_EW_1890(2,:), InvCdf_EW_1890(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1890(3,:),'Color','black')

hf = plot((Influenza_EW(55:80,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,27])
xticks([1 6 11 16 21 26])
xticklabels({'1892', '1897','1902','1907','1912','1917'})

ylim([0,max(max(InvCdf_EW_1890(5,:)),max(Influenza_EW(55:80,2)))*1.05])
yticks([0,sort([round(max(Influenza_EW(55:80,2)),0),round(max(InvCdf_EW_1890(5,:)))])])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1890-91'},'fontsize',6,'FontWeight','bold')
box off

subplot(4,1,3)
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(1,:), InvCdf_EW_1918(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1918,2), InvCdf_EW_1918(2,:), InvCdf_EW_1918(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1918(3,:),'Color','black')

hf = plot((Influenza_EW(83:119,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize', 3)
xlim([0,37])
xticks([1 6 11 16 21 26 31 36])
xtickangle(0)
xticklabels({'1920','1925', '1930','1935','1940','1945','1950','1955'})
ylim([0,max(max(InvCdf_EW_1918(5,:)),max(Influenza_EW(83:end,2)))*1.05])

yticks(sort([0,round(max(InvCdf_EW_1918(5,:))),round(max(Influenza_EW(83:end,2)),0)]))
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1918-19'},'fontsize',6,'FontWeight','bold')
box off

subplot(4,1,4)
InvCdf_EW_1968(:,:) = weibull_invertcdf(0.01*[10, 25, 50, 75, 90]',Weibull_Model(14).w')*10;
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1968,2), InvCdf_EW_1968(1,:), InvCdf_EW_1968(5,:), [0.95 0.95 0.95],[0.95 0.95 0.95]);
hold on
[ha,~,~] = shadedplot(1:size(InvCdf_EW_1968,2), InvCdf_EW_1968(2,:), InvCdf_EW_1968(4,:), [0.9 0.9 0.9],[0.9 0.9 0.9]);
hold on
plot(InvCdf_EW_1968(3,:),'Color','black')

hf = plot((Influenza_EW(134:end,2)'),'o',  'Color',[230, 33, 11]/sum([230, 33, 11]), 'Markersize',3)
xlim([0,31])
xticks([1 6 11 16 21 26, 31])
xticklabels({'1971', '1976','1981','1986','1991','1996'})

ylim([0,max(max(InvCdf_EW_1968(5,:)),max(Influenza_EW(133:end,2)))*1.05])
yticks([0,sort([round(max(Influenza_EW(134:end,2)),0),round(max(InvCdf_EW_1968(5,:)))])])
ax = gca;
c = ax.FontSize;
ax.FontSize =8;
ax.XTickLabelRotation = 0;
title({'England & Wales', '1968-70'},'fontsize',6,'FontWeight','bold')
box off
AddLetters2Plots(figure(12), {'a', 'b', 'c', 'd'}, 'HShift', -0.07, 'VShift', -0.07, 'Direction', 'TopDown','fontsize',8)

h = figure(12);
h.Units='centimeters';
h.OuterPosition=[0 0 19 25];
exportgraphics(h,'../Figures/SI_Figure_B-12.pdf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-12.emf','BackgroundColor','none','Resolution', 900)
exportgraphics(h,'../Figures/SI_Figure_B-12.eps','BackgroundColor','none','Resolution', 900)


