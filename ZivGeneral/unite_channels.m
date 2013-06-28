% load ('D:\14DIV_Sorted_050409preNCS\0001\sort_channel01.mat');
% indexchannelA=indexchannel;
% tA=t;
% 
% load ('D:\14DIV_Sorted_050409preNCS\0003\sort_channel03.mat');
% indexchannelB=indexchannel;
% tB=t;
% 
% [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(tA,indexchannelA,tB,indexchannelB);
% 
% % load ('D:\14DIV_Sorted_050409preNCS\0003\sort_channel03.mat');
% % indexchannelB=indexchannel;
% % tB=t;
% % [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);
% 
% load ('D:\14DIV_Sorted_050409preNCS\0004\sort_channel04.mat');
% indexchannelB=indexchannel;
% tB=t;
% [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);
% 
% load ('D:\14DIV_Sorted_050409preNCS\0005\sort_channel05.mat');
% indexchannelB=indexchannel;
% tB=t;
% [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);
% 
% load ('D:\14DIV_Sorted_050409preNCS\0006\sort_channel06.mat');
% indexchannelB=indexchannel;
% tB=t;
% [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);

% load ('D:\14DIV_Sorted_050409preNCS\0007\sort_channel07.mat');
% indexchannelA=indexchannel;
% tA=t;
% 
% load ('D:\14DIV_Sorted_050409preNCS\0008\sort_channel08.mat');
% indexchannelB=indexchannel;
% tB=t;
% 
% [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(tA,indexchannelA, tB,indexchannelB);
% 
% load ('D:\14DIV_Sorted_050409preNCS\0009\sort_channel09.mat');
% indexchannelB=indexchannel;
% tB=t;
% [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);
% 
% load ('D:\14DIV_Sorted_050409preNCS\0010\sort_channel10.mat');
% indexchannelB=indexchannel;
% tB=t;
% [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);
% 
% load ('D:\14DIV_Sorted_050409preNCS\0011\sort_channel11.mat');
% indexchannelB=indexchannel;
% tB=t;
% [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);
% 
% load ('D:\14DIV_Sorted_050409preNCS\0012\sort_channel12.mat');
% indexchannelB=indexchannel;
% tB=t;
% [newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);


% save ('D:\14DIV_Sorted_050409preNCS\AllPreNCS.mat', 'newT','newIndexchannel');


%%%%%%%Post NCS

load ('D:\16DIV_Sorted_070409postNCS\0014\sort_channel14.mat');
indexchannelA=indexchannel;
tA=t;

load ('D:\16DIV_Sorted_070409postNCS\0015\sort_channel15.mat');
indexchannelB=indexchannel;
tB=t;

[newT,newIndexchannel]=InsertSortChannelOneAfterAnother(tA,indexchannelA,tB,indexchannelB);

load ('D:\16DIV_Sorted_070409postNCS\0016\sort_channel16.mat');
indexchannelB=indexchannel;
tB=t;
[newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);

load ('D:\16DIV_Sorted_070409postNCS\0017\sort_channel17.mat');
indexchannelB=indexchannel;
tB=t;
[newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);

load ('D:\16DIV_Sorted_070409postNCS\0018\sort_channel18.mat');
indexchannelB=indexchannel;
tB=t;
[newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);

load ('D:\16DIV_Sorted_070409postNCS\0019\sort_channel19.mat');
indexchannelB=indexchannel;
tB=t;
[newT,newIndexchannel]=InsertSortChannelOneAfterAnother(newT,newIndexchannel,tB,indexchannelB);

save ('D:\16DIV_Sorted_070409postNCS\AllPostNCS.mat', 'newT','newIndexchannel');