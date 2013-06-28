% Ziv Yekutieli - ziv.yekutieli@intel.com
%This function recieves two vectors  (typically pre and post) and generate
% a plot with both of them.
% deltaT is the time between two sample points, typically 0.5h
%##########################################################################
%Rev1- 120110
%Rev2 - 
%##########################################################################


function ZPlotPrePostVsT (Vpre,Vpost,deltaT, MinY, MaxY, MinX, MaxX,varargin);


%Plotting
axispre=[0:length(Vpre)-1];
Boundary=max(axispre);
axispost=[Boundary+1:Boundary+length(Vpost)] ;%to be used to shift Post Vec on time axis

%Yaxis limits
if strcmp(MinY,'AutoMinY')
    ymin=min(min(Vpre),min(Vpost));
else
    ymin=MinY;
end

if strcmp(MaxY,'AutoMaxY')
    ymax=1.1*max(max(Vpre),max(Vpost));
else
    ymax=MaxY;
end

%Xaxis limits
if strcmp(MinX,'AutoMinX')
    xmin=0;
else
    xmin=MinX;
end

if strcmp(MaxX,'AutoMaxX')
    xmax=length(Vpre)+length(Vpost);
else
    xmax=MaxX;
end

f1=length(Vpre)+length(Vpost);
Ttotal=ceil(f1*deltaT) ;% the lenght in hours of the entire plot
labels=[0:4*deltaT:Ttotal];
locations=[0:4:f1];

%%%%%%
figure
plot(axispre,Vpre,'b','LineWidth',2)
hold on
plot (axispost,Vpost,'r','LineWidth',2)
ylim([ymin ymax]);
xlim([xmin xmax]);
set(gca,'XTick',locations)
set(gca,'XTickLabel',{labels})
text(Boundary-3,ymin+(ymax-ymin)/2,' NCS \rightarrow ','FontSize',12)
line([Boundary+0.5 Boundary+0.5],[ymin ymax],'LineStyle','--','LineWidth',6,'Color',[0.7,0.7,0.7]);
title([varargin{1}],'FontSize',12) ;    
xlabel('t[h]');
ylabel([varargin{2}],'FontSize',12) ;
hold off
