function MakeS7RS(PhysMat2, PSmatrix, framestart,VElec, Threshold,thr, title);
%Example: MakeF1RS(PhysMat2, PSmatrix, 30,VElec, 0.2, 'WT Pre NCS Frame 1');
%% RS Plot for Figure S7
h = CorrOnPhys7_Noah(PhysMat2 , PSmatrix(:,:,framestart), VElec, Threshold , thr, 3,0, title);
saveas(h,'c:\testing\S7_RS1.tif');
h = CorrOnPhys7_Noah(PhysMat2 , PSmatrix(:,:,framestart+1), VElec, Threshold , thr, 3,0, title);
saveas(h,'c:\testing\S7_RS2.tif');
h = CorrOnPhys7_Noah(PhysMat2 , PSmatrix(:,:,framestart+2), VElec, Threshold , thr, 3,0, title);
saveas(h,'c:\testing\S7_RS3.tif');
