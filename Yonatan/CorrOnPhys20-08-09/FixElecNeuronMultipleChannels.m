function [ElecNum] = FixElecNeuronMultipleChannels(ElecNum)
i = 0 ;
j = 1; 
VElec = ElecNum;
while i+j<=length(VElec)-1
    i = i+j ;
    j = 1 ;
    while VElec(i) == VElec(i+j)
        if (j==1)
            ElecNum(i) = ElecNum(i) + 0.1 ;
        end
        ElecNum(i+j) = ElecNum(i+j) + (j+1)*0.1 ;
        j = j+1 ;
    end
end
