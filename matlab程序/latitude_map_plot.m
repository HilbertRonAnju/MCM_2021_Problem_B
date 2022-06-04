clc;
clear;
close all;

load TOPO
load Coord

for i = 1:size(ELEV,1)
    for j = 1:size(ELEV,2)
        if ELEV(i,j) < 0
            ELEV(i,j) = 0;
        end
    end
end

figure(1)
surfc(lon,lat,topo);
colormap(jet(5));
xlabel('longitude(\circ)');
ylabel('latitude(\circ)');
zlabel('altitude(m)');
% title('Topographic map of fire area');
set(gca,'FontName','Times New Roman','FontSize',15);
colorbar;
axis([-inf,inf,-inf,inf,0,inf]);
view([-1,1,1]);
grid on;
colormap jet

figure(2)
contour(yyy,xxx,topo,8);
xlabel('axis x (m)');
ylabel('axis y (m)');
set(gca,'FontName','Times New Roman');
colorbar;
colormap default
