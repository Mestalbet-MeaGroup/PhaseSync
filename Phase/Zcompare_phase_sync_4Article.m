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
 % 101209 - removed histograms

function Zcompare_phase_sync_4Article(R1,R2,varargin)
%clc; close all; home;

%generate pre correlation matrix
lng1=size(R1,1);
y1=pdist(R1);
Z1=linkage(y1);
figure(1)
[h1,T1,v1] = dendrogram(Z1,lng1);

%generate post correlation matrix
lng2=size(R2,1);
y2=pdist(R2);
Z2=linkage(y2);
figure(1)
[h2,T2,v2] = dendrogram(Z2,lng2);

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

figure;
imagesc(cr1);
colormap('jet')
a1=(1:max(v1));
set(gca,'xtick',a1,'ytick',a1);
set(gca,'xticklabel',v1,'yticklabel',v1);
set(gca,'FontSize',10);
title(varargin{1},'FontSize',12);
caxis([0 m]);

%generate second plot - 2 by 1
figure;
imagesc(cr2);
colormap('jet')
a1=(1:max(v1));
set(gca,'xtick',a1,'ytick',a1);
set(gca,'xticklabel',v1,'yticklabel',v1);
set(gca,'FontSize',10);
title(varargin{2},'FontSize',12);
caxis([0 m]);

%generate third plot - 2 by 2
figure;
imagesc(cr3);
colormap('jet')
colorbar
a2=(1:max(v2));
set(gca,'xtick',a2,'ytick',a2);
set(gca,'xticklabel',v2,'yticklabel',v2);
set(gca,'FontSize',10);
title(varargin{3},'FontSize',12);
caxis([0 m]);

