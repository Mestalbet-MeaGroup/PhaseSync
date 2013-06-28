function R=ZDiagOnesRcolomn(Rcolomn)

[a,b,c]=size(Rcolomn);
R=Rcolomn;
for i=1:a
    for j=1:b
        for k=1:c
            if i==j
                R(i,j,k)=1;
            end
        end
    end
end