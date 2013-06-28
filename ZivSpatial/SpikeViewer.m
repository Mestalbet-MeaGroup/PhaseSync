function varargout = SpikeViewer(varargin)
% SPIKEVIEWER M-file for SpikeViewer.fig
%
% Last Modified by GUIDE v2.5 19-Jan-2009 10:59:50
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @SpikeViewer_OpeningFcn, ...
    'gui_OutputFcn',  @SpikeViewer_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before SpikeViewer is made visible.
function SpikeViewer_OpeningFcn(hObject, eventdata, handles, varargin)

if size(varargin,2)~=3,
    msgbox('Function requires the following inputs: SpikeViewer(t,ic,''File Name'')','Attention','error','replace');
    pause;
    error('Function requires different inputs');
end

handles.InPar.t=round(varargin{1}*(10/12))/10; %Change to sampling resolution
handles.InPar.ic=varargin{2};
handles.InPar.McdFile=varargin{3};

handles=Initialize(handles);
handles.Par.InitializePlot=1;
handles=PlotSpike(handles);

% Choose default command line output for SpikeViewer
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SpikeViewer wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SpikeViewer_OutputFcn(hObject, eventdata, handles)
% Get default command line output from handles structure
varargout{1} = handles.output;

function handles=Initialize(handles)
%Initialize parameters
handles.Par.WaveformWindowSize=str2double(get(handles.WaveformWindowSize,'string'));
handles.Par.PlotMin=str2double(get(handles.PlotMinimum,'string'));
handles.Par.PlotMax=str2double(get(handles.PlotMaximum,'string'));
handles.Par.icIndex=1;
handles=InitializeNeuron(handles);

%Initialize MCD file parameters
[handles]=InitializeMcdData(handles);

%Initialize axes
axes(handles.WaveformPlot);
handles.h_VoltageData=plot(0,0);
handles.h_ThreshLine=line([0 1],[0 1]);
handles.h_CurrentSpike=line([1 0],[1 0]);

ylabel('Voltage [\muV]');
set(gca,'XTickLabel',[]);
hold on;

axes(handles.WaveformIntensityPlot);
ylabel('Rect. Voltage');
set(gca,'XTickLabel',[]);
set(gca,'YTickLabel',[]);
hold on;




function handles=PlotSpike(handles)

if handles.Par.InitializePlot==1
    
    Tstart=handles.Par.WaveformWindowTime;
    Tend=handles.Par.WaveformWindowTime+handles.Par.WaveformWindowSize;
    c = nextdata(handles.Par.DataFile,'streamname',handles.Par.SpikeRawDataStrings{handles.Par.SpikeRawDataSwitch},'startend',[Tstart;Tend]);
    c_ch=handles.Par.Channel2Place(handles.Par.Channel);
    
    if handles.Par.SpikeRawDataSwitch==1
        VoltageData=NaN(1,round(handles.Par.SamplingRate/1000*(Tend-Tstart)));
        TimeData=zeros(1,round(handles.Par.SamplingRate/1000*(Tend-Tstart)));
        VoltageData_tmp=ad2muvolt(handles.Par.DataFile,c.spikevalues{c_ch},handles.Par.SpikeRawDataStrings{handles.Par.SpikeRawDataSwitch});
        TimeData_tmp=c.spiketimes{c_ch}; %in ms
        [X,Y]=meshgrid(TimeData_tmp,-handles.Par.PreTrig:(1000/handles.Par.SamplingRate):handles.Par.PostTrig-(1000/handles.Par.SamplingRate));
        TimeData_tmp=X+Y;
        P=find(TimeData_tmp(:)>=Tstart & TimeData_tmp(:)<=Tend); %-0.1 to make sure nothing is missed
        VoltageData(1,ceil((TimeData_tmp(P)-Tstart)*(handles.Par.SamplingRate/1000)))=VoltageData_tmp(P);%-0.1 to make sure nothing is missed %round was changed to ceil
        TimeData(1,:)=Tstart+(1:round(handles.Par.SamplingRate/1000*(Tend-Tstart)))/(handles.Par.SamplingRate/1000);
    else
        VoltageData=c.data(c_ch,:);
        VoltageData=ad2muvolt(handles.Par.DataFile,c.data(c_ch,:),handles.Par.SpikeRawDataStrings{handles.Par.SpikeRawDataSwitch});
        TimeData=Tstart:(1000/(handles.Par.SamplingRate)):(Tend-(1000/(handles.Par.SamplingRate)));
    end
        
    %plot the recorded frame:
    axes(handles.WaveformPlot);
    delete(handles.h_VoltageData);
    handles.h_VoltageData=plot(TimeData,VoltageData);
    delete(handles.h_ThreshLine);
    handles.h_ThreshLine=line([Tstart Tend],[handles.Par.Thresholds_uV(handles.Par.icIndex) handles.Par.Thresholds_uV(handles.Par.icIndex)],'color','c');
    xlim([Tstart Tend]);
    ylim([handles.Par.PlotMin handles.Par.PlotMax]);
    handles.Par.InitializePlot=0;
    
    %Plot activity intensity for frame
    axes(handles.WaveformIntensityPlot);
    [handles.Par.ActInt] =ActivityIntegralAbsIntensity(VoltageData,100);
    imagesc(handles.Par.ActInt,[0 20]);
    xlim([0.5 length(handles.Par.ActInt)+0.5]); 
end
axes(handles.WaveformPlot);
delete(handles.h_CurrentSpike);
handles.h_CurrentSpike=line([handles.Par.CurrentSpikeTime handles.Par.CurrentSpikeTime],[handles.Par.PlotMin handles.Par.PlotMax],'color','r');

%delete(handles.h_CurrentPeakVoltage);
%handles.h_CurrentPeakVoltage=plot(handles.Par.CurrentSpikeTime,],'color','.r','MarkerSize',3);


% --- Executes on button press in NextSpike.
function NextSpike_Callback(hObject, eventdata, handles)
if (handles.Par.tIndex+1)<=(handles.Par.tIndexMax)
    handles.Par.tIndex=handles.Par.tIndex+1;
    handles.Par.CurrentSpikeTime=handles.InPar.t(handles.Par.tIndex);
    set(handles.CurrentSpikeTime,'string',num2str(handles.Par.CurrentSpikeTime,'%.1f'));
    if handles.Par.CurrentSpikeTime>(handles.Par.WaveformWindowTime+handles.Par.WaveformWindowSize)
        handles.Par.InitializePlot=1;
        handles.Par.WaveformWindowTime=handles.Par.CurrentSpikeTime-handles.Par.WaveformWindowSize/2;
        set(handles.WaveformWindowTime,'string',num2str(handles.Par.WaveformWindowTime,'%.1f'));
    end
    handles=PlotSpike(handles);
else
    msgbox('This is the last spike for this neuron','Attention','error','replace');
end
guidata(hObject, handles);

% --- Executes on button press in PrevSpike.
function PrevSpike_Callback(hObject, eventdata, handles)
if (handles.Par.tIndex-1)>=(handles.Par.tIndexMin)
    handles.Par.tIndex=handles.Par.tIndex-1;
    handles.Par.CurrentSpikeTime=handles.InPar.t(handles.Par.tIndex);
    set(handles.CurrentSpikeTime,'string',num2str(handles.Par.CurrentSpikeTime,'%.1f'));
    if handles.Par.CurrentSpikeTime<handles.Par.WaveformWindowTime
        handles.Par.InitializePlot=1;
        handles.Par.WaveformWindowTime=handles.Par.CurrentSpikeTime-handles.Par.WaveformWindowSize/2;
        set(handles.WaveformWindowTime,'string',num2str(handles.Par.WaveformWindowTime,'%.1f'));   
    end
    handles=PlotSpike(handles);
else
    msgbox('This is the first spike for this neuron','Attention','error','replace');
end
guidata(hObject, handles);


function NeuronNumber_Callback(hObject, eventdata, handles)
handles.Par.Neuron=str2double(get(handles.NeuronNumber,'string'));

% --- Executes during object creation, after setting all properties.
function NeuronNumber_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ChannelNumber_Callback(hObject, eventdata, handles)
NewChannel=str2double(get(handles.ChannelNumber,'string'));
NewPlace=find(handles.InPar.ic(1,:)==NewChannel);
NewNeuronPlace=find(handles.InPar.ic(2,NewPlace)==handles.Par.Neuron);
if isempty(NewPlace)
    msgbox('The requested channel does not exist','Attention','error','replace');
    set(handles.ChannelNumber,'string',handles.Par.Channel);
elseif isempty(NewNeuronPlace)
    fprintf('\nNotice that the neuron number had been changed to 1\n');
    handles.Par.icIndex=NewPlace(1);
    handles=InitializeNeuron(handles);
    handles=PlotSpike(handles);
else
    handles.Par.icIndex=NewPlace(1)+NewNeuronPlace-1;
    handles=InitializeNeuron(handles);
    handles=PlotSpike(handles);
end
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function ChannelNumber_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in NextNeuron.
function NextNeuron_Callback(hObject, eventdata, handles)
if handles.Par.icIndex+1<=size(handles.InPar.ic,2)
    handles.Par.icIndex=handles.Par.icIndex+1;
    handles=InitializeNeuron(handles);
    handles=PlotSpike(handles);
else
    msgbox('This is the last neuron in this recording','Attention','error','replace');
end
guidata(hObject, handles);


% --- Executes on button press in PrevNeuron.
function PrevNeuron_Callback(hObject, eventdata, handles)
if handles.Par.icIndex-1>=1
    handles.Par.icIndex=handles.Par.icIndex-1;
    handles=InitializeNeuron(handles);
    handles=PlotSpike(handles);
else
    msgbox('This is the first neuron in this recording','Attention','error','replace');
end
guidata(hObject, handles);

function handles=InitializeNeuron(handles)
    handles.Par.Channel=handles.InPar.ic(1,handles.Par.icIndex);
    handles.Par.Neuron=handles.InPar.ic(2,handles.Par.icIndex);
    handles.Par.tIndex=handles.InPar.ic(3,handles.Par.icIndex);
    handles.Par.tIndexMin=handles.InPar.ic(3,handles.Par.icIndex);
    handles.Par.tIndexMax=handles.InPar.ic(4,handles.Par.icIndex);
    handles.Par.CurrentSpikeTime=handles.InPar.t(handles.Par.tIndex);
    handles.Par.WaveformWindowTime=handles.Par.CurrentSpikeTime-handles.Par.WaveformWindowSize/2;
    
    %Initialize screen parameters
    set(handles.ChannelNumber,'string',handles.Par.Channel);
    set(handles.NeuronNumber,'string',handles.Par.Neuron);
    set(handles.CurrentSpikeTime,'string',num2str(handles.Par.CurrentSpikeTime,'%.1f'));
    set(handles.WaveformWindowTime,'string',num2str(handles.Par.WaveformWindowTime,'%.1f'));
    handles.Par.InitializePlot=1;



function WaveformWindowSize_Callback(hObject, eventdata, handles)
handles.Par.WaveformWindowSize=str2double(get(handles.WaveformWindowSize,'string'));
handles.Par.WaveformWindowTime=handles.Par.CurrentSpikeTime-handles.Par.WaveformWindowSize/2;
set(handles.WaveformWindowTime,'string',num2str(handles.Par.WaveformWindowTime,'%.1f'));
handles.Par.InitializePlot=1;
handles=PlotSpike(handles);
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function WaveformWindowSize_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function WaveformWindowTime_Callback(hObject, eventdata, handles)
handles.Par.WaveformWindowTime=str2double(get(handles.WaveformWindowTime,'string'));
handles.Par.CurrentSpikeTime=handles.Par.WaveformWindowTime+handles.Par.WaveformWindowSize/2;
set(handles.CurrentSpikeTime,'string',num2str(handles.Par.CurrentSpikeTime,'%.1f'));
[V NewTPlace]=min(abs(handles.InPar.t(handles.InPar.ic(3,handles.Par.icIndex):handles.InPar.ic(4,handles.Par.icIndex))-handles.Par.CurrentSpikeTime));
handles.Par.tIndex=NewTPlace+handles.InPar.ic(3,handles.Par.icIndex)-1;
fprintf('\nThe closest spike to the location given is at: %d [ms]\nThis location will be considered as the next spike\n',handles.InPar.t(handles.Par.tIndex));
handles.Par.InitializePlot=1;
handles=PlotSpike(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function WaveformWindowTime_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function CurrentSpikeTime_Callback(hObject, eventdata, handles)
handles.Par.CurrentSpikeTime=str2double(get(handles.CurrentSpikeTime,'string'));
handles.Par.WaveformWindowTime=handles.Par.CurrentSpikeTime-handles.Par.WaveformWindowSize/2;
set(handles.WaveformWindowTime,'string',num2str(handles.Par.WaveformWindowTime,'%.1f'));
[V NewTPlace]=min(abs(handles.InPar.t(handles.InPar.ic(3,handles.Par.icIndex):handles.InPar.ic(4,handles.Par.icIndex))-handles.Par.CurrentSpikeTime));
handles.Par.tIndex=NewTPlace+handles.InPar.ic(3,handles.Par.icIndex)-1;
fprintf('\nThe closest spike to the location given is at: %d [ms]\nThis location will be considered as the next spike\n',handles.InPar.t(handles.Par.tIndex));
handles.Par.InitializePlot=1;
handles=PlotSpike(handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function CurrentSpikeTime_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PlotMinimum_Callback(hObject, eventdata, handles)
handles.Par.PlotMin=str2double(get(handles.PlotMinimum,'string'));
handles.Par.InitializePlot=1;
handles=PlotSpike(handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function PlotMinimum_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function PlotMaximum_Callback(hObject, eventdata, handles)
handles.Par.PlotMax=str2double(get(handles.PlotMaximum,'string'));
handles.Par.InitializePlot=1;
handles=PlotSpike(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function PlotMaximum_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in SpikeRawDataSwitch.
function SpikeRawDataSwitch_Callback(hObject, eventdata, handles)
handles.Par.SpikeRawDataSwitch=1+get(handles.SpikeRawDataSwitch,'value');
if length(getfield(handles.Par.DataFile,'StreamInfo'))>1
    handles.Par.InitializePlot=1;
    handles=PlotSpike(handles);
else
      msgbox('This recording does not contain raw data','Attention','error','replace');
      set(handles.SpikeRawDataSwitch,'value',0);
end
guidata(hObject, handles);


function [handles]=InitializeMcdData(handles)
[pathstr,name,ext,versn] = fileparts(handles.InPar.McdFile);
handles.Par.DataFile=datastrm([name ext]);
SpikeInfo = getfield(handles.Par.DataFile,'StreamInfo');
handles.Par.SpikeRawDataStrings={'Spikes 2','Electrode Raw Data'};
handles.Par.SpikeRawDataSwitch=1+get(handles.SpikeRawDataSwitch,'value');
%strcmp(SpikeInfo{i}.StreamName,handles.Par.SpikeRawDataStrings(handles.Par.SpikeRawDataSwitch))
handles.Par.SamplingRate=getfield(handles.Par.DataFile,'MillisamplesPerSecond2',{1})/1000;   %in Hz
handles.Par.PreTrig=SpikeInfo{1}.PreTrigger*1000; %ms
handles.Par.PostTrig=SpikeInfo{1}.PostTrigger*1000; %ms
ChannelNames=getfield(handles.Par.DataFile,'ChannelNames2',{1});ChannelNames=str2double(ChannelNames{1});
ChannelID=getfield(handles.Par.DataFile,'ChannelID2',{1});ChannelID=ChannelID{1};
[handles.Par.MEAindex indx]=sort(ChannelID');
handles.Par.AllChannels=ChannelNames(indx)'; %Regular MCS setup
handles.Par.Channel2Place=zeros(1,87);
handles.Par.Channel2Place(handles.Par.AllChannels)=handles.Par.MEAindex;
handles.Par.Thresholds_uV=SpikeInfo{1}.Level*1e6;handles.Par.Thresholds_uV=handles.Par.Thresholds_uV(indx);

