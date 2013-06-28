% this function recieves two matrices and generates a video stream of both concatunated. 
% typically M1 will be Rcoolomn Pre, and M2 is Rcolomn Post
% e.g.  [aviobj1] = ZimagescAviPrePost(Cr1,Cr2,WT4mov, 'WT4')
%##########################################################################
%Rev1- 200709
%Rev2 - 090809 added two Rcolomn2, now can be used for plotimg Pre and Post order
%Rev3 -300809 added return maxC - maximum value to be used for plot so won't look so pale..
%##########################################################################

function [aviobj1] = ZimagescAviPrePost(M1,M2,maxC,name, varargin)
close all;
n1 = size(M1,3);
n2 = size(M2,3);

aviobj1 = avifile(strcat(name,'.avi'),'fps',1,'compression','None');
%aviobj1.quality = 100;
for i=1:n1
    imagesc(M1(:,:,i)) ;
    caxis([0 maxC]);
    title([varargin{1},' Pre step number: ',num2str(i-0)]) ;
    aviobj1 = addframe(aviobj1,gca);
end
for i=1:n2
    imagesc(M2(:,:,i)) ;
    caxis([0 maxC]);
    title([varargin{1},' Post step number: ',num2str(i-0)]) ;
    aviobj1 = addframe(aviobj1,gca);
end
close all;
aviobj1 = close(aviobj1);

