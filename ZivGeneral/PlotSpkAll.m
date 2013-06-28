function PlotSpkAll(SpkPre,SpkNCS,SpkPost)
PreEndTime=max(SpkPre(:,2))/3600
NCSEndTime=PreEndTime+max(SpkNCS(:,2))/3600
PostEndTime=NCSEndTime+max(SpkPost(:,2))/3600

SpkPre(:,2)=SpkPre(:,2)./3600;
SpkNCS(:,2)=SpkNCS(:,2)./3600;
SpkPost(:,2)=SpkPost(:,2)./3600;

figure;
Subplot(3,1,1)
plot(SpkPre(:,2),SpkPre(:,1));
title('Pre NCS Global Firing Rate');
% ylim([0 3]);
xlabel('Time[hrs]');
ylabel('Normalized Spike Density');

Subplot(3,1,2)
plot(SpkNCS(:,2),SpkNCS(:,1));
title(' NCS Global Firing Rate');
% ylim([0 3]);
xlabel('Time[hrs]');
ylabel('Normalized Spike Density');

Subplot(3,1,3)
plot(SpkPost(:,2),SpkPost(:,1));
title('Post NCS Global Firing Rate');
% ylim([0 3]);
xlabel('Time[hrs]');
ylabel('Normalized Spike Density');


%%%%% Merging plots

SpkNCS(:,2)=SpkNCS(:,2)+PreEndTime;
SpkPost(:,2)=SpkPost(:,2)+NCSEndTime;

figure
plot(SpkPre(:,2),SpkPre(:,1),'b',SpkNCS(:,2),SpkNCS(:,1),'g',SpkPost(:,2),SpkPost(:,1),'r');
title('Overall Global Firing Rate');
% ylim([0 3]);
xlabel('Time[hrs]');
ylabel('Normalized Spike Density');
