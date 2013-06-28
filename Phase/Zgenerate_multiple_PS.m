% This function generates phase sync diagrams of R2, R3 etc' by R1 order
%  R matrices, typically the reuslt of e.g
%R1=Zphase_synchronization(t_pre_0001./1200,ic_pre_0001,min(t_pre_0001)+600000,10000);
%R2=Zphase_synchronization(t_post_0003./1200,ic_post_0003,min(t_post_0003)+5000,10000);

function Zgenerate_multiple_PS(varargin)
clc; close all; home;

if isempty(varargin),
    error('not enough inputs');
end
n = length (varargin);

%generate v for each R in case we need to return to the original vector
for i = 1:n
    lng=size(varargin{i},1);
    y=pdist(varargin{i});
    Z=linkage(y);
    [h,T,v(i,:)] = dendrogram(Z,lng);
end
close all;

%generate reorder matrices according to v1
for i = 1:n
    c(:,:,i)=(varargin{i}(v(1,:),v(1,:)));
    b=find(varargin{i}~=1);
    m(i)=max(varargin{i}(b)); %keep the maximum value of each matrix into m
end

for i=2:n
    cDelta(i-1)=mean(mean(c(:,:,1)-c(:,:,i)));
    cStd(i-1)=std(std(c(:,:,1)-c(:,:,i)));
end

figure; plot(cDelta); title('mean Delta to PS1')
figure; plot(cStd); title('std of Delta to PS1')
%Plot
p=1;
m1=max(m);
a1=(1:max(v(1,:)));
set(0,'Units','pixels') 
scnsize = get(0,'ScreenSize');
pos1 = [30,  1/3*scnsize(4)-200 , scnsize(3)-50, scnsize(4)-200 ];
 
for i = 1:n
     if (p==1)
           figure('Position',pos1) 
    end
     subplot(2,3,p)
    imagesc(c(:,:,i));
    set(gca,'xtick',a1,'ytick',a1);
    set(gca,'xticklabel',v(1,:),'yticklabel',v(1,:));
    set(gca,'FontSize',7);
    title(['PS',num2str(i)],'FontSize',12);
    caxis([0 m1]);
    p=mod(i,6)+1;
end





