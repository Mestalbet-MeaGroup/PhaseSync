% this function returns Dendo2 which is the dendrogram of R2, which is sorted by v1 order.
% It also returns v2 which is the order of the R2 dendrogram elements (the optimal order of R2 itself)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 070210 
 
function [Dendo2,v2]=ZdendrogramR2byV1(R2,v1)
clc;  home;
%generate R1 dendrogram
lng2=size(R2,1);
y2=pdist(R2);
Z2=linkage(y2);
figure(1)
[h2,T2,v2] = dendrogram(Z2,lng2);
%close (figure(1));
Dendo2=R1(v1,v1);

