% Script for unifying  all sort_channel

% path=input ('inter path for parent directory \n', 's')

clear all; home;

cd 'D:\MC_Rack Data\PostNCSsecondShot\WT_Post_0043_0054'
load sort_channel.mat
t1=t;
indexchannel1=indexchannel;

cd 'D:\MC_Rack Data\PostNCSsecondShot\WT_Post_0055_0063'
load sort_channel.mat
t2=t;
indexchannel2=indexchannel;

cd 'D:\MC_Rack Data\PostNCSsecondShot\WT_Post_0064_0067'
load sort_channel.mat
t3=t;
indexchannel3=indexchannel;

% cd 'D:\MC_Rack Data\PostNCSsecondShot\WT_Post_0068_0072'
% load sort_channel.mat
% t4=t;
% indexchannel4=indexchannel;

% cd 'D:\MC_Rack Data\PostNCSsecondShot\WT_Post_0068_0072'
% load sort_channel.mat
% t5=t;
% indexchannel5=indexchannel;
% 
% cd 'D:\MC_Rack Data\PostNCSsecondShot\WT_Post_0068_0072'
% load sort_channel.mat
% t6=t;
% indexchannel6=indexchannel;
% 
% cd 'D:\MC_Rack Data\PostNCSsecondShot\WT_Post_0068_0072'
% load sort_channel.mat
% t7=t;
% indexchannel7=indexchannel;
% 
% cd 'D:\MC_Rack Data\PostNCSsecondShot\WT_Post_0068_0072'
% load sort_channel.mat
% t8=t;
% indexchannel8=indexchannel;

 [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(t1,indexchannel1,t2,indexchannel2);
 [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t3,indexchannel3);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t4,indexchannel4);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t5,indexchannel5);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t7,indexchannel7);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t8,indexchannel8);
postNCSt=newT;
postNCSic= newIndexchannel;
save('WT3postNCS', 'postNCSt','postNCSic');
% clear all; home;
load ('WT3postNCS')
PlotRaster(postNCSt,postNCSic);
 
% %Post NCS data
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all; home;
% 
% load D:\14DIV_1DKOM_2n_KO\0011\sort_channel.mat
% t11=t;
% indexchannel11=indexchannel;
% 
% load D:\14DIV_1DKOM_2n_KO\0012\sort_channel.mat
% t12=t;
% indexchannel12=indexchannel;
% 
% load D:\14DIV_1DKOM_2n_KO\0013\sort_channel.mat
% t13=t;
% indexchannel13=indexchannel;
% 
% load D:\14DIV_1DKOM_2n_KO\0014\sort_channel.mat
% t14=t;
% indexchannel14=indexchannel;
% 
% load D:\14DIV_1DKOM_2n_KO\0015\sort_channel.mat
% t15=t;
% indexchannel15=indexchannel;
% 
% load D:\14DIV_1DKOM_2n_KO\0016\sort_channel.mat
% t16=t;
% indexchannel16=indexchannel;
% 
% load D:\14DIV_1DKOM_2n_KO\0017\sort_channel.mat
% t17=t;
% indexchannel17=indexchannel;
% 
% load D:\14DIV_1DKOM_2n_KO\0018\sort_channel.mat
% t18=t;
% indexchannel18=indexchannel;
% 
% load D:\14DIV_1DKOM_2n_KO\0019\sort_channel.mat
% t19=t;
% indexchannel19=indexchannel;
% 
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(t11,indexchannel11,t12,indexchannel12);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t13,indexchannel13);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t14,indexchannel14);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t15,indexchannel15);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t16,indexchannel16);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t17,indexchannel17);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t18,indexchannel18);
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,t19,indexchannel19);
% postNCSt=newT;
% postNCSic= newIndexchannel;
% save('postNCS', 'postNCSt','postNCSic');
% clear all; home;
% load ('postNCS')
% PlotRaster(postNCSt,postNCSic)
% 
% %removing noisy channels
% % [postNCSt,postNCSic]=RemoveNeuronsWithoutPrompt(postNCSt,postNCSic,[57;1]);
% % save('KOpostNCSreduced', 'postNCSt','postNCSic');
% % PlotRaster(postNCSt,postNCSic)
% 
% 
% % NCS data
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clear all; home;
% 
% load D:\14DIV_1DKOM_2n_KO\0009NCS\sort_channel.mat
% t1=t;
% indexchannel1=indexchannel;
% 
% load D:\14DIV_1DKOM_2n_KO\0010light\sort_channel.mat
% t2=t;
% indexchannel2=indexchannel;
% 
%  [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(t1,indexchannel1,t2,indexchannel2);
% 
% NCSt=newT;
% NCSic= newIndexchannel;
% save('2ndKO_NCS', 'NCSt','NCSic');
% clear all; home;
% load ('NCS')
% % PlotRaster(NCSt,NCSic);
% 
% %removing noisy channels
% [NCSt,NCSic]=RemoveNeuronsWithoutPrompt(NCSt,NCSic,[22;1],[57;2]);
% save('2ndKO_NCSreduced', 'NCSt','NCSic');
% PlotRaster(NCSt,NCSic)




