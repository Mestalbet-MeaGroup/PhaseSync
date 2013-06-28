% by Ziv Yekutieli - ziv.yekutieli@hotmail.com
% this function generates a time vector to be used on plots
% Inputs:
%       t
%      unit 's'\'m'\'h' to be used 
% Outputs:
%       tplot - the time vector to be used
%       
%e.g. [tplot] = ZGenerateTimeStamps(t,ic,10)
% 301010 - rev1


function [channels,electrodes,FR] = ZGenerateTimeStamps(t,unit,window)
fprintf('\n Calculating Firing Rate per electrode \n')
channels = ic(1,:);
electrodes = ic(2,:);
a=size(ic,2);
tnew=t/12000;
tstart=min(tnew);
tend=max(tnew);
frames=floor((tend-tstart)/window); %number of frames, each with duration of window for this recording
for i=1:a
    spikes=tnew(ic(3,i):ic(4,i)) ;%this is the vector of all the spikes in t, for the electorde we deal with
    for j=0:frames-1
        FR(i,j+1)=length(find(spikes >= tstart+j*window & spikes < tstart +(j+1)*window));
    end
end
fprintf('\n Calculating Firing Rate is done \n')

    
