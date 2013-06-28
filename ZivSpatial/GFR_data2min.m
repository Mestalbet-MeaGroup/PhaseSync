% Last Updated: June 16th by Noah.  Finds the firing frequency in parallel for all chosen neurons in all
% sorted files and saves them to a structure.

%% Initialize
clear all;
close all;

tic;
matlabpool open 2;


%% Load Data into structure
sorted(1,1).name = 'WT1_pre';
sorted(1,1).data = load('D:\NewWTapproach\WT_TH20\WT1_17DIV\minima\WT1_pre.mat', 't','ic');

sorted(1,2).name = 'WT1_post';
sorted(1,2).data = load('D:\NewWTapproach\WT_TH20\WT1_17DIV\minima\WT1_post.mat', 't','ic');

window=500; %select window and step for analysis. 
steps=250;

%% Calculate Spikes for data

for i=1:2
  
   t = sorted(1,i).data.t;
   ic = sorted(1,i).data.ic;
   
   for j=1:size(ic,2)
    sorted(1,i).neuron.Spk{j}.data=SpikeCountNormpar(t,ic,j,window,steps);
    sorted(1,i).neuron.Spk{j}.channel=ic(1,j);
    sorted(1,i).neuron.Spk{j}.number=ic(2,j);
   end
   
end

clear i;
clear j;
clear window;
clear steps;
clear t;
clear ic;

%% Find Which Neurons are active both pre and post

i=1;
l=1;

for j=1:size(sorted(1,i).neuron.Spk,2)
     for k=1:size(sorted(1,i+1).neuron.Spk,2)
       if ((sorted(1,i).neuron.Spk{1,j}.channel==sorted(1,i+1).neuron.Spk{1,k}.channel) && (sorted(1,i).neuron.Spk{1,j}.number==sorted(1,i+1).neuron.Spk{1,k}.number));
        sorted(1,i).neuron.vec(l)=j;
        sorted(1,i+1).neuron.vec(l)=k;
        l=l+1;
       end
      end
end

%% Save Graphs of always active neurons to jpeg files

i=1;
  for j=1:length(sorted(1,i).neuron.vec)
    Compare2SpikeCountshrs(sorted(1,i).neuron.Spk{1,sorted(1,i).neuron.vec(j)}.data,sorted(1,i+1).neuron.Spk{1,sorted(1,i+1).neuron.vec(j)}.data,[num2str(sorted(1,i).neuron.Spk{j}.channel) ' ' num2str(sorted(1,i).neuron.Spk{j}.number) ' ' sorted(1,i).name(1:3)]);
    close all;
  end

clear i;
clear j;
clear k;
clear l;

%% Close 

 matlabpool close;

 toc;

