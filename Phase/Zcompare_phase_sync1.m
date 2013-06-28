% the purpose of this function is to compare between two Phase Sync
% call this function example.:
% Zcompare_phase_sync(WT1pre01,WT1post01,'Pre','Post')
% top raw of plots           left: WT1pre01 optimiazed by itself
%                                                   right: WT1post01 optimiazed by itself, 
%                                                   center, WT1post01 optimiazed by WT1pre01 order.
% bottom raw of plots-  left: WT1pre01 sync value histogram (all but 1's which is the self sync value)
%                                                   right: WT1post01 histogram
%                                                   center:historam of delta  - abs(WT1pre01-WT1post01) 
% ColorMode = SameColor, the same scale will be used (by the max of both PS)
% ColorMode = DiffColor, each PS will use its own max
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 101209 - removed histograms
 % 150110 - added option to choose between color scales

function [cr11,cr21,cr22]=Zcompare_phase_sync1(R1,R2,ColorMode,varargin)
%clc; close all; home;
fact=1.05;
%generate pre correlation matrix
lng1=size(R1,1);
y1=pdist(R1);
Z1=linkage(y1);
figure(1)
[h1,T1,v1] = dendrogram(Z1,lng1);
 close (figure(1));
 
%generate post correlation matrix
lng2=size(R2,1);
y2=pdist(R2);
Z2=linkage(y2);
figure(1)
[h2,T2,v2] = dendrogram(Z2,lng2);
 close (figure(1));
%close all;

cr11=R1(v1,v1);
cr21=R2(v1,v1); %use v1 for order
cr22=R2(v2,v2); %use v2 for order
crDelta=abs(cr11-cr21); %this will be used to measure the delta between pre and post on the same pais
                                        % of electrodes e.g. how did the e10-e12 sync changed between pre and post
                                     
%generate first plot - Pre NCS
%close all
b1=find(R1~=1);
b2=find(R2~=1);
m1=max(R1(b1)); %#ok<FNDSB> %this is the maximum value at R that is not 1, which is the self sync value of each electrode
m2=max(R2(b2)); %#ok<FNDSB>
if strcmp(ColorMode,'SameColor')
    m1=max(m1,m2); % this will be used for the generating the same color scale for all plots.
    m2=m1;
    fprintf([' All the PSs will share the same Cmax = ', num2str(m1),'\n']);
elseif strcmp(ColorMode,'DiffColor')
    % each PS will have differnt Cmax.
    fprintf([' First PSs will use Cmax = ', num2str(m1), '\n']); 
    fprintf([' Second PSs will use Cmax = ', num2str(m2), '\n']); 
else
        error('please choose either SameColor or DiffColor option \n'); 
end;

set(0,'Units','pixels') 
scnsize = get(0,'ScreenSize');
%pos1 = [30,  1/3*scnsize(4)-200 , scnsize(3)-50, scnsize(4)-200 ]; %use for histograms as well
pos1 = [30,  1/3*scnsize(4)-200 , scnsize(3)-50, 1/3*scnsize(4) ]; 

%MATLAB defines the figure Position property as a vector.
%[left bottom width height]

figure('Position',pos1) 


% %generate Histograms
% valuesR1=R1(find(R1~=1)); %looking for all the values which are not 1 (seld synchronization value)
% valuesR2=R2(find(R2~=1));
% 
% n1=max(hist(valuesR1,[0:0.05:m])); %look for the value with the most repeats, to be used for scaling the histograms
% n2=max(hist(valuesR2,[0:0.05:m]));
% n3=floor(1.05*max(n1,n2) );
% 
% subplot(2,3,4)
% hist(valuesR1,[0:0.05:m]);
% title(['Histogram ',varargin{1}],'FontSize',12);
% set(gca,'FontSize',7,'Position',[0.03 0.05 0.28 0.4]);
% set(gca,'ylim',([0 n3] ) );
% 
% subplot(2,3,5)
% valuesCRdelta=crDelta(find(crDelta~=0)); %all the diagonal is zero becuse it is 1 in both cr11, cr21
% hist(valuesCRdelta);
% title(['Abs Delta: ',varargin{1}, ' minus ', varargin{2}] ,'FontSize',12);
% set(gca,'FontSize',7,'Position',[0.33 0.05 0.28 0.4]);
% annotation(gcf,'textbox',[0.5179 0.3427 0.07891 0.07801],...
%         'String',{['Mean Delta is: ' num2str(mean(valuesCRdelta),4)] }, 'FitBoxToText','off',  'BackgroundColor',[1 1 0]);
% 
% subplot(2,3,6)
% hist(valuesR2,[0:0.05:m]);
% title(['Histogram ',varargin{2}], 'FontSize',12);
% set(gca,'FontSize',7,'Position',[0.63 0.05 0.28 0.4]);
% set(gca,'ylim',([0 n3] ) );
% 

%fisrt figure - 3 subplots. 1 by 1, 2 by 1, 2 by 2
%generate first  plot - pre1  by Pre v1
subplot(1,3,1)
imagesc(cr11);
colormap('jet')
%colorbar
%write electrodes to x and y axis
a1=(1:max(v1));
set(gca,'xtick',a1,'ytick',a1);
set(gca,'xticklabel',v1,'yticklabel',v1);
%set(gca,'FontSize',10,'Position',[0.03 0.55 0.28 0.4]);
set(gca,'FontSize',10);
title(varargin{1},'FontSize',12);
caxis([0 fact*m1]);

%generate second plot - Post NCS by Pre v1
subplot(1,3,2)
imagesc(cr21);
colormap('jet')
%colorbar
%write electrodes to x and y axis
a1=(1:max(v1));
set(gca,'xtick',a1,'ytick',a1);
set(gca,'xticklabel',v1,'yticklabel',v1);
%set(gca,'FontSize',10,'Position',[0.33 0.55 0.28 0.4]);
set(gca,'FontSize',10);
title([varargin{2}, ' by ', varargin{1}, ' order'] ,'FontSize',12);
caxis([0 fact*m2]);

%generate third plot - Post NCS by Pre v2
subplot(1,3,3)
imagesc(cr22);
colormap('jet')
colorbar
%write electrodes to x and y axis
a2=(1:max(v2));
set(gca,'xtick',a2,'ytick',a2);
set(gca,'xticklabel',v2,'yticklabel',v2);
% set(gca,'FontSize',10,'Position',[0.63 0.55 0.28 0.4]);
set(gca,'FontSize',10);
title(varargin{2},'FontSize',12);
caxis([0 fact*m2]);


%second figure -  two subplots. 1 by 1, 2 by 1 (done for article)
figure('Position',pos1) 
%generate first  plot - 1  by 1
subplot(1,2,1)
imagesc(cr11);
colormap('jet')
%colorbar
%write electrodes to x and y axis
a1=(1:max(v1));
set(gca,'xtick',a1,'ytick',a1);
set(gca,'xticklabel',v1,'yticklabel',v1);
% set(gca,'FontSize',10,'Position',[0.03 0.55 0.28 0.4]);
set(gca,'FontSize',10);
title(varargin{1},'FontSize',12);
caxis([0 fact*m1]);

%generate second plot - Post NCS by Pre v1
subplot(1,2,2)
imagesc(cr21);
colormap('jet')
%colorbar
%write electrodes to x and y axis
a1=(1:max(v1));
set(gca,'xtick',a1,'ytick',a1);
set(gca,'xticklabel',v1,'yticklabel',v1);
% set(gca,'FontSize',10,'Position',[0.33 0.55 0.28 0.4]);
set(gca,'FontSize',10);
title([varargin{2}, ' by ', varargin{1}, ' order'] ,'FontSize',12);
caxis([0 fact*m2]);

