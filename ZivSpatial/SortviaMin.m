clear all;
l=1;
numsteps=100;
matlabpool open 4;

%% Choose Who To Sort
DataFile=datastrm('X:\WT4\Post\290409_post_0011_0013.mcd');

%% Initialize Data
ChannelNames=getfield(DataFile,'ChannelNames2',{1});ChannelNames=str2double(ChannelNames{1});
ChannelID=getfield(DataFile,'ChannelID2',{1});ChannelID=ChannelID{1};
[MEAindex indx]=sort(ChannelID');
channels=ChannelNames(indx)';

clear ChannelID;


Tstart = getfield(DataFile,'sweepStartTime',{1});
Tend = getfield(DataFile,'sweepStopTime',{1});
T=Tstart;
Tstep=round(Tend/numsteps);

%% Create Frames
h=waitbar(0,'Reading data and converting. Please wait...');

while T<Tend, %read minute by minute
    Tstart=T;
    T=T+Tstep;
    if T>Tend,
        T=Tend;
    end
    waitbar(T/Tend,h);
    c = nextdata(DataFile,'streamname','Spikes 2','startend',[Tstart T]);
    save(['D:\Freshhh\1DWTM\DeleteMe\frame' num2str(l) '.mat'], 'c');
    l=l+1;
    clear c;
 end
close(h);

%% Detect into T and Indexchannel
ic=zeros(4,60);
j=1;
h=waitbar(0,'Creating T and Indexchannel. Please wait...');

for k=1:numsteps
    eval(['load(' '''' ['D:\Freshhh\1DWTM\DeleteMe\frame' num2str(k) '.mat'] ''''  ');']);
    spktimes=c.spiketimes(MEAindex);
    for i=1:(size(spktimes,1))
      t{i}.frame{k}=spktimes{i}*12;
    end
%    waitbar(k/numsteps,h);    
end
close(h);

h=1;
for m=1:size(t,2)
    t{m}=cat(1, t{m}.frame{1:size(t{m}.frame,2)});
    if size(t{m},1)>500
        t1{h}=t{m};
        vec(h)=m;
        h=h+1;
        
    end
end
t=t1;
clear t1;

ic(1,1:size(vec,2))=ChannelNames(indx(vec));


for m=1:size(vec,2)
    
    ic(2,m)=1;
    ic(3,m)=t{m}(1);
    ic(4,m)=t{m}(end);
end

ic(:,size(vec,2)+1:end)=[];


t = cat(1, t{1:end});

ic(3,1)=find(t==ic(3,1));
ic(4,1)=find(t==ic(4,1));

for k=2:size(ic,2)
    temp=find(t==ic(3,k));
    a=find(temp>ic(4,k-1));
    ic(3,k)=temp(a(1));
    
    temp=find(t==ic(4,k));
    b=find(temp>ic(3,k));
    ic(4,k)=temp(b(1));
end

%% Save Results to mat file
save('D:\Freshhh\1DWTM\WT4\290409\Minima\WT4_post', 't', 'ic');

%% Remove Frame Files
for i=1:numsteps
    eval(['delete' [' D:\Freshhh\1DWTM\DeleteMe\frame' num2str(i) '.mat']])
end

clear all;
matlabpool close;



