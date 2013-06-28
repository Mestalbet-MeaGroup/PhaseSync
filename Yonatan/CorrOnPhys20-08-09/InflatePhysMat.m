function [PhysMat] = InflatePhysMat(PhysMat)

[nx,ny] = size(PhysMat);
% 
% for i=1:2*nx
%     i= i+1;
%     PhysMat(i+1:end+1,1:end) = PhysMat(i:end,1:end);
% end
% for i=1:2*ny
%     i= i+1;
%     PhysMat(1:end,i+1:end+1) = PhysMat(1:end,i:end);
% end


TPhysMat = zeros(2*nx,2*ny);
TPhysMat(1:nx,1:ny) = PhysMat ; 
for i=1:nx
    px(2*i-1) = i ;
    px(2*(nx-i+1)) = 2*nx-i+1;
end

for i=1:ny
    py(2*i-1) = i ;
    py(2*(ny-i+1)) = 2*ny-i+1;
end

PhysMat = TPhysMat(px,py);