function SpikePerElectorde=CountSpikePerElectrode(indexchannel);

% this function recieves the indexchannel matrix and returns the number of
% spikes per electrode (doesn't care about sorting, all neurons on the same
% elctorde are counted)

el = 60; %for 60 electodes
[m n] = size(indexchannel);
SpikePerElectorde = zeros (2,el); 
for j=1:el
     for i=1:n
        SpikePerElectorde(1,j)=j; 
        if indexchannel(1,i)== j
            SpikePerElectorde(2,j)= SpikePerElectorde(2,j)+ [indexchannel(4,i)-indexchannel(3,i)]+1;
        end;
        i=i+1;
    end;
    j=j+1;
end

