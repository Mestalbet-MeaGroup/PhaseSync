if isempty(varargin),
    error('not enough inputs');
end

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

[WT3sPreMEANvec, WT3sPreSTDvec,WT3sPrePSVvec]=ZgenerateRcolMeanStdPSV(RcolomnPreS);
[WT3sPostMEANvec, WT3sPostSTDvec,WT3sPostPSVvec]=ZgenerateRcolMeanStdPSV(RcolomnPostS);
[WT3sNPreMEANvec, WT3sNPreSTDvec,WT3sNPrePSVvec]=ZgenerateRcolMeanStdPSV(RcolomnPreSN);
[WT3sNPostMEANvec, WT3sNPostSTDvec,WT3sNPostPSVvec]=ZgenerateRcolMeanStdPSV(RcolomnPostSN);

% 
% for i=21:34
%     i
%     61-i
%     RcolomnPostS2(:,:,i)=RcolomnPostS(:,:,61-i);
% end
% for i=35:45
%     i
%     i-14
%     RcolomnPostS2(:,:,i)=RcolomnPostS(:,:,i-14);
% end
% save('D:\Freshhh\ZivPSresults\Second\KO2\KO2Rcolomn25','RcolomnPre','VelecPre','RcolomnPost','VelecPost');
% fprintf ('\n KO2 Rcolomn Pre Post is saved. \n');
% clear all;
