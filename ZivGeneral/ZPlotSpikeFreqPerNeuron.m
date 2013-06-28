%PlotSpikeFreqPerNeuron
function Success=ZPlotSpikeFreqPerNeuron(Spk,ic)
[m n]=size(Spk);
String=[];

for i=1:(n/2)
  Spk(:,2*i)=Spk(:,2*i)/3600;
 eval(['z',num2str(i),'(1:m)=',num2str(i),';'])
 String = [String, ',Spk(:,',num2str(2*i),')',',z',num2str(i),',Spk(:,',num2str(2*i-1),')'];
 
 %plot the per neuron FR 
 figure(i)
 plot(Spk(:,2*i),Spk(:,2*i-1))
 xlabel('Time[hrs]');
ylabel('Normalized Spike Density');
title(['Electrode  ' ,num2str(ic(1,i)), '_' num2str(ic(2,i))])

end

String = String(2:end);
figure(1); 
eval(['plot3(',String,');']);
xlabel('Time [hrs]');
ylabel('Neuron #');
zlabel('Normalized Firing Frequency');

 set(gca,'YTick',[0:1:length(ic)])
 set(gca,'YTickLabel',[0,ic(1,:)])

Success=1;