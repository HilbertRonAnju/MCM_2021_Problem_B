clc;
clear;
close all;
load terrain
figure (1)
surfc(x2,y2,M)
xlabel('axis i');
ylabel('axis j');
zlabel('nominal range based on the terrain data (km)');
set(gca,'FontName','Times New Roman');
set(gca,'xtick',[],'xticklabel',[])
set(gca,'ytick',[],'yticklabel',[])
colorbar;