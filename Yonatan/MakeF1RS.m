function MakeF1RS(PhysMat2, PSmatrix, VElec, Threshold,thr, title);
%Example: MakeF1RS(PhysMat2, PSmatrix, VElec, 0.2, 'WT Pre NCS Frame 1');
%% RS Plot for Figure 1
h = CorrOnPhys7_Noah(PhysMat2 , PSmatrix, VElec, Threshold , thr, 3,0, title);
% saveas(h,'c:\testing\F1_RS.tif');