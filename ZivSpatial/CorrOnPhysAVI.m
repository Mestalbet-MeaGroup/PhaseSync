function [aviobj1] = CorrOnPhysAVI(CorrTimeMat,PhysMat,threshold,name)
n = size(CorrTimeMat,3);
aviobj1 = avifile('3.avi','fps',5,'quality',100,'compression','Indeo5');
% aviobj1 = avifile('3.avi','fps',5,'compression','None');
for i=1:n
    CorrOnPhys1(PhysMat, CorrTimeMat(:,:,i), threshold,strcat(name,', step number: ',num2str(i-0))) ;
    aviobj1 = addframe(aviobj1,gca);
    close;
end
aviobj1 = close(aviobj1);

% aviobj = avifile('<file name.avi>','fps',5,'quality',100,'compression','Indeo5');
% 
%  
% 
% LOOP
% 
%  h=figure;
% 
%  f = getframe(h);
% 
%  aviobj = addframe(aviobj,f);
% 
%  close all;
% 
% END LOOP

