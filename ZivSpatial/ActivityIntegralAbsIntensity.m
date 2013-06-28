% [Rect]=ActivityIntegralAbsIntensity(Signal,NBin,MinV);
% Function purpose : Calculates the activity intensity trace of the data
%
% Recives :     Signal - the signal to rectify
%               NBins -  The number of bins in the original signal to be
%                        reduce to one rectified bin in the new signal
%               MinVoltage - The minmum voltage to rectify above. Values bellow this voltage
%                            will be zeroed. If not entered function sets MinV to 3*standard deviations 
%                            of the averaged signal = std(signal)/sqrt(NBins) 
%                                                                                                                                                        
% Function give back :  ActInt - the integral signal
% Recomended usage  : [ActInt]=ActivityIntegralAbsIntensity(Signal,100,0);
% Last updated : 4/02/09
function [ActInt,MinV]=ActivityIntegralAbsIntensity(Signal,NBin,MinV)
if size(Signal,1)~=1
    Signal=Signal';
end
SM=mod(length(Signal),NBin);
if SM~=0
    fprintf('\nThe end of the signal has been cut to fit it to the bin size\n');
    Signal=Signal(1:end-SM);
end
SignalNaN=isnan(Signal);
M=mean(Signal(~SignalNaN));%determine mean for signal centering
if ~exist('MinV','var')
    MinV=4*std(Signal((~SignalNaN)))/sqrt(NBin);
end
Signal(SignalNaN)=M; %is later reduced to zero by M.
tmp=reshape(Signal,NBin,length(Signal)/NBin)-M; %centers signal
ActInt=mean(abs(tmp))-MinV;
ActInt(ActInt<0)=0;

