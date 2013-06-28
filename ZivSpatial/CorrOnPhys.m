function  CorrOnPhys(PhysMat , CorrMat, th,varargin)
% Last changed by Yonatan, 12:30 5/8/2009

% This function plots the correlation \ PS matrix on the physical structure
    
%------------------- Inputs -----------------------------------------------
% PhysMat is a map of the electrodes in the recording apperatus (the
% physical location of the recorded neurons. PhysMat(i,j) holds the neuron
% number in the Correlation Matrix (1..N) or 0 if there is no valid neuron
% in this place.


% "CorrMat" - Is the N by N correlation matrix. I assume all data is valid (this code performs no checks on data validity).

% Number of non-zero elements in PhysMat must equal the size of the CorrMat


% "th" - is the threshold for linking points in the affinity space. Two
% channels whose correlation is higher then the threshold would be linked by a line. 
% The color of the line and its thickness would be according to the correlation value. 

cmap = colormap('jet');


[PhysRow,PhysCol,NeuronNum] = find(PhysMat);
[NeuronNum, X] = sort(NeuronNum); 
PhysRow = PhysRow(X) ;
PhysCol = PhysCol(X) ;

N = length(CorrMat);

% Will use sum of absoulute value of correlations of each neuron with all
% other neurons as a basic measure of neuron centrality
NeuronCent = -1 + sum(abs(CorrMat)) ;

if (N~=length(NeuronNum))
    error('Neuron number in physical matrix and correlation matrix must agree');
end

%Plot the lines connecting the channels (above the threshold) 
for i=1:N
    for j=1:i-1
        if abs(CorrMat(i,j))>=th
        line([PhysCol(i),PhysCol(j)],[PhysRow(i),PhysRow(j)],'color',cmap(64 - round(63*(abs(CorrMat(i,j)))),:),'linewidth',4*abs(CorrMat(i,j)));
           hold on ;
        end
    end
end

% Plot the location of each neuron in the real space

%spy(PhysMat,'o',10) ;

scatter(PhysCol,PhysRow,200*(0.8+0.4*NeuronCent),'MarkerFaceColor',[1 1 1],'MarkerEdgeColor',[0 0 0 ]);

%3rd argument is the neuron 'bubble' size determined according to neuron
%centrality

for i=1:N
      text(PhysCol(i)-0.1,PhysRow(i),num2str(NeuronNum(i)),'fontsize',10,'FontWeight','bold','color',[0 0 0]);
end

axis ([0.8 size(PhysMat,1)+0.2 0.8 size(PhysMat,2)+0.2 ] ) ;
axis off;
title(varargin{1},'FontSize',12);



