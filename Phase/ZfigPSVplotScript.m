%Generate PSV plot script

set(0,'Units','normalized') 
% pos1 = [0.1,  0.1 , 0.5, 0.8 ];
% % scnsize = get(0,'ScreenSize');
% %pos1 = [30,  1/3*scnsize(4)-200 , scnsize(3)-400, scnsize(4)-400 ];
% figure('Position',pos1) 
width=0.3;
height=0.4;
left=0.05;
bottom=0.05;
a=0.95;
b=0.95;


rect1 = [left           bottom+1.2*height a*width b*height];
rect2 = [left+1.1*width bottom+1.2*height a*width b*height]; 
rect3 = [left+2.2*width bottom+1.2*height a*width b*height];
rect4 = [left           bottom            a*width b*height];
rect5 = [left+1.1*width bottom            a*width b*height];
rect6 = [left+2.2*width bottom            a*width b*height];


%Notice order of plots is WT3 left (called WT1), WT1 is middle (called WT2), WT2 is right (called WT2)
load 'C:\Documents and Settings\zyekutie\My Documents\Academy\III\Data\WTKOdata\WT1s\WT1allS.mat'
PreMax=max(max(PrePSVvecS2_8),max(PostPSVvecS2_8));
DC=mean(PrePSVvecS2_8);
PrePlot=(PrePSVvecS2_8-DC)/PreMax+0.5;
PostPlot=(PostPSVvecS2_8-DC)/PreMax+0.5;
[PreDCAboveVec,PreDCVec,PreDCBelowVec]=ZGeneratePreDCstd(PrePlot,1);
[PostDCAboveVec,PostDCVec,PostDCBelowVec]=ZGeneratePreDCstd(PostPlot,1);
subplot (2,3,2)
set(gca,'Position',rect2)
ZPlotPrePostVsT(PrePlot,PostPlot,0.25,0,1,'AutoMinX','AutoMaxX','WT2 PSV vs. t');
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostDCAboveVec,'--','r',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostDCBelowVec,'--','r',2);
ZPlotStdLines (PreDCVec,'-.','g',2,PostDCVec,'-.','k',2);
%extending the pre lines to the post
PostDCAboveVec=ones(1,length(PostDCVec))*PreDCAboveVec(1);
PostDCBelowVec=ones(1,length(PostDCVec))*PreDCBelowVec(1);
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostDCAboveVec,'--','b',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostDCBelowVec,'--','b',2);

load 'C:\Documents and Settings\zyekutie\My Documents\Academy\III\Data\WTKOdata\WT2s\WT2allS.mat'
PreMax=max(max(PrePSVvecS2_8),max(PostPSVvecS2_8));
DC=mean(PrePSVvecS2_8);
PrePlot=(PrePSVvecS2_8-DC)/PreMax+0.5;
PostPlot=(PostPSVvecS2_8-DC)/PreMax+0.5;
[PreDCAboveVec,PreDCVec,PreDCBelowVec]=ZGeneratePreDCstd(PrePlot,1);
[PostDCAboveVec,PostDCVec,PostDCBelowVec]=ZGeneratePreDCstd(PostPlot,1);
subplot (2,3,3)
set(gca,'Position',rect3)
ZPlotPrePostVsT(PrePlot,PostPlot,0.25,0,1,'AutoMinX','AutoMaxX','WT3 PSV vs. t');
% ZPlotStdLines (PreDCAboveVec,'--','b',2,PostDCAboveVec,'--','r',2);
% ZPlotStdLines (PreDCBelowVec,'--','b',2,PostDCBelowVec,'--','r',2);
ZPlotStdLines (PreDCVec,'-.','k',2,PostDCVec,'-.','k',2);
%extending the pre lines to the post
PostDCAboveVec=ones(1,length(PostDCVec))*PreDCAboveVec(1);
PostDCBelowVec=ones(1,length(PostDCVec))*PreDCBelowVec(1);
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostDCAboveVec,'--','b',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostDCBelowVec,'--','b',2);

load 'C:\Documents and Settings\zyekutie\My Documents\Academy\III\Data\WTKOdata\WT3s\WT3allS.mat'
PreMax=max(max(PrePSVvecS2_8),max(PostPSVvecS2_8));
DC=mean(PrePSVvecS2_8);
PrePlot=(PrePSVvecS2_8-DC)/PreMax+0.5;
PostPlot=(PostPSVvecS2_8-DC)/PreMax+0.5;
[PreDCAboveVec,PreDCVec,PreDCBelowVec]=ZGeneratePreDCstd(PrePlot,1);
[PostDCAboveVec,PostDCVec,PostDCBelowVec]=ZGeneratePreDCstd(PostPlot,1);
subplot (2,3,1)
set(gca,'Position',rect1)
ZPlotPrePostVsT(PrePlot,PostPlot,0.25,0,1,'AutoMinX','AutoMaxX','WT1 PSV vs. t','PSV');
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostDCAboveVec,'--','r',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostDCBelowVec,'--','r',2);
ZPlotStdLines (PreDCVec,'-.','k',2,PostDCVec,'-.','k',2);
%extending the pre lines to the post
PostDCAboveVec=ones(1,length(PostDCVec))*PreDCAboveVec(1);
PostDCBelowVec=ones(1,length(PostDCVec))*PreDCBelowVec(1);
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostDCAboveVec,'--','b',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostDCBelowVec,'--','b',2);


%Notice order of plots is KO2 left (called KO1), KO3 is middle (called KO2), KO1 is right (called KO3)
load 'C:\Documents and Settings\zyekutie\My Documents\Academy\III\Data\WTKOdata\KO1s\KO1allS.mat'
PreMax=max(max(PrePSVvecS2_8),max(PostPSVvecS2_8));
DC=mean(PrePSVvecS2_8);
PrePlot=(PrePSVvecS2_8-DC)/PreMax+0.5;
PostPlot=(PostPSVvecS2_8-DC)/PreMax+0.5;
[PreDCAboveVec,PreDCVec,PreDCBelowVec]=ZGeneratePreDCstd(PrePlot,1);
[b,a,PostLinFitAbove,LinFit,PostLinFitBelow]=ZCalcLinearFit(PostPlot,1);
subplot (2,3,6)
set(gca,'Position',rect6)
ZplotPrePostVsT(PrePlot,PostPlot,0.25,0,1,'AutoMinX','AutoMaxX','KO3 PSV vs. t');
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostLinFitAbove,'--','r',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostLinFitBelow,'--','r',2);
ZPlotStdLines (PreDCVec,'-.','k',2,LinFit,'-.','k',2);
%extending the pre lines to the post
PostDCAboveVec=ones(1,length(LinFit))*PreDCAboveVec(1);
PostDCBelowVec=ones(1,length(LinFit))*PreDCBelowVec(1);
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostDCAboveVec,'--','b',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostDCBelowVec,'--','b',2);


load 'C:\Documents and Settings\zyekutie\My Documents\Academy\III\Data\WTKOdata\KO2s\KO2allS.mat'
PreMax=max(max(PrePSVvecS2_8),max(PostPSVvecS2_8));
DC=mean(PrePSVvecS2_8);
PrePlot=(PrePSVvecS2_8-DC)/PreMax+0.5;
PostPlot=(PostPSVvecS2_8-DC)/PreMax+0.5;
[PreDCAboveVec,PreDCVec,PreDCBelowVec]=ZGeneratePreDCstd(PrePlot,1);
[b,a,PostLinFitAbove,LinFit,PostLinFitBelow]=ZCalcLinearFit(PostPlot,1);
subplot (2,3,5)
set(gca,'Position',rect5)
ZplotPrePostVsT(PrePlot,PostPlot,0.25,0,1,'AutoMinX','AutoMaxX','KO1 PSV vs. t','PSV');
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostLinFitAbove,'--','r',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostLinFitBelow,'--','r',2);
ZPlotStdLines (PreDCVec,'-.','k',2,LinFit,'-.','k',2);
%extending the pre lines to the post
PostDCAboveVec=ones(1,length(LinFit))*PreDCAboveVec(1);
PostDCBelowVec=ones(1,length(LinFit))*PreDCBelowVec(1);
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostDCAboveVec,'--','b',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostDCBelowVec,'--','b',2);


load 'C:\Documents and Settings\zyekutie\My Documents\Academy\III\Data\WTKOdata\KO3s\KO3allS.mat'
PreMean=Mean(Mean(Mean(RcolomnPreS)));
PostMean=Mean(Mean(Mean(RcolomnPostS)));
PreMax=max(max(PrePSVvecS2_8),max(PostPSVvecS2_8));
DC=mean(PrePSVvecS2_8);
PrePlot=(PrePSVvecS2_8-DC)/PreMax+0.5;
PostPlot=(PostPSVvecS2_8-DC)/PreMax+0.5;
[PreDCAboveVec,PreDCVec,PreDCBelowVec]=ZGeneratePreDCstd(PrePlot,1);
[b,a,PostLinFitAbove,LinFit,PostLinFitBelow]=ZCalcLinearFit(PostPlot,1);
subplot (2,3,4)
set(gca,'Position',rect4)
ZplotPrePostVsT(PrePlot,PostPlot,0.25,0,1,'AutoMinX','AutoMaxX','KO2 PSV vs. t');
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostLinFitAbove,'--','r',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostLinFitBelow,'--','r',2);
ZPlotStdLines (PreDCVec,'-.','k',2,LinFit,'-.','k',2);
%extending the pre lines to the post
PostDCAboveVec=ones(1,length(LinFit))*PreDCAboveVec(1);
PostDCBelowVec=ones(1,length(LinFit))*PreDCBelowVec(1);
ZPlotStdLines (PreDCAboveVec,'--','b',2,PostDCAboveVec,'--','b',2);
ZPlotStdLines (PreDCBelowVec,'--','b',2,PostDCBelowVec,'--','b',2);


