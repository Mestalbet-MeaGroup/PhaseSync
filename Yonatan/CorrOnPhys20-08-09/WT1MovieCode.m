%Creating a MATLAB movie

for i=1:size(WT1RcolomnPre,3)
    M(i) = getframe(CorrOnPhys3(WT1FixPhysMatPre ,WT1RcolomnPre(:,:,i) , WT1FixVElecPre , 0.1, 3, 0.2,strcat('WT1-Pre step number: ', num2str(i))));
    close;
end
for i=1:size(WT1RcolomnPost,3)
    M(i+size(WT1RcolomnPre,3)) = getframe(CorrOnPhys3(WT1FixPhysMatPost ,WT1RcolomnPost(:,:,i) , WT1FixVElecPost , 0.1, 3, 0.2,strcat('WT1-Post step number: ', num2str(i))));
    close;
end


[h, w, p] = size(M(1).cdata);
hf = figure; 
set(hf, 'position', [150 150 w h]);



movie(hf,M,1,1.5,[0 0 0 0]);
