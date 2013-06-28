clc;home;
%close all;


% figure
plot(KO4MatVecDeltaMean3,'b','LineWidth',3)
hold on
plot (c1,KO4MatVecDeltaMean4,'r','LineWidth',3)
ylim([d2 d1]);
xlim([0 f1]);
set(gca,'XTickLabel',{h1})
set(gca,'XTick',h1*f1/f2)
xlabel('t [h]')
ylabel('mean(abs(PS(i+1)-PS(i))) ')
text(length(KO4MatVecDeltaMean3)-10,(d1-d2)/4,' NCS \rightarrow ','FontSize',12)
line([length(KO4MatVecDeltaMean3) length(KO4MatVecDeltaMean3)],[0 d1],'LineStyle','--','LineWidth',6,'Color',[0.7,0.7,0.7]);
title(['KO2 - mean delta between two Phase sync vs. time (dPS/dt)'],'FontSize',16) ;    
hold off