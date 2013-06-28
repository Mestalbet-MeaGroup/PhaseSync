% by Ziv Yekutieli - ziv.yekutieli@hotmail.com
% this function calculates the firing rate of all the neurons (seperatly) over the entire range of recording time. 
% Inputs:
%       t
%       ic
%       window - the time resolution [in seconds] for the accumulation of spikes
% Outputs:
%       channels - the channel number (from ic)
%       electrode - the electrode number (from ic)
%       FRv matix - the Firing Rate vector of each electorde. the first raw is the FR of the first electrode etc.
%e.g. [channels,electrodes,FR] = ZCalculateFiringRate(t,ic,10)
% 291010 - rev1


function [channels,electrodes,FR] = ZCalculateFiringRate(t,ic,window)
matlabpool open 2
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
    parfor j=0:frames-1
        FR(i,j+1)=length(find(spikes >= tstart+j*window & spikes < tstart +(j+1)*window));
    end
end
matlabpool close;
fprintf('\n Calculating Firing Rate is done \n')
end
    
