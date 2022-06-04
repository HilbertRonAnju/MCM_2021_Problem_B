load DATA
close all;
cell_all = {burn_mask,burn_map,burn_proba,burn_rate,extinguish_map,extinguish_proba,ignite_map,new_tree_state,tree_state};
figure(1)
% imagesc(ones(8,10))
colormap(gray)
set(gca,'xtick',[0.5:0.5:8.5],'xticklabel',[])
set(gca,'ytick',[0.5:0.5:10.5],'yticklabel',[])
grid on
axis equal
% for i = 2:9
%     figure(i)
%     imagesc(-cell_all{i})
%     colormap(gray)
%     set(gca,'xtick',[0.5:10.5],'xticklabel',[])
%     set(gca,'ytick',[0.5:8.5],'yticklabel',[])
%     grid on
%     axis equal
% end