function [centrality] = NodeCentrality(matrix,thr,zerothr)

% 24-08-09
% input
% matrix - correlation/affinity/distance matrix
% thr - threshold for adjacency matrix
% zerothr - threshold for changing centrality values to zero
% output
% centrality - centrality vector

N = size(matrix,1) ;
%matrix(find(matrix>thr)) = 1;
%matrix(find(matrix~=1)) = 0 ;

[v,e]=eig(matrix);
centrality=v(:,N);
centrality(find(centrality<zerothr)) = 0;
%bar(centrality)
