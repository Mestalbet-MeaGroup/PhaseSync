function [PS,nPS,time]=CalcPS(t,ic,step,window)
%step is in hours
%window is in hours

[temp,Velec,Tmax]=Zgenerate_Rcolomn4(t,ic,100,step,window);
count=1;

for i=1:size(temp,3)
    if isempty(find(isnan(temp(:,:,i)), 1))==1
        PS(:,:,count)=temp(:,:,i);
        time(count)=i*step*60;
        count=count+1;
    end
end

clear temp;
count=1;
mPS=mean(PS,3);
[D,v]=Zdendrogram(mPS(:,:)); %ordered by mean PS
close all;
PS=PS(v,v,:);
mPS=mPS(v,v);

    for j=1:size(PS,2)
        if sum(mPS(j,:))~=1
            pos(count)=j;
            count=count+1;
        end
    end
    
PS=PS(pos,pos,:);
nPS=ZRcolomnNormalize(PS);
v=v(pos);
winsize=[1,41,1680,940];
% winsize(1:2) = [0 0];

aviobj1 = avifile('movie.avi','fps',1,'compression','none');

for i=1:size(nPS,3)-2
imagesc(nPS(:,:,i));
title([num2str(time(i)) ' min']);
set(gca,'YTick',1:1:length(pos));
set(gca,'XTick',1:1:length(pos));
set(gca,'XTickLabel',ic(1,v));
set(gca,'YTickLabel',ic(1,v));
set(gca,'PlotBoxAspectRatio',[1 1 1]);
set(gcf,'Position',winsize);
aviobj1 = addframe(aviobj1,gca);
end

close all;
aviobj1 = close(aviobj1);
a=abs(diff(nPS,1,3));
b=mean(mean(a));
b=squeeze(b);
bs=std(std(a));
c=(b./mean(b)).*0.5;
errorbar(c,bs,'.:r')
set(gca,'XTick',1:10:length(time(1:end-1)));
set(gca,'XTickLabel',time(1:10:end-1));
title(['Normalized Variation in Global Phase Synchronization']);
end