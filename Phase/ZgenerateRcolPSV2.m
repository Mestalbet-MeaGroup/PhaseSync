function PSVvec=ZgenerateRcolPSV2(Rcolomn,MEANvec)

% clc; home;

% if isempty(varargin),
%     error('not enough inputs');
% end
n=size(Rcolomn,3);%number of PSs
m=size(Rcolomn,1);%size of each PS

for i=1:n-1
    PSVvec(i)=0;
    for j=2:m
        for k=1:(j-1)
            PSVvec(i)=PSVvec(i)+abs(Rcolomn(j,k,i)-Rcolomn(j,k,i+1)); 
        end
    end
    PSVvec(i)=PSVvec(i)/sqrt(abs(MEANvec(i)*MEANvec(i+1))); %normalize by root of mean mult'
end
    