function  CorrOnPhys1(PhysMat , CorrMat, th,varargin)


% This function plots the correlation \ PS matrix on the physical structure
    
%------------------- Inputs -----------------------------------------------
% PhysMat is a map of the electrodes in the recording apperatus (the
% physical location of the recorded neurons. PhysMat(i,j) holds the neuron
% number in the Correlation Matrix (1..N) or 0 if there is no valid neuron
% in this place.


% "CorrMat" - Is the N by N correlation matrix. I assume all data is valid (this code performs no checks on data validity).

% "th" - is the threshold for linking points in the affinity space. Two
% channels whose correlation is higher then the threshold would be linked by a line. 
% The color of the line and its thickness would be according to the correlation value. 


[PhysRow,PhysCol,NeuronNum] = find(PhysMat);
[NeuronNum, X] = sort(NeuronNum); 
PhysRow = PhysRow(X) ;
PhysCol = PhysCol(X) ;

cmap = colormap('jet');

N = length(CorrMat);


% Plot the location of each neuron in the real space 
figure
spy(PhysMat,'o',10) ;
hold on;

%Plot the lines connecting the channels (above the threshold) 
for i=1:N
    for j=1:i-1
        if (abs(CorrMat(i,j))>=th)
            line([PhysCol(i),PhysCol(j)],[PhysRow(i),PhysRow(j)],'color',cmap(64 - round(63*(abs(CorrMat(i,j)))),:),'linewidth',4*CorrMat(i,j));
            hold on ;
        end
    end
end


grid on



%add electrode numbers
for i=1:16
    for j=1:16
        str=num2str(PhysMat(i,j));
        text(j-0.4,i-0.3,['\color{black} \fontsize{8}' str],'FontWeight','bold');
    end
end

%
title(varargin{1},'FontSize',12);