% Ziv Yekutieli - ziv.yekutieli@intel.com
%This function recieves one matrix (typically one floor of Rcolomn
%or CRcolomn) and returns the statistics required for future analysis.
% function returns MatVec which is all the elemnets of the matrix other than
%the diagonal which is always 1 (self synchronization). since matrice is symetrical we deal with half of it
%we also return the mean value and std of MatVec
%##########################################################################
%Rev1- 040909

function [MatMean, MatSTD,MatVec]=ZMatStatistics(Mat)
clc; home;

% if isempty(varargin),
%     error('not enough inputs');
% end
[m1,n1] = size(Mat);

if (m1~=n1)
     error('Matrix is not square one, probably not Phase Sync one ');
end
k=1;
for i=2:m1
    for j=1:(i-1)
        MatVec(k)=Mat(i,j);
        k=k+1;
    end
end
MatMean=mean(MatVec);
MatSTD=std(MatVec);

    