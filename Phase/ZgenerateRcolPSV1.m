function PSVvec=ZgenerateRcolPSV1(Rcolomn)

clc; home;

% if isempty(varargin),
%     error('not enough inputs');
% end
n=size(Rcolomn,3);%number of PSs
m=size(Rcolomn,1);%size of each PS

for i=1:n-1
    temp=0;
    cnt=1;
    for j=2:m
        for k=1:(j-1)
            temp=temp+abs(Rcolomn(j,k,i)-Rcolomn(j,k,i+1)) ;        %#ok<NASGU>
            cnt=cnt+1;
        end
    end
    PSVvec(i)=temp/cnt;
end
%     
% 
% for i=1:n-1
%      PSVvec(i)=mean(mean(abs(Rcolomn(i+1)-Rcolomn(i))));
% end
%     