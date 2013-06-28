% this function generates a 2D MEA matrix, for each channel with the
% corresponding count of spikes, according to the map of the MEA
% it recieves the SpikePerElectrode vector, the MEAmap, and plots the first
% over the second

function MEAspikes=FillMEAmat(SpikePerElectrode,MEAmap);

MEAspikes = zeros(size(MEAmap));
n = length(SpikePerElectrode);

for i=1:n
    [k l] = find(MEAmap==(SpikePerElectrode(1,i))); 
    MEAspikes(k,l)= SpikePerElectrode(2,i);
end

imagesc(MEAspikes); figure(gcf)
colorbar

% adding the numbering of the electrodes according to MEA map
for i=1:8
    for j=1:8
        str=num2str(MEAmap(i,j));
        text(j-0.4,i-0.3,['\color{white} \fontsize{8}' str],'FontWeight','bold');
    end
end
