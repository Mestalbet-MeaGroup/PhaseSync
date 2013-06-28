function R=Zphase_synchronization(T,IC,Tstart,Tstep);
% StartTime=min(T);
%  step= 10000;
StartTime=Tstart;
step= Tstep;

EndTime=StartTime+step;
% StartTime=max(min(T),max(T)-step);
if max(T)>step
    len=step;
else
    len=EndTime-StartTime;
end


t=zeros(length(IC),len);
phases=zeros(length(IC),len);
T1=[];
T2=[];
HistWidth=0.65;
for i=1:size(IC,2)
    
    neuron1=ceil(T(IC(3,i):IC(4,i)));
    neuron1=neuron1(neuron1>StartTime & neuron1<EndTime);
    if (~isempty(neuron1))
        neuron1=neuron1-neuron1(1)+1;
        PHI1=[];
        T2(i,1:(max(neuron1)))=[1:(max(neuron1)) ];
        T1=T2(i,1:(max(neuron1)));
        t1=T1(T1>=0 & T1<neuron1(1));
        PHI1=2*pi*(t1-0)/(neuron1(1)-0);
        for k=2:length(neuron1);
            t1=T1(T1>=neuron1(k-1) & T1<neuron1(k));
            phi1=2*pi*k+2*pi*(t1-neuron1(k-1))/(neuron1(k)-neuron1(k-1));
            PHI1=[PHI1 phi1];
        end
    else
        PHI1=zeros(1,len-1);
    end
    phases(i,1:length(PHI1))=mod(PHI1,2*pi);
end

for a=1:size(IC,2)
    for b=a:size(IC,2)
        neuron1=ceil(T(IC(3,a):IC(4,a)));
        neuron1=neuron1(neuron1>StartTime & neuron1<EndTime);
        if (~isempty(neuron1))  
            neuron1=neuron1-neuron1(1)+1; 
        end
        neuron2=ceil(T(IC(3,b):IC(4,b)));
        neuron2=neuron2(neuron2>StartTime & neuron2<EndTime);
        
        if (~isempty(neuron2))  
            neuron2=neuron2-neuron2(1)+1; 
        end
        if (length(neuron1)>4 && length(neuron2)>4)
            PHI1=phases(a,(neuron1(1)):(max(neuron1(end)))-1);
            PHI2=phases(b,(neuron2(1)):(max(neuron2(end)))-1);
            delta1=PHI1(1:min(length(PHI1),length(PHI2)))-PHI2(1:min(length(PHI1),length(PHI2)));
            delta2=PHI2(1:min(length(PHI1),length(PHI2)))-PHI1(1:min(length(PHI1),length(PHI2)));
            c=sum(cos(delta1))./length(delta1);
            s=sum(sin(delta1))./length(delta1);
            R(a,b)=sqrt(c.^2+s.^2);
            c=sum(cos(delta2))./length(delta2);
            s=sum(sin(delta2))./length(delta2);
            R(b,a)=sqrt(c.^2+s.^2);
            
        else
            R(a,b)=0;
            R(b,a)=0;
        end
    end
end
for a=1:length(R)
    R(a,a)=1; %set ti one instead of -1 accrding to Eshel's request
end
for s=1:size(IC,2)
    D(s,:)=cos(phases(s,:))+1i*sin(phases(s,:));
end

