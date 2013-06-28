% Ziv Yekutieli - ziv.yekutieli@intel.com
%This function recieves two Rcolomns  (Phase sync' matrices in various times...
% ... use Rcolomn=Zgenerate_Rcolomn (t,ic,num,delta) for generating them), typically Pre and Post, and ref number.
% The function orgninzes all the matrices according to the dendrogram order which is choosen as follows: 
% if ref=0 -> each layer matrix of each R is orginized according to its own best dendrogram order.
% if ref=i -> all the layers will be orginized according to the dendrogram  order of the i'th later in the FIRST Rcolomn. 
% Typically, we want to sort all matrices according to a stable part in the Pre Rcolomn, so if for example we find the 5th layer of Pre Rcolomn to be
% stable, we set ref=5 and then all the Pre and Post Rcolomns will be ordered according to the 5th Rre Rcolomn. 
% The ordered matrices are returned as Cr1 and Cr2 (columns) and Vref is
% the order of electrodes that was used for ordering all. (if ref=0, Vref is the order of the first Pre layer. it is not the order for all the
% rest since each has its own order as explained above) 
%##########################################################################
%Rev1- 200709
%Rev2 - 090809 added two Rcolomn2, now can be used for generating Post Crbased on Pre order
%Rev3 - 120809 added Vref option return so we can use for spatial representation
%Rev4 -300809 added return maxC - maximum value to be used for plot so won't look so pale..
%##########################################################################

function [Cr1,Cr2, Vref,maxC]=ZgenerateCrPrePost(Rcolomn1,Rcolomn2, ref);
%clc; close all; home;

% if isempty(varargin),
%     error('not enough inputs');
% end
[x,y,n1] = size(Rcolomn1);
[x,y,n2] = size(Rcolomn2);

%generate v for each R 
for i = 1:n1
    lng1=size(Rcolomn1(:,:,i),1);
    y1=pdist(Rcolomn1(:,:,i));
    Z1=linkage(y1);
    [h1,T1,v1(i,:)] = dendrogram(Z1,lng1);
end

for i = 1:n2
    lng2=size(Rcolomn2(:,:,i),1);
    y2=pdist(Rcolomn2(:,:,i));
    Z2=linkage(y2);
    [h2,T2,v2(i,:)] = dendrogram(Z2,lng2);
end
close all;

%generate reorder matrices according to v
if (ref==0) %generate each sync matrix by itslef
    for i = 1:n1
        T1=Rcolomn1(:,:,i);
        Cr1(:,:,i)=T1(v1(i,:),v1(i,:));
        b1=find(T1~=1);
        m1(i)=max(T1(b1)); %keep the maximum value of each matrix into m
    end
    
     for i = 1:n2
        T2=Rcolomn2(:,:,i);
        Cr2(:,:,i)=T2(v2(i,:),v2(i,:));
        b2=find(T2~=1);
        m2(i)=max(T2(b2)); %keep the maximum value of each matrix into m
     end
   Vref=v1(1,:); 
     
else   %generate each matrix by the order of ref matrix
    for i = 1:n1
        T1=Rcolomn1(:,:,i);
        Cr1(:,:,i)=T1(v1(ref,:),v1(ref,:));
        b1=find(T1~=1);
        m1(i)=max(T1(b1)); %keep the maximum value of each matrix into m
    end
    
    for i = 1:n2
        T2=Rcolomn2(:,:,i);
        Cr2(:,:,i)=T2(v1(ref,:),v1(ref,:)); %%%% Ploting according to v1 (in the pre matrix)
        b2=find(T2~=1);
        m2(i)=max(T2(b2)); %keep the maximum value of each matrix into m
    end
    maxC=max(max(m1),max(m2)); 
    Vref=v1(ref,:);
end






