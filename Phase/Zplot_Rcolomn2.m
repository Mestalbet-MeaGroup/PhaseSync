% This function generates phase sync diagrams 
% ref is the value the matrix that we want to use as a reffernce, all the
% other matrices will be generate by v(ref) (the outcome of dendrogram of
% the ref matrix)
% if ref is set to zero, each matrix is generated according to its own order.
%  R matrices, typically the reuslt of e.g
%R1=Zphase_synchronization(t_pre_0001./1200,ic_pre_0001,min(t_pre_0001)+600000,10000);
%R2=Zphase_synchronization(t_post_0003./1200,ic_post_0003,min(t_post_0003)+5000,10000);

% 'ref' is the number of matrix in Rcolomn that we want to be used as a refference
%     ref = 0, each PS is ordered independantly, electrodes are numbered according to its own order
%     ref ~= 0, each PS is ordered according to Rcolomn(ref), electrodes are numbered  according to Rcolomn(ref) order
%  if forceVplot is given (we want to force external numbering), it is used  as the number of the electrodes and will be the same for all.
% e.g Zplot_Rcolomn(RcolomnPreS,0,'') - 
%       all the matrices in Rcolomn will be plotted according to their independant
%       dendrogram, electrodes are numbered accordingly (each PS with the order of electrodes for its  dendrogram
%e.g Zplot_Rcolomn(RcolomnPreS,3,'') - 
%       all the matrices in Rcolomn will be plotted according to their dendrogarm order of matrix 3 in Rcolomn
%       and electrodes are numbered  accordingly ( order of electrodes for dendrogram 3)
% e.g Zplot_Rcolomn(RcolomnPreS,0,'') - 
%       all the matrices in Rcolomn will be plotted according to their independant
%       dendrogram, electrodes are numbered accordingly (each PS with the order of electrodes for its  dendrogram
%Zplot_Rcolomn(RcolomnPreS,3,ic(1,:))
%       all the matrices in Rcolomn will be plotted according to their dendrogarm order of matrix 3 in Rcolomn
%       and electrodes numbered  just according to the order in ic

function Zplot_Rcolomn(Rcolomn, ref,varargin)
clc; home;
% close all;

[a,b,n] = size(Rcolomn);

optargin = size(varargin,2) ;

if (optargin > 1)
    error ('^^^ too many inputs \n')
elseif (optargin == 0 )  % there is no external vector to plot by. we want to plot by internal vector
% first, generate  v(i) which is the dendrogram order for each PS in Rcolomn
% later we decide which one to order by.
    for i = 1:n
        lng=size(Rcolomn(:,:,i),1);
        y=pdist(Rcolomn(:,:,i));
        Z=linkage(y);
        [h,T,v(i,:)] = dendrogram(Z,lng);
    end
    close all;
    
    if (ref==0) %generate each sync matrix by itslef
        fprintf ('ref is set to zero, plotting each PS independantly \n')
        for i = 1:n
            T=Rcolomn(:,:,i);
            c(:,:,i)=T(v(i,:),v(i,:));
            b=find(T~=1);
            m(i)=max(T(b)); %keep the maximum value of each matrix into m
            Vplot(i,:)=v(i,:); %each Vplot is kept according to the original one of each PS matrix
        end    %generate v for each R 
    
    else  % ref is not zero, generate each matrix by the order of #ref matrix
         fprintf ('ref is set to %d, plotting each PS according to it \n', ref)
         fprintf(['vector choosen is: \n',num2str(v(ref,:)),'\n']);
         for i = 1:n
            T=Rcolomn(:,:,i);
            c(:,:,i)=T(v(ref,:),v(ref,:));
            b=find(T~=1);
            m(i)=max(T(b)); %keep the maximum value of each matrix into m
            Vplot(i,:)=v(ref,:); %all matices are according to the order of PS #ref
        end  
    end

elseif (optargin == 1 )  % we wnat to plot by external vector (force order by our vector)
    forceVplot=varargin{1}
    if (isnumeric(forceVplot)==0) 
        error('^^^ Third input should be a vector to plot the PS by ')
    end
    if (isvector(forceVplot)==0) 
        error('^^^ Third input is not a vector ')
    end
     if  (isvector(forceVplot)==1 && length(forceVplot)~=a)  % varargin is vector but not in the same length as PS
            error('^^^ Input vector length does not match PS dimentions - length should be the same')
     end
    if  (isvector(forceVplot)==1 && length(forceVplot)==a) 
         fprintf(['Ploting by electrod vector forceVplot: \n',num2str(forceVplot),'\n']);
        for i = 1:n
            T=Rcolomn(:,:,i);
            c(:,:,i)=T(forceVplot,forceVplot);
            b=find(T~=1);
            m(i)=max(T(b)); %keep the maximum value of each matrix into m
            Vplot(i,:)=forceVplot; %all matices are according to the order of PS #ref
        end
    end    
end

       
%Plot
p=1;
m1=max(m);
a1=(1:max(Vplot(1,:)));
set(0,'Units','pixels') 
scnsize = get(0,'ScreenSize');
pos1 = [30,  1/3*scnsize(4)-200 , scnsize(3)-50, scnsize(4)-200 ];
 
for i = 1:n
     if (p==1)
           figure('Position',pos1) 
    end
     subplot(2,3,p)
    imagesc(c(:,:,i));
    set(gca,'xtick',a1,'ytick',a1);
  %  set(gca,'xticklabel',v(1,:),'yticklabel',v(1,:));
  set(gca,'xticklabel',Vplot(i,:),'yticklabel',Vplot(i,:));
    set(gca,'FontSize',7);
    title(['PS',num2str(i)],'FontSize',12);
    caxis([0 m1*1.02]);
    p=mod(i,6)+1;
end





