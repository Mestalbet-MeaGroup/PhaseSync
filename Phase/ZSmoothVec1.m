function Vsmooth=ZSmoothVec1(V,f)

a=length(V);
Vtemp=V;

for i=a+1:a+f-1
    Vtemp(i)=V(a);
end

for i=1:a
    tmp=0;
    for j=1:f
        tmp=tmp+Vtemp(i-1+j);
    end;
    Vsmooth(i)=tmp/f;
end
