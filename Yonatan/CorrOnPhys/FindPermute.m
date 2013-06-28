function p = FindPermute(V,W)
%finds the permutation needed for W to turn into V
N = length(V); 
for i=1:N
    p(i) = find(W==V(i));
end