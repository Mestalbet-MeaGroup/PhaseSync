%Creating a MATLAB movie

for i=1:size(KO2RcolomnPre,3)
    M(i) = getframe(CorrOnPhys3(KO2FixPhysMatPre ,KO2RcolomnPre(:,:,i) , KO2FixVElecPre , 0.1, 3, 0.2,strcat('KO2-Pre step number: ', num2str(i))));
    close;
end
for i=1:size(KO2RcolomnPost,3)
    M(i+size(KO2RcolomnPre,3)) = getframe(CorrOnPhys3(KO2FixPhysMatPost ,KO2RcolomnPost(:,:,i) , KO2FixVElecPost , 0.1, 3, 0.2,strcat('KO2-Post step number: ', num2str(i))));
    close;
end


[h, w, p] = size(M(1).cdata);
hf = figure; 
set(hf, 'position', [150 150 w h]);



movie(hf,M,1,1.5,[0 0 0 0]);
