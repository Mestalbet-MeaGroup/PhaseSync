% This function generates R colomn along the time, with num R matrices. the
% delta between each is caluculated automaticlly
% the function prints the number of current run out of the total number
% RunsLimit is a number that you can put in order not to run on all the
% data, e.g. just to see how the firstPSs  look like. if RunLimit is bigger
% then the number that is required for all the data, the function will
% print the actual number of required runs.
%HourDelta is the how much we want to shift by each step for generating
%each PS. Typically for ~24h sessions we set 0.5
% e.g. [Rcolomn,Velec,Tmax]=Zgenerate_Rcolomn3 (t,ic,100,0.5)
%##########################################################################
%Rev1- 200709
%Rev2 - 120809 return Velec
%Rev3 - 160809 save variables
%Rev4 - 010110 - added Tmax
%##########################################################################

function [Rcolomn,Velec,Tmax]=Zgenerate_Rcolomn3 (t,ic,RunsLimit,HourDelta,varargin)
delta=50000;
%delta=floor(max(t)/num);
Tstep=18000;
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
    fprintf(['Calculating PS #',num2str(i),' out of maximum of ',num2str(num), ' matrices...\n'])
    Rcolomn(:,:,i)=Zphase_synchronization(newT,ic,min(newT)+(i-1)*delta,Tstep); 
    b=find(Rcolomn(:,:,i)~=1 & Rcolomn(:,:,i)~=0); %#ok<EFIND>
    if isempty(b);
        %        error('There is a window with no activity')
        Rcolomn(:,:,i) = nan(size(ic,2));
    end
end
fprintf('\n Done \n');
% Rcolomn=Rcolomn(:,:,1:i-1); %last matrix is empty so we remove it.
Velec=ic(1:2,:);
%save ([varargin{1},varargin{2}],'Rcolomn','Velec')