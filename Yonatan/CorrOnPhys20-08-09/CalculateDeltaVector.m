function [VDelta,nPre] = CalculateDeltaVector(CorrMatPre, CorrMatPost,reference)
% This function returnes
%a vector holding the evolution of the delta
%the number of the last step in the pre section (where the treatment was
%given)
% variable. 
%Delta(i) is calculated as the sum of absolute value of  all 
% entries in the difference matrix  Corr(i) -Corr(reference)
% reference is the number of the correlation matrix that all matrices will
% be subtracted from. If reference = 0 then each matrix is compared to the
% previous matrix.

nPre = size(CorrMatPre,3);
nPost = size(CorrMatPost,3);

if reference ~=0
    for i = 1:nPre
        VDelta(i)=sum(sum(abs(CorrMatPre(:,:,i) - CorrMatPre(:,:,reference))));
    end
    for i=1:nPost
        VDelta(i+nPre)=sum(sum(abs(CorrMatPost(:,:,i) - CorrMatPre(:,:,reference))));
    end
else
    for i = 2:nPre
        VDelta(i)=sum(sum(abs(CorrMatPre(:,:,i) - CorrMatPre(:,:,i-1))));
    end
    VDelta(i+nPre)=sum(sum(abs(CorrMatPost(:,:,1) - CorrMatPre(:,:,nPre))));
    for i=2:nPost
        VDelta(i+nPre)=sum(sum(abs(CorrMatPost(:,:,i) - CorrMatPost(:,:,i-1))));
    end   
end
