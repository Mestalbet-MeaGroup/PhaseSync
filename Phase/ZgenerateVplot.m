% This function generates Vplot which is the axis label for the PS matrices
% Vref is obtained from ZgenerateCrPrePost and is the NUMBER order of the dendrogram
% typical:  [Vplot]=ZgenerateVplot (VelecPre,Vref);
%##########################################################################
%Rev1- 041109
%##########################################################################

function [Vplot]=ZgenerateVplot (ic,vref)

a=size(ic,2);
Vplot=zeros(1,a);

for i=1:a
    if ic(2,vref(i)) == 1
        Vplot(i) = ic(1,vref(i));
    else %this is neuron 2 on the same electrod
          Vplot(i) = ic(1,vref(i))+0.2;
    end
end
