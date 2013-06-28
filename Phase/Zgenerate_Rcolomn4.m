% This function generates R colomn along the time, with num R matrices. the
% delta between each is caluculated automaticlly
% the function prints the number of current run out of the total number
% RunsLimit is a number that you can put in order not to run on all the
% data, e.g. just to see how the firstPSs  look like. if RunLimit is bigger
% then the number that is required for all the data, the function will
% print the actual number of required runs.
%HourDelta is the how much we want to shift by each step for generating
%each PS. Typically for ~24h sessions we set 0.5
% HourWindow is how long we want each PS window to be
% e.g. [Rcolomn,Velec,Tmax]=Zgenerate_Rcolomn3 (t,ic,100,0.5,0.5)
%##########################################################################
%Rev1- 200709
%Rev2 - 120809 return Velec
%Rev3 - 160809 save variables
%Rev4 - 010110 - added Tmax
% Rev5 -290310 - added HourWindow
%##########################################################################

function [Rcolomn,Velec,Tmax]=Zgenerate_Rcolomn4 (t,ic,RunsLimit,HourDelta,HourWindow,varargin)
% matlabpool open 8
%delta=50000; 
%delta=floor(max(t)/num);
% setpref('Internet','E_mail','ziv.yekutieli@hotmail.com');
% setpref('Internet','SMTP_Server','mail');
% sendmail('ziv.yekutieli@hotmail.com','Rcolomn script started');
% tic;
Tstep=HourWindow*36000;
Fs=12000;
%Tstep=2000;
newT=t./1200; %unit is 100ms
delta=HourDelta*36000;
Tmax=max(t)/(Fs*3600);
RunsNeeded = floor(Tmax/HourDelta);
if (RunsNeeded < RunsLimit)
    num=RunsNeeded;
else
    num = RunsLimit;
end
parfor i=1:num
%     fprintf(['Calculating PS #',num2str(i),' out of maximum of ',num2str(num), ' matrices...\n'])
    Rcolomn(:,:,i)=Zphase_synchronization(newT,ic,min(newT)+(i-1)*delta,Tstep);
    b=find(Rcolomn(:,:,i)~=1 & Rcolomn(:,:,i)~=0); 
   if isempty(b); 
       error('There is a window with no activity')
   end
%    if i==1
%         t=toc;
%          fprintf(['first PS itteration last ',num2str(t/3600),'  hours \n'])
%          fprintf(['total run will take approximatly ',num2str(t/3600*num*1.2),'  hours \n'])
%          sendmail('ziv.yekutieli@hotmail.com','Rcolomn ETA',['total run will take approximatly ',num2str(t/3600*num*1.2),'  hours ']);
%     end
end
% Rcolomn=Rcolomn(:,:,1:i-1); %last matrix is empty so we remove it. 
Velec=ic(1:2,:);
%save ([varargin{1},varargin{2}],'Rcolomn','Velec')
% t=toc;
% matlabpool close;
fprintf(['\n \n ###### Total run lasted ',num2str(t/3600),'  hours ######\n'])
fprintf('Done \n');