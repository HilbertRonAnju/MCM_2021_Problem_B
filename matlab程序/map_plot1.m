clear;
close all;
clc;

figure(1)
m_proj('lambert','lon',[144, 152],'lat',[-39, -33]); 
[CS,CH]=m_etopo2('contourf',[-5000:500:0 250:250:3000],'edgecolor','none');
m_grid('fontname','times new roman','linestyle','none','tickdir','out','linewidth',1.5);
colormap([ m_colmap('blues',80); m_colmap('gland',48)]);
brighten(.5);
ax=m_contfbar(1,[.1 0.8],CS,CH,'axfrac',0.03,'fontname','times new roman');
title(ax,{'\fontname{times new roman}\fontsize{10} Level(m)',''}); % Move up by inserting a blank line


figure(2)
[ELEV,LON,LAT]=m_etopo2([144 152 -39 -33]);
for i = 1:size(ELEV,1)
    for j = 1:size(ELEV,2)
        if ELEV(i,j) < 0
            ELEV(i,j) = 0;
        end
    end
end

surfc(LON,LAT,ELEV);
colormap(jet(5));
xlabel('longitude(\circ)');
ylabel('latitude(\circ)');
zlabel('altitude(m)');
% title('Topographic map of fire area');
set(gca,'FontName','Times New Roman','FontSize',5);
colorbar;
grid on;
colormap jet