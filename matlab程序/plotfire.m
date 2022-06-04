figure(2)
pic = 1; %pic = 1-5

imh = image(cat(3,1-burnresult(:,:,1),1-burnresult(:,:,1),1-burnresult(:,:,1)));
set(gca,'FontName','Times New Roman','fontsize',15);
xlabel('axis i') % ºá×ø±ê
ylabel('axis j') % ×Ý×ø±ê
grid on
drawnow