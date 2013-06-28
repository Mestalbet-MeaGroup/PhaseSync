% Ziv Yekutieli - ziv.yekutieli@intel.com
%This emphasizes the PS matrix to be plotted accorfing to logaritmic scale
%%##########################################################################
%Rev1- 150110
%##########################################################################

function MatE=ZMatEmphasize(Mat,Power)
clc; home;

% if isempty(varargin),
%     error('not enough inputs');
% end

[m1,n1] = size(Mat);
if (m1~=n1)
     error('Matrix is not square one, probably not Phase Sync one ');
end

MatE=ones(m1,n1);
for i=2:m1
    for j=1:(i-1)
        MatE(i,j)=Mat(i,j)^Power;
        MatE(j,i)=MatE(i,j); %keep the matrix symetric
    end
end

