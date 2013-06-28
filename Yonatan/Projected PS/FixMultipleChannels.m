function [PhysMat, VElec] = FixMultipleChannels(PhysMat, VElec)
PhysMat = InflatePhysMat(PhysMat);
PhysMat1 = PhysMat ;
%insert zero rows & columns
VElec = FixElecNeuronMultipleChannels(VElec) ;
%insert non redundant electrode numbers (0.1,0.2,...)
Multiples = VElec(find(mod(VElec,1)));
%create a vector with redundant electrodes only
MultF = mod(Multiples,1);
MultI = floor(Multiples);

for i=1:length(MultI)
    [x,y] = find(PhysMat1==MultI(i)) ;
    if round(10*MultF(i)) == 1 
        PhysMat(x,y) = MultI(i) + 0.1 ;
    end
    if round(10*MultF(i)) == 2 
        PhysMat(x+1,y) = MultI(i)+ 0.2 ;
    end
    if round(10*MultF(i)) == 3
        PhysMat(x,y+1) = MultI(i) + 0.3 ;
    end
      if round(10*MultF(i)) == 4
        PhysMat(x+1,y+1) = MultI(i) + 0.4 ;
      end
%put in 'inflated' physical matrix all the recorded channels
end
