%Make WT3s RS Data
load('D:\ZiV_data\WT3s\WT3allS.mat');
diago = RcolomnPreS (1,1,1);
dou = find(diff(VelecPreS(1,:))==0);
RSWT3sPSPre =RcolomnPreS ;
RSWT3sPSPost =RcolomnPostS ;
WT3sPSPre = RSWT3sPSPre;
WT3sPSPost = RSWT3sPSPost; 
Velec = VelecPreS(1,:);
%merging of two channels on one electrode - Pre
for i = 1:size(RSWT3sPSPre,3)
    RSWT3sPSPre(dou,:,i) = ( RSWT3sPSPre(dou,:,i)+RSWT3sPSPre(dou+1,:,i) )/2;
    RSWT3sPSPre(:,dou,i) =  (RSWT3sPSPre(:,dou,i)+RSWT3sPSPre(:,dou+1,i))/2;
end
RSWT3sPSPre(dou+1,:,:) =  [];
RSWT3sPSPre(:,dou+1,:) =  [];
for i = 1:size(RSWT3sPSPre,2)
        RSWT3sPSPre(i,i,:) =1; 
end
%merging of two channels on one electrode - Post
for i = 1:size(RSWT3sPSPost,3)
    RSWT3sPSPost(dou,:,i) = ( RSWT3sPSPost(dou,:,i)+RSWT3sPSPost(dou+1,:,i) )/2;
    RSWT3sPSPost(:,dou,i) =  (RSWT3sPSPost(:,dou,i)+RSWT3sPSPost(:,dou+1,i))/2;
end
RSWT3sPSPost(dou+1,:,:) =  [];
RSWT3sPSPost(:,dou+1,:) =  [];
for i = 1:size(RSWT3sPSPost,2)
        RSWT3sPSPost(i,i,:) =1; 
end
Velec(dou) = []; 
VElec1=1:length(Velec) ;

%fit numbers on MEA electordes 
load('D:\Yonatan\MATLAB\NetwrokAnalysis\MEAmap200_10x6.mat');
PhysMat1 = MEAmap200_10x6(10:-1:1,6:-1:1) ;%reversed order so it fits with dendrogram reordering
PhysMat2 = 1000*ones(size(PhysMat1)) ;
for i = 1:length(Velec)
    PhysMat2(find(PhysMat1==Velec(i))) = i;
end
%RSWT3sPSPre - merged channel for RS
%WT3sPSPre - un merged channelnot for RS
save('D:\ZiV_data\WT3s\WT3sRSDATA.mat', 'PhysMat2','VElec1','RSWT3sPSPre', 'RSWT3sPSPost','WT3sPSPre','WT3sPSPost');

clear;