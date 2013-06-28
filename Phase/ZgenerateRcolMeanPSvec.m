function [MeanPSvec, StdPSvec]=ZgenerateRcolMeanPSvec(Rcolomn)

clc; close all; home;

% if isempty(varargin),
%     error('not enough inputs');
% end
n=size(Rcolomn,3);

for i=1:n
    [MeanPSvec(i), StdPSvec(i),MatVec]=ZMatStatistics(Rcolomn(:,:,i)); %#ok<NASGU>
end

    