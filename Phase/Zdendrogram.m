% this function returns Dendo1 which is the dendrogram ofR1. It also
% returns v1 which is the order of the dendrogram elements.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 % 150110 
 
function [Dendo1,v1]=Zdendrogram(R1)
clc;  home;
%generate R1 dendrogram
lng1=size(R1,1);
y1=pdist(R1);
Z1=linkage(y1);
figure(1)
[h1,T1,v1] = dendrogram(Z1,lng1);
close (figure(1));
Dendo1=R1(v1,v1);

