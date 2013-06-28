% Ziv Yekutieli - ziv.yekutieli@intel.com
%This function recieves one matrix (typically one floor of Rcolomn
%or CRcolomn) and normilize it by applying to each ellement: 
%subtract from each element PSij the overall mean of PS, then devide by PSstd
% 
%##########################################################################
%Rev1- 150110

function MatN=ZMatNormalize(Mat)
clc; home;

% if isempty(varargin),
%     error('not enough inputs');
% end
[m1,n1] = size(Mat);
if (m1~=n1)
     error('Matrix is not square one, probably not Phase Sync one ');
end
[MatMean, MatSTD,MatVec]=ZMatStatistics(Mat);
MatN=ones(m1,n1);
for i=2:m1
    for j=1:(i-1)
        MatN(i,j)=(Mat(i,j)-MatMean)/MatSTD;
        MatN(j,i)=MatN(i,j); %keep the matrix symetric
    end
end

MatN=MatN/(1.05*max(max(MatN)));
for i=1:m1
    MatN(i,i)=1;
end
