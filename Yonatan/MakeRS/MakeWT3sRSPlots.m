%Make WT3s RS Data
filetype = 'jpg';
th = 0.25;
load('D:\ZiV_data\WT3s\WT3sRSDATA.mat');
Npre = 2;%size(RSWT3sPSPre,3) ;
Npost = 2;%size(RSWT3sPSPost,3);

for i = 1 :Npre
 
        h = CorrOnPhys7(PhysMat2 , RSWT3sPSPre(:,:,i), VElec1,th , 3,0, strcat('WT3 pre',num2str(i)));
        saveas(h,strcat('D:\ZiV_data\WT3s\Plots\WT3sPreFrame',num2str(i)),filetype);
 end

for i = 1:Npost
    h = CorrOnPhys7(PhysMat2 , RSWT3sPSPost(:,:,i), VElec1, th , 3,0, strcat('WT3 post',num2str(i)));
   saveas(h,strcat('D:\ZiV_data\WT3s\Plots\WT3sPostFrame',num2str(i)),filetype);
end

close;
clear;