clc;
clear;
close all

load SRESULT79

figure(1)
subplot(2,5,1)
imshow(s1)
xlabel('i')
ylabel('j')
set(gca,'FontName','Times New Roman');
subplot(2,5,2)
imshow(s2)
subplot(2,5,3)
imshow(s3)
subplot(2,5,4)
imshow(s4)
subplot(2,5,5)
imshow(s5)
subplot(2,5,[6:10])
colormap(bone);
colorbar('northoutside')
axis off
set(gca,'FontName','Times New Roman');
