clear;
clc;
close all;

topo_raw = load('地形数据.txt');
Lon = sort(unique(topo_raw(:,1)),'ascend');
Lat = sort(unique(topo_raw(:,2)),'ascend');
lon = repmat(Lon',[length(Lat),1]);
lat = repmat(Lat,[1,length(Lon)]);
topo = zeros(length(Lat),length(Lon));

for i=1:length(Lat)
   for j=1:length(Lon)
       idx = find(abs(topo_raw(:,1)-lon(i,j))>=0 & abs(topo_raw(:,1)-lon(i,j))<0.009...
                  &abs(topo_raw(:,2)-lat(i,j))>=0 & abs(topo_raw(:,2)-lat(i,j))<0.009);
       topo(i,j)=topo_raw(idx,3);  
   end
end

save TOPO lon lat topo