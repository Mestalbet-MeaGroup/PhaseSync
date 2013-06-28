function [x,d] = ZFindMaxInRcolomn(Rcolomn)
x=0;
[a,b,c]=size(Rcolomn);
for i=1:a
    for j=1:b
        for k=1:c
            if (i~=j && Rcolomn(i,j,k)>x )
                      d=[i,j,k]
                      x=Rcolomn(i,j,k)
             end
        end
    end
end
