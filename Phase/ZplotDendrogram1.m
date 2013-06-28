% this function plots a single dendrogram according to any vector, typically its own original one
% ColorMode - Regular
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 150110 - added option to choose between color scales

function ZplotDendrogram1(Dendro1,v1,ColorMode,Power,Scale,varargin)
%clc;  home;                             
%close all

b1=find(Dendro1~=1);
%process Dendro1 according to representation required
if strcmp(ColorMode,'Regular')
        Rplot=Dendro1; %no change to original dendrogram
        m1=max(Rplot(b1))*Scale; %#ok<FNDSB> %this is the maximum value at R that is not 1, which is the self sync value of each electrode
        fprintf([' Regular ColorMode chosen - Max = ', num2str(m1),' Scale = ',num2str(Scale),'\n']);
        fprintf([' CMax = ', num2str(m1*Scale),'\n']);
elseif strcmp(ColorMode,'Normalize')
        Rplot=ZMatNormalize(Dendro1); %normalize original dendrogram
        m1=max(Rplot(b1))*Scale; %#ok<FNDSB> %this is the maximum value at R that is not 1, which is the self sync value of each electrode
        fprintf([' Norm ColorMode chosen - Max = ', num2str(m1),' Scale = ',num2str(Scale),'\n']);
        fprintf([' CMax = ', num2str(m1*Scale),'\n']);
elseif strcmp(ColorMode,'Emphasize')
        Rplot=ZMatEmphasize(Dendro1,Power); %log scale original dendrogram
        m1=max(Rplot(b1))*Scale; %#ok<FNDSB> %this is the maximum value at R that is not 1, which is the self sync value of each electrode
        fprintf([' Norm ColorMode chosen - Max = ', num2str(m1),' Scale = ',num2str(Scale),'\n']);
        fprintf([' CMax = ', num2str(m1*Scale),'\n']);
else
        error('please choose Color Mode - Regular,Norm or Power  \n'); 
end;

% set(0,'Units','pixels') 
% scnsize = get(0,'ScreenSize');
% pos1 = [30,  1/3*scnsize(4)-200 , 1/2*scnsize(3), 1/2*scnsize(4) ]; 
% %MATLAB defines the figure Position property as a vector.
% %[left bottom width height]
% figure('Position',pos1) 

%generate figure
imagesc(Rplot(v1,v1));
colormap('jet')
%colorbar
%write electrodes to x and y axis
a1=(1:max(v1));
set(gca,'xtick',a1,'ytick',a1);
set(gca,'xticklabel',v1,'yticklabel',v1);
%set(gca,'FontSize',10,'Position',[0.03 0.55 0.28 0.4]);
set(gca,'FontSize',8);
caxis([0 m1]);
if isempty(varargin),
    error('no title choosen');
else
    title(varargin{1},'FontSize',12);
end
