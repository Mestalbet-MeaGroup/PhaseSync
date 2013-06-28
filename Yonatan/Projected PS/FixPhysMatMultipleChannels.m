function [PhysMat, ElecNeuron] = FixPhysMatMultipleChannels(PhysMat, ElecNeuron)
PhysMat = InflatePhysMat(PhysMat);
ElecNeuron = FixElecNeuronMultipleChannels(ElecNeuron) ;
Multiples = ElecNeuron(:,find(mod(ElecNeuron(:,1),1)));
Multiples(:,2) = mod(Multiples,1);
Multiples(:,1) = floor(Multiples);
for i=1:size(Multiples,1)
    [x,y] = find(PhysMat==Multiples(i,1)) ;
    if Multiples(i,2) == 0.1 
        PhysMat(x,y) = PhysMat(x,y) + 0.1 ;
    end
    if Multiples(i,2) == 0.2 
        PhysMat(x+1,y) = PhysMat(x,y) + 0.2 ;
    end
    if Multiples(i,2) == 0.3 
        PhysMat(x,y+1) = PhysMat(x,y) + 0.3 ;
    end
      if Multiples(i,2) == 0.4 
        PhysMat(x+1,y+1) = PhysMat(x,y) + 0.2 ;
    end
end
