function Vsmooth=ZSmoothVec2(V,f)

a=floor(length(V)/f);
Vsmooth=zeros(1,a);

for i=1:a
    tmp=0;
    for j=1:f
       tmp=tmp+V(i-1+j);
    end;
    Vsmooth(i)=tmp/f;
end