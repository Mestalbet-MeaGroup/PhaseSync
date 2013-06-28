function RcolomnN=ZRcolomnNormalize(Rcolomn)

clc; home;

% if isempty(varargin),
%     error('not enough inputs');
% end
n=size(Rcolomn,3);%number of PSs
for i=1:n
    RcolomnN(:,:,i)=ZMatNormalize(Rcolomn(:,:,i)); %#ok<NASGU>
end

    