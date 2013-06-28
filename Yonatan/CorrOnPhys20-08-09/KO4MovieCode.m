%Creating a MATLAB movie

for i=1:size(KO4RcolomnPre,3)
    M(i) = getframe(CorrOnPhys3(KO4FixPhysMatPre ,KO4RcolomnPre(:,:,i) , KO4FixVElecPre , 0.1, 3, 0.2,strcat('KO4-Pre step number: ', num2str(i))));
    close;
end
for i=1:size(KO4RcolomnPost,3)
    M(i+size(KO4RcolomnPre,3)) = getframe(CorrOnPhys3(KO4FixPhysMatPost ,KO4RcolomnPost(:,:,i) , KO4FixVElecPost , 0.1, 3, 0.2,strcat('KO4-Post step number: ', num2str(i))));
    close;
end


[h, w, p] = size(M(1).cdata);
hf = figure; 
set(hf, 'position', [150 150 w h]);



movie(hf,M,1,1.5,[0 0 0 0]);
