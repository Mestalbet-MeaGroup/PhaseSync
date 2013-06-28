function SmoothVec=ZSmoothVec(V,by)

clc; home;

% if isempty(varargin),
%     error('not enough inputs');
% end
n=length(V);
s=floor(n/by);
SmoothVec=zeros(1,s);
for i=1:s
    for j=1:by
        SmoothVec(i)=SmoothVec(i)+V((i-1)*by+j); %#ok<NASGU>
     end
end
    SmoothVec=SmoothVec/by; %normalize by root of mean mult'

    