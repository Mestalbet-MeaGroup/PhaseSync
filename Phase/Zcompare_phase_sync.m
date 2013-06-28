% the purpose of this function is to compare between two Phase Sync
% matrices, typically the reuslt of e.g
%R1=Zphase_synchronization(t_pre_0001./1200,ic_pre_0001,min(t_pre_0001)+600000,10000);
%R2=Zphase_synchronization(t_post_0003./1200,ic_post_0003,min(t_post_0003)+5000,10000);
%call this function example.:
% Zcompare_phase_sync(WT1pre01,WT1post01,'Pre','Post')
% top raw of plots           left: WT1pre01 optimiazed by itself
%                                                   right: WT1post01 optimiazed by itself, 
%                                                   center, WT1post01 optimiazed by WT1pre01 order.
% bottom raw of plots-  left: WT1pre01 sync value histogram (all but 1's which is the self sync value)
%                                                   right: WT1post01 histogram
%                                                   center:historam of delta  - abs(WT1pre01-WT1post01) 
function Zcompare_phase_sync(R1,R2,varargin)
clc; close all; home;

%generate pre correlation matrix
lng1=size(R1,1);
y1=pdist(R1);
Z1=linkage(y1);
[h1,T1,v1] = dendrogram(Z1,lng1);

%generate post correlation matrix
lng2=size(R2,1);
y2=pdist(R2);
Z2=linkage(y2);
[h2,T2,v2] = dendrogram(Z2,lng2);
close all;

cr1=R1(v1,v1);
cr2=R2(v1,v1); %use v1 for order
cr3=R2(v2,v2); %use v2 for order
crDelta=abs(cr1-cr2); %this will be used to meaure the delta between pre and post on the same pais
                                        % of electrodes e.g. how did the e10-e12 sync changed between pre and post
                                     
%generate first plot - Pre NCS
%close all
b1=find(R1~=1);
b2=find(R2~=1);
m1=max(R1(b1)); %#ok<FNDSB> %this is the maximum value at R that is not 1, which is the self sync value of each electrode
m2=max(R2(b2)); %#ok<FNDSB>

m=max(m1,m2); % this will be used for the generating the same color scale for all plots.

set(0,'Units','pixels') 
scnsize = get(0,'ScreenSize');
pos1 = [30,  1/3*scnsize(4)-200 , scnsize(3)-50, scnsize(4)-200 ];
figure('Position',pos1) 


%generate Histograms
valuesR1=R1(find(R1~=1)); %looking for all the values which are not 1 (seld synchronization value)
valuesR2=R2(find(R2~=1));

n1=max(hist(valuesR1,[0:0.05:m])); %look for the value with the most repeats, to be used for scaling the histograms
n2=max(hist(valuesR2,[0:0.05:m]));
n3=floor(1.05*max(n1,n2) );

subplot(2,3,4)
hist(valuesR1,[0:0.05:m]);
title(['Histogram ',varargin{1}],'FontSize',12);
set(gca,'FontSize',7,'Position',[0.03 0.05 0.28 0.4]);
set(gca,'ylim',([0 n3] ) );

subplot(2,3,5)
valuesCRdelta=crDelta(find(crDelta~=0)); %all the diagonal is zero becuse it is 1 in both cr1, cr2
hist(valuesCRdelta);
title(['Abs Delta: ',varargin{1}, ' minus ', varargin{2}] ,'FontSize',12);
set(gca,'FontSize',7,'Position',[0.33 0.05 0.28 0.4]);
annotation(gcf,'textbox',[0.5179 0.3427 0.07891 0.07801],...
        'String',{['Mean Delta is: ' num2str(mean(valuesCRdelta),4)] }, 'FitBoxToText','off',  'BackgroundColor',[1 1 0]);

subplot(2,3,6)
hist(valuesR2,[0:0.05:m]);
title(['Histogram ',varargin{2}], 'FontSize',12);
set(gca,'FontSize',7,'Position',[0.63 0.05 0.28 0.4]);
set(gca,'ylim',([0 n3] ) );

subplot(2,3,1)
imagesc(cr1);
colormap('jet')
%colorbar
%write electrodes to x and y axis
a1=(1:max(v1));
set(gca,'xtick',a1,'ytick',a1);
set(gca,'xticklabel',v1,'yticklabel',v1);
set(gca,'FontSize',7,'Position',[0.03 0.55 0.28 0.4]);
title(varargin{1},'FontSize',12);
caxis([0 m]);

%generate second plot - Post NCS by Pre v1
subplot(2,3,2)
imagesc(cr2);
colormap('jet')
%colorbar
%write electrodes to x and y axis
a1=(1:max(v1));
set(gca,'xtick',a1,'ytick',a1);
set(gca,'xticklabel',v1,'yticklabel',v1);
set(gca,'FontSize',7,'Position',[0.33 0.55 0.28 0.4]);
title([varargin{2}, ' by ', varargin{1}, ' order'] ,'FontSize',12);
caxis([0 m]);

%generate third plot - Post NCS by Pre v2
subplot(2,3,3)
imagesc(cr3);
colormap('jet')
colorbar
%write electrodes to x and y axis
a2=(1:max(v2));
set(gca,'xtick',a2,'ytick',a2);
set(gca,'xticklabel',v2,'yticklabel',v2);
set(gca,'FontSize',7,'Position',[0.63 0.55 0.28 0.4]);
title(varargin{2},'FontSize',12);
caxis([0 m]);

