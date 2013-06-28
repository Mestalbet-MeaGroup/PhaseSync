% 290310 For Eshel different time comparison - One WT and one KO

%%KO2 4 hours delta
load E:\TransgenicExperiments\KO2(formerly3)\TIC\KO2_pre
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\KO2RcolomnPre4h','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\KO2(formerly3)\TIC\KO2_post
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\KO2RcolomnPost4h','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n KO2Rcolomn Pre Post is saved. \n');

%%WT3 4 hours delta
load E:\TransgenicExperiments\WT3(formerly5)\TIC\WT3_pre
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\WT3RcolomnPre4h','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\WT3(formerly5)\TIC\WT3_post
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\WT3RcolomnPost4h','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n WT3Rcolomn Pre Post is saved. \n');
#####
%%KO1 4 hours delta
load E:\TransgenicExperiments\KO1(formerly2)\TIC\Cropped\KO1_preCropped
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\KO1RcolomnPre4h','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\KO1(formerly2)\TIC\Cropped\KO1_postCropped
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\KO1RcolomnPost4h','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n KO1Rcolomn Pre Post is saved. \n');

%%WT1 4 hours delta
load E:\TransgenicExperiments\WT1(formerly2)\TIC\Cropped\WT1_pre_MINcropped
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\WT1RcolomnPre4h','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\WT1(formerly2)\TIC\Cropped\WT1_post_MINcropped
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\WT1RcolomnPost4h','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n WT1Rcolomn Pre Post is saved. \n');
####
%%KO3 4 hours delta
load E:\TransgenicExperiments\KO3(formerly4)\TIC\KO3_pre
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\KO3RcolomnPre4h','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\KO3(formerly4)\TIC\KO3_post
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\KO3RcolomnPost4h','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n KO3Rcolomn Pre Post is saved. \n');

%%WT2 4 hours delta
load E:\TransgenicExperiments\WT2(formerly3)\TIC\WT2_pre_MIN
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\WT2RcolomnPre4h','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\WT2(formerly3)\TIC\WT2_post_MIN
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn4 (t,ic,20,4,4);
save('D:\ZiV_data\ForEshelDifferentTime\WT2RcolomnPost4h','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n WT2Rcolomn Pre Post is saved. \n');

%###########################
%%KO1 smooth
load E:\TransgenicExperiments\KO1(formerly2)\TIC\Cropped\KO1_preCropped
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\KO1s\KO1RcolomnPre18S','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\KO1(formerly2)\TIC\Cropped\KO1_postCropped
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\KO1s\KO1RcolomnPost18S','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n KO1Rcolomn Pre Post is saved. \n');

%%KO2 smooth
load E:\TransgenicExperiments\KO2(formerly3)\TIC\KO2_pre
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn3 (t,ic,400,1/4);
save('D:\ZiV_data\KO2s2\KO2RcolomnPre18S','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\KO2(formerly3)\TIC\KO2_post
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\KO2s2\KO2RcolomnPost18S','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n KO2Rcolomn Pre Post is saved. \n');

%%KO3 smooth
load E:\TransgenicExperiments\KO3(formerly4)\TIC\KO3_pre
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\KO3s2\KO3RcolomnPre18S','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\KO3(formerly4)\TIC\KO3_post
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\KO3s2\KO3RcolomnPost18S','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n KO3Rcolomn Pre Post is saved. \n');

%%WT1 smooth
load E:\TransgenicExperiments\WT1(formerly2)\TIC\Cropped\WT1_pre_MINcropped
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\WT1s\WT1RcolomnPre18S','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\WT1(formerly2)\TIC\Cropped\WT1_post_MINcropped
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\WT1s\WT1RcolomnPost18S','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n WT1Rcolomn Pre Post is saved. \n');

%%WT2 smooth
load E:\TransgenicExperiments\WT2(formerly3)\TIC\WT2_pre_MIN
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\WT3s\WT3RcolomnPre18S','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\WT2(formerly3)\TIC\WT2_post_MIN
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\WT2s\WT2RcolomnPost18S','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n WT2Rcolomn Pre Post is saved. \n');


%%WT3 smooth
load E:\TransgenicExperiments\WT3(formerly5)\TIC\WT3_pre
[RcolomnPreS,VelecPreS,Tpre]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\WT3s\WT3RcolomnPre18S','RcolomnPreS','VelecPreS','Tpre');
load E:\TransgenicExperiments\WT3(formerly5)\TIC\WT3_post
[RcolomnPostS,VelecPostS,Tpost]=Zgenerate_Rcolomn3 (t,ic,200,1/4);
save('D:\ZiV_data\WT3s\WT3RcolomnPost18S','RcolomnPostS','VelecPostS','Tpost');
fprintf ('\n WT3Rcolomn Pre Post is saved. \n');


%Prepair all Rcolomns

% load D:\Freshhh\1DWTM\WT1_17DIV\WT1_all.mat
% [RcolomnPre,VelecPre]=Zgenerate_Rcolomn (t_pre_0001,indexchannel_pre_0001,50,25000);
% [RcolomnPost,VelecPost]=Zgenerate_Rcolomn (t_post_0004,indexchannel_post_0004,50,25000);
% save('D:\Freshhh\ZivPSresults\Second\WT1\WT1Rcolomn25','RcolomnPre','VelecPre','RcolomnPost','VelecPost');
% fprintf ('\n WT1 Rcolomn Pre Post is saved. \n');
% clear all;
% 
% load D:\Freshhh\1DWTM\WT2_13DIV\WT2_all.mat
% [RcolomnPre,VelecPre]=Zgenerate_Rcolomn (t_pre_0003_0011,ic_pre_0003_0011,80,25000);
% [RcolomnPost,VelecPost]=Zgenerate_Rcolomn (t_post_0015_0019,ic_post_0015_0019,80,25000);
% save('D:\Freshhh\ZivPSresults\Second\WT2\WT2Rcolomn25','RcolomnPre','VelecPre','RcolomnPost','VelecPost');
% fprintf ('\n WT2 Rcolomn Pre Post is saved. \n');
% clear all;

load D:\Freshhh\1DWTM\WT4\WT4_all.mat
[RcolomnPre,VelecPre]=Zgenerate_Rcolomn (t_pre_0001_0008,ic_pre_0001_0008,80,25000);
[RcolomnPost,VelecPost]=Zgenerate_Rcolomn (t_post_0011_0013,ic_post_0011_0013,80,25000);
save('D:\Freshhh\ZivPSresults\Second\WT4\WT4Rcolomn25','RcolomnPre','VelecPre','RcolomnPost','VelecPost');
fprintf ('\n WT4 Rcolomn Pre Post is saved. \n');
clear all;

%%%% KOs
load D:\Freshhh\1DKOM\Clean_KOs\KO2_all
[RcolomnPre,VelecPre]=Zgenerate_Rcolomn (t_pre_0001,ic_pre_0001,80,25000);
[RcolomnPost,VelecPost]=Zgenerate_Rcolomn (t_post_0003,ic_post_0003,80,25000);
save('D:\Freshhh\ZivPSresults\Second\KO2\KO2Rcolomn25','RcolomnPre','VelecPre','RcolomnPost','VelecPost');
fprintf ('\n KO2 Rcolomn Pre Post is saved. \n');
clear all;

load D:\Freshhh\1DKOM\Clean_KOs\KO3_all
[RcolomnPre,VelecPre]=Zgenerate_Rcolomn (t_pre_0001_0008,ic_pre_0001_0008,80,25000);
[RcolomnPost,VelecPost]=Zgenerate_Rcolomn (t_post_0011_0019,ic_post_0011_0019,80,25000);
save('D:\Freshhh\ZivPSresults\Second\KO3\KO3Rcolomn25','RcolomnPre','VelecPre','RcolomnPost','VelecPost');
fprintf ('\n KO3 Rcolomn Pre Post is saved. \n');
clear all;

load D:\Freshhh\1DKOM\Clean_KOs\KO4_all
[RcolomnPre,VelecPre]=Zgenerate_Rcolomn (t_pre_0001_0013,ic_pre_0001_0013,15,15000);
[RcolomnPost,VelecPost]=Zgenerate_Rcolomn (t_post_0016_0034,ic_post_0016_0034,150,15000);
save('D:\Freshhh\ZivPSresults\Second\KO4\KO4Rcolomn15','RcolomnPre','VelecPre','RcolomnPost','VelecPost');
fprintf ('\n KO4 Rcolomn Pre Post is saved. \n');
clear all;

%%% last Big WT3
load D:\Freshhh\1DWTM\WT3_13DIV\WT3_Pre_MIN_no83.mat
 [RcolomnPre,VelecPre]=Zgenerate_Rcolomn (t,ic,120,25000);
load D:\Freshhh\1DWTM\WT3_13DIV\WT3_Post_MIN.mat
 [RcolomnPost,VelecPost]=Zgenerate_Rcolomn (t_post,ic_post,120,25000);
save('D:\Freshhh\ZivPSresults\Second\WT3\WT3Rcolomn25','RcolomnPre','VelecPre','RcolomnPost','VelecPost');
fprintf ('\n WT3 Rcolomn Pre Post is saved. \n');
