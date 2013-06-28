function [Z,v,cr]=Zdendo_clastr_plot(R,varargin);

lng=size(R,1);
y=pdist(R);
Z=linkage(y);
figure;
[h,T,v] = dendrogram(Z,lng);
%close all

figure;
cr=R(v,v);

% pcolor(cr);
% ind=isnan(cr);
% cr(find(ind==1))=0;
% cmap = colormap;
% cr=cr-min(min(cr));
% cr=round((63*cr./max(max(cr)))+1);
% cr_m=cmap(cr(:),:);
% cr_im=(reshape(cr_m,size(cr,1),size(cr,1),3));
% 
% cr_im(:,:,1)=flipud(cr_im(:,:,1));
% cr_im(:,:,2)=flipud(cr_im(:,:,2));
% cr_im(:,:,3)=flipud(cr_im(:,:,3));
% imagesc(cr_im);
imagesc(cr);
colormap('jet')
colorbar
%write electrodes to x and y axis
a=(1:max(v2));
set(gca,'xtick',a,'ytick',a);
set(gca,'xticklabel',v2,'yticklabel',v2);
title(varargin{1});

b=find(R~=1);
m=max(R(b)); %this is the maximum value at R that is not 1, which is the self sync value of each electrode
caxis([0 m]);

saveas(gcf,['D:\Freshhh\ZivPSresults\',varargin{1}],'fig');
saveas(gcf,['D:\Freshhh\ZivPSresults\',varargin{1}],'jpg');


