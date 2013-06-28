function  [h] = CorrOnPhys7_Noah(PhysMat , CorrMat, VElec, th,thr, flag, dright, varargin)
% Last changed by Yonatan, 19:00 13/8/2009

% This function plots the correlation \ PS matrix on the physical structure
    
%------------------- Inputs -----------------------------------------------
% PhysMat is a map of the electrodes in the recording apperatus (the
% physical location of the recorded neurons. PhysMat(i,j) holds the neuron
% number in the Correlation Matrix (1..N) or 0 if there is no valid neuron
% in this place.

% "CorrMat" - Is the N by N correlation matrix. I assume all data is valid (this code performs no checks on data validity).

%VElec - a vector holding the electrodes corresponding to the N neurons
%if 2 channels are recorded by the same neuron, must run FixMultipleChannels first
% and then CorrOnPhys

% "th" - is the threshold for linking points in the affinity space. Two
% channels whose correlation is higher then the threshold would be linked by a line. 
% The color of the line and its thickness would be according to the correlation value. 

% flag = 1 : Connections, and neurons (minimal circles) 
% flag = 2: No Connections, neurons according to centrality
% flag = 3: Connections and neurons according to centrality

%dright - is the difference between the alignment of the odd rows and the even rows

N = length(CorrMat); %N - number of valid neurons

if (N~=length(VElec))
    error('Neuron number in physical matrix and correlation matrix must agree');
end


cmap = colormap('jet');
close all;


[nx,ny] = size(PhysMat) ;
VPhysMat = PhysMat ; %PhysMat with valid neurons only
NVPhysMat = zeros(nx,ny); %Phys Mat with non-valid neurons only
for i = 1:nx
    for j=1:ny
        if find(VElec ==PhysMat(i,j)) 
% if an electrode number in the PhysMat does not appear in VElec it is deleted 
% from VPhysMat and added to NVPhysMat  
        else
            VPhysMat(i,j) = 0 ;
            NVPhysMat(i,j) = PhysMat(i,j) ;
        end        
    end
end


[VPhysRow,VPhysCol,VisElec] = find(VPhysMat);
% all non zero entries in VPhysMat and their indices are put 
%in 3 vectors by the order of their appearance in VPhysMat

per = FindPermute(VisElec,VElec) ;
%finding the permutation needed to reorder the 3 vectors created above:
%the permutation needed is the permutation that turns VisEle to VElec which 
%corresponds to the neuron order in the correlation matrix
VPhysRow = VPhysRow(per) ;
VPhysCol = VPhysCol(per) + dright*(mod(VPhysRow,2)) ;
%applying the permutation


% Will use sum of absoulute value of correlations of each neuron with all
% other neurons as a basic measure of neuron centrality
% NeuronCent = -1 + sum(abs(CorrMat)) ;
% MaxCent = max(NeuronCent) ;
% 
% CentTh =median(reshape(CorrMat,1,N^2));
NeuronCent = 20*NodeCentrality(CorrMat,  0,0);
MaxCent = max(NeuronCent) +0.001;


[NVPhysRow,NVPhysCol,NVisElec] = find(NVPhysMat);
%finding the axis for the electrodes without neurons
NVPhysCol = NVPhysCol + dright*(mod(NVPhysRow,2)) ;
NNV = length(NVPhysRow);
%number of non-valid electrodes

%different options for figure size:

% scrsz = get(0,'ScreenSize');
%h=figure('Position',[scrsz(3)/5 scrsz(4)/5 scrsz(3)/1.5 scrsz(4)/1.5]);
%figure('Position',[50 100 600 500]);
figure('Position',[50 100 800 800]);
%figure('Position',[50 100 300 300]);

scatter(NVPhysCol,NVPhysRow,180,'MarkerFaceColor',[0.5 0.5 0.5]);
hold on; 
% for i=1:NNV
%    text(NVPhysCol(i)-0.05,NVPhysRow(i),num2str(NVisElec(i)),'fontsize',10,'FontWeight','bold','color',[0 0 0]);
% end
% %Non valid electrodes & numbers are plotted 1st so they don't interfere with more important data

%Plot the lines connecting the channels (above the threshold)
if (flag ~= 2)
MaxConnection = max(max(-eye(N)+abs(CorrMat)));
k=1;

for i=1:N
    for j=1:i-1
        if abs(CorrMat(i,j))>=th
%         line([VPhysCol(i),VPhysCol(j)],[VPhysRow(i),VPhysRow(j)],'color',cmap(ceil(0.01+63*abs(-th+CorrMat(i,j))/MaxConnection) ,:),'linewidth',5);
          a(k)= (0.01+63*(abs(-th+CorrMat(i,j))/MaxConnection)^.2 );
          k=k+1;
        end
    end
end
b=(MakeGaussian(mean(a),std(a)*5,length(a)))*100;
ab=a.*b(1:length(a));
ab=ab-(max(ab)-64);
ab(ab<0)=1;
k=1;

for i=1:N
    for j=1:i-1
        if abs(CorrMat(i,j))>=th
          line([VPhysCol(i),VPhysCol(j)],[VPhysRow(i),VPhysRow(j)],'color',cmap(ceil(ab(k)),:),'linewidth',5);
          k=k+1;
          hold on ;
        end
    end
end

end
% Plot the location of each neuron in the real space


%spy(PhysMat,'o',10) ;
b=abs(-thr+NeuronCent*62/MaxCent);
c=b;
b(NeuronCent<=thr)=[];
t=(MakeGaussian(mean(b),std(b)*3,length(c)-1)).*30;
clear b;
t(end)=[];
b=c.*t';
b=b-(max(b)-63);
b(b<0)=1;
clr = cmap(1+ceil(b) ,:);

f=1;
for i=1:N
%    if (NeuronCent(i)>(4*th))
    if (flag ~= 1)&&(NeuronCent(i)>(thr))
        scatter(VPhysCol(i),VPhysRow(i),800,'MarkerFaceColor',[clr(i,1)^f clr(i,2)^f clr(i,3)^f],'MarkerEdgeColor',[0 0 0 ]);
        hold on;
    else
        scatter(VPhysCol(i),VPhysRow(i),180,'MarkerFaceColor',[0.5 0.5 0.5],'MarkerEdgeColor',[0 0 0 ]);
        hold on;
    end
%    end
end
%3rd argument is the neuron 'bubble' size determined according to neuron
%centrality if flag~=1 (in this case only basic one sized circles are
%plotted

for i=1:N
     if (mod(VElec(i),1)~=0)
         moveleft = 0.25 ;
     else
         moveleft = 0.05 ;
     end
     if (NeuronCent(i)>(thr))
     text(VPhysCol(i)-moveleft,VPhysRow(i),num2str(VElec(i)),'fontsize',10,'FontWeight','bold','color',[0 0 0]);
     end
end
%numbers for valid electrodes
%text(0,10.5,varargin{1},'FontSize',25);
axis ij ;
axis off;
title({varargin{1};''},'FontName','Callisto MT','FontSize',18);
h = gcf;



