function [MEANvec, STDvec,PSVvec]=ZgenerateRcolMeanStd(Rcolomn)

clc; home;

% if isempty(varargin),
%     error('not enough inputs');
% end
n=size(Rcolomn,3);%number of PSs
m=size(Rcolomn,1);%size of each PS
for i=1:n
    [MEANvec(i), STDvec(i),MatVec]=ZMatStatistics(Rcolomn(:,:,i)); %#ok<NASGU>
end

for i=1:n-1
    for j=2:m
        for k=1:(j-1)
            PSVvec(i)=abs(mean(mean(Rcolomn(j,k,i)-Rcolomn(j,k,i+1)))); %#ok<NASGU>
        end
    end
end
    