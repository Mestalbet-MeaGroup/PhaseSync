function  CorrOnPhys2(PhysMat , CorrMat, th, flag, ElecNeuron, varargin)
% Last changed by Yonatan, 12:30 11/8/2009

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

% flag = 1 : Connections, and neurons (minimal circles) 
% flag = 2: No Connections, neurons according to centrality
% flag = 3: Connections and neurons according to centrality

%ElecNum - a 2XN matrix holding the mapping of electrodes (1st column, 
%numbered as they are in the PhysMat) to valid neurons (2nd column,
%numbered from 1 to N, numbers corresponding to CorrMat Order)

cmap = colormap('jet');
close;

[NeuronNum,X] = sort(ElecNeuron(:,2));
%making sure the neuron number vector is sorted

ElecNum = ElecNeuron(X,1) ;
%reordering the electrode vector to match the neuron order

[nx,ny] = size(PhysMat) ;
VPhysMat = PhysMat ; %PhysMat with valid neurons only
NVPhysMat = zeros(nx,ny); %Phys Mat with non-valid neurons only
for i = 1:nx
    for j=1:ny
        if find(ElecNum ==PhysMat(i,j))
        else
            VPhysMat(i,j) = 0 ;
            NVPhysMat(i,j) = PhysMat(i,j) ;
        end        
    end
end


[VPhysRow,VPhysCol,VElecNum] = find(VPhysMat);
per = FindPermute(ElecNum,VElecNum) ;
%finding the permutation needed to turn all the vectors corresponding to
%each neurons to match the neuron vector (1..N)
VPhysRow = VPhysRow(per) ;
VPhysCol = VPhysCol(per) ;

N = length(CorrMat);

% Will use sum of absoulute value of correlations of each neuron with all
% other neurons as a basic measure of neuron centrality
NeuronCent = -1 + sum(abs(CorrMat)) ;
MaxCent = max(NeuronCent) ;

if (N~=length(ElecNeuron))
    error('Neuron number in physical matrix and correlation matrix must agree');
end

figure('Position',[50 100 600 500]);

[NVPhysRow,NVPhysCol,NVElecNum] = find(NVPhysMat);
%finding the axis for the electrodes without neurons
NNV = length(NVPhysRow);
%number of non-valid electrodes



%Plot the lines connecting the channels (above the threshold)
if (flag ~= 2)
MaxConnection = max(max(-eye(N)+abs(CorrMat)));
for i=1:N
    for j=1:i-1
        if abs(CorrMat(i,j))>=th
        line([VPhysCol(i),VPhysCol(j)],[VPhysRow(i),VPhysRow(j)],'color',cmap(ceil(63*abs(CorrMat(i,j))/MaxConnection) ,:),'linewidth',0.001+10*abs(CorrMat(i,j)));
           hold on ;
        end
    end
end
end

% Plot the location of each neuron in the real space

%spy(PhysMat,'o',10) ;
clr = cmap(1+ceil(NeuronCent*62/MaxCent) ,:);
for i=1:N
    if (flag ~= 1) 
        scatter(VPhysCol(i),VPhysRow(i),200*(0.8+0.4*NeuronCent(i)),'MarkerFaceColor',[clr(i,1) clr(i,2) clr(i,3)],'MarkerEdgeColor',[0 0 0 ]);
        hold on;
    else
        scatter(VPhysCol(i),VPhysRow(i),180,'MarkerFaceColor',[1 1 1],'MarkerEdgeColor',[0 0 0 ]);
        hold on;
    end
end

scatter(NVPhysCol,NVPhysRow,180,'MarkerFaceColor',[0.5 0.5 0.5]);
hold on; 

%3rd argument is the neuron 'bubble' size determined according to neuron centrality

for i=1:N
      text(VPhysCol(i)-0.1,VPhysRow(i),num2str(ElecNum(i)),'fontsize',10,'FontWeight','bold','color',[0 0 0]);
end
%numbers for valid electrodes

for i=1:NNV
      text(NVPhysCol(i)-0.1,NVPhysRow(i),num2str(NVElecNum(i)),'fontsize',10,'FontWeight','bold','color',[0 0 0]);
end
%numbers for non-valid electrodes


axis ([0.8 size(PhysMat,1)+0.2 0.8 size(PhysMat,2)+0.2 ] ) ;
axis off;
%title(varargin{1},'FontSize',12);



