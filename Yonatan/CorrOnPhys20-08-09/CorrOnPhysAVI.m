function [aviobj] = CorrOnPhysAVI(PhysPre, PhysPost,CorrPre,CorrPost, VElecPre, VElecPost, threshold,name)

aviobj = avifile(strcat(name,'.avi'),'fps',1.5,'compression','None');
for i=1:size(CorrPre,3)
   aviobj = addframe(aviobj,getframe(CorrOnPhys3(PhysPre ,CorrPre(:,:,i) , VElecPre ,threshold , 3, 0.2,strcat(name,'- Pre Step Number:', num2str(i)))));
    close;
end
for i=1:size(CorrPost,3)
   aviobj = addframe(aviobj,getframe(CorrOnPhys3(PhysPost ,CorrPost(:,:,i) , VElecPost , threshold, 3, 0.2,strcat(name,'- Post Step Number:', num2str(i)))));
    close;
end

aviobj = close(aviobj);


% 
% 
% 
% close all;
% n = size(CorrTimeMat,3);
% aviobj = avifile('1.avi','fps',2,'compression','None');
% for i=1:n
%     CorrOnPhys3(PhysMat, CorrTimeMat(:,:,i), VElec, threshold, 3, 0.2, strcat(name,', step number: ',num2str(i))) ;
%     aviobj = addframe(aviobj,gca);
%     close;
% end
% aviobj = close(aviobj);

