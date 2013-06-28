clc; clear all;
load D:\Freshhh\ZivPSresults\Third\KO1\KO1PSall.mat

%%% Generate Regular Rcolomn data
[PreMEANvecS, PreSTDvecS]=ZgenerateRcolMeanStd(RcolomnPreS);
[PostMEANvecS, PostSTDvecS]=ZgenerateRcolMeanStd(RcolomnPostS);
PrePSVvecS1=ZgenerateRcolPSV1(RcolomnPreS);
PostPSVvecS1=ZgenerateRcolPSV1(RcolomnPostS);
PrePSVvecS2=ZgenerateRcolPSV2(RcolomnPreS,PreMEANvecS);
PostPSVvecS2=ZgenerateRcolPSV2(RcolomnPostS,PostMEANvecS);
%%% Plot Regular Rcolomn
ZplotPrePostVsT(PreMEANvecS,PostMEANvecS,0.25,'AutoMinY','AutoMaxY','AutoMinX','AutoMaxX','Regular MEAN PS vs. t','MEAN');
ZplotPrePostVsT(PreSTDvecS,PostSTDvecS,0.25,'AutoMinY','AutoMaxY','AutoMinX','AutoMaxX','Regular STD PS vs. t','STD');
ZplotPrePostVsT(PrePSVvecS1,PostPSVvecS1,0.25,'AutoMinY','AutoMaxY','AutoMinX','AutoMaxX','Regular PSV1 PS vs. t','PSV');
ZplotPrePostVsT(PrePSVvecS2,PostPSVvecS2,0.25,'AutoMinY','AutoMaxY','AutoMinX','AutoMaxX','Regular PSV2 PS vs. t','PSV');

PrePSVvecSmooth=ZSmoothVec(PrePSVvecS,2);
PostPSVvecSmooth=ZSmoothVec(PostPSVvecS,2);
ZplotPrePostVsT(PrePSVvecSmooth,PostPSVvecSmooth,0.5,'AutoMinY','AutoMaxY','AutoMinX','AutoMaxX','Regular PSV2 PS vs. t','PSV');

%%% Generate Normalized Rcolomn 
RcolomnPreSN=ZRcolomnNormalize(RcolomnPreS);
RcolomnPostSN=ZRcolomnNormalize(RcolomnPostS);
%%% Generate Normalized Rcolomn data
% [PreMEANvecSN, PreSTDvecSN]=ZgenerateRcolMeanStd(RcolomnPreSN);
% [PostMEANvecSN, PostSTDvecSN]=ZgenerateRcolMeanStd(RcolomnPostSN);
% PrePSVvecSN1=ZgenerateRcolPSV1(RcolomnPreSN);
% PostPSVvecSN1=ZgenerateRcolPSV1(RcolomnPostSN);
% PrePSVvecSN2=ZgenerateRcolPSV2(RcolomnPreSN,PreMEANvecSN);
% PostPSVvecSN2=ZgenerateRcolPSV2(RcolomnPostSN,PostMEANvecSN);
% %%% Plot Normalized Rcolomn
% %ZplotPrePostVsT(PreMEANvecSN,PostMEANvecSN,0.25,'AutoMinY','AutoMaxY','AutoMinX','AutoMaxX','Normal MEAN PS vs. t','MEAN');
% %ZplotPrePostVsT(PreSTDvecSN,PostSTDvecSN,0.25,'AutoMinY','AutoMaxY','AutoMinX','AutoMaxX','Normal STD PS vs. t','STD');
% ZplotPrePostVsT(PrePSVvecSN1,PostPSVvecSN1,0.25,'AutoMinY','AutoMaxY','AutoMinX','AutoMaxX','Normal PSV1 PS vs. t','PSV');
% ZplotPrePostVsT(PrePSVvecSN2,PostPSVvecSN2,0.25,'AutoMinY','AutoMaxY','AutoMinX','AutoMaxX','Normal PSV2 PS vs. t','PSV');