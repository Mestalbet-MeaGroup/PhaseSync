% by Ziv Yekutieli - ziv.yekutieli@hotmail.com
% this function calculates the distance between all the elements in two vectors v1, v2. 
% Inputs:
% the function receives two vectors v1, v2 that should be in the same lenght and contain the same elemets. 
% e.g. v1=[3,17,4,5], v2=[17,4,3,5]
% Outputs:
% Vdist contains the distances per vector elements, which is the delta  between the location in v1 and in v2. 
% e.g. if v1(1)=17 and v2(3)=17 -->  d(1)=3-1=2
% e.g. if v1(3)=10 and v2(3)=10 -->  d(3)=3-3=0
% distance is the overall Euclidian distance between v1 and v2 (sqrt of sum of squared deltas)
% 010510 - rev1
% 050510 - rev2 - function also returns the sqrt distance

function [distance,Vdist] = ZVectorsDistance(v1,v2)
a=length(v1);
if length(v2)~= a
    error ('^^^ Input vectors lengthes do not match')
else
    Vdist=zeros(1,a);
    for i=1:a
        j=find(v2==v1(i));
        if (isempty(j)==1); error('^^^ v1(%d) = %d, it does not apear in v2', i,v1(i)); end
        Vdist(i)=abs(i-j);
    end
end

distance=sqrt(sum(Vdist.^2));


