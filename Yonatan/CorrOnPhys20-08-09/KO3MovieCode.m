%Creating a MATLAB movie

for i=1:size(KO3RcolomnPre,3)
    M(i) = getframe(CorrOnPhys3(PhysMat ,KO3RcolomnPre(:,:,i) , KO3VElecPre , 0.1, 3, 0.2,strcat('KO3-Pre step number: ', num2str(i))));
    close;
end
for i=1:size(KO3RcolomnPost,3)
    M(i+size(KO3RcolomnPre,3)) = getframe(CorrOnPhys3(PhysMat ,KO3RcolomnPost(:,:,i) , KO3VElecPost , 0.1, 3, 0.2,strcat('KO2-Post step number: ', num2str(i))));
    close;
end


[h, w, p] = size(M(1).cdata);
hf = figure; 
set(hf, 'position', [150 150 w h]);



movie(hf,M,1,1.5,[0 0 0 0]);
