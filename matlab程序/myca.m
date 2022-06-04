clc;
clear;
close all
%0为空位
%1为燃烧的树
%2为正常的树
a = 200; %构造森林大小
b = 160;
burn = 1.0;
k = 0.005;

veg=5*ones(a,b);%森林
veg(100:101,80:81)=[4 4;4 4];
imh = image(cat(3,veg,veg,veg));
W = fspecial('gaussian',[51,51],1);
% veg = empty=0 burning=1-4 green=5
for i=1:1000 %循环
    %观察每一个空位其上下左右邻居正在燃烧的树的个数
    %(sum为300*300矩阵，每一个值对应森林的每一个空位)
    vegavg = imfilter(double(veg<5&veg>1), W, 'replicate');
    %现存的树=树-被烧毁的树+新生的树
    veg = veg - 1 + (veg==5) + (veg==0) + (veg<0) ...
        - (veg==5).*(vegavg>= burn * rand(a,b)) ...
        - 5*((1<veg&veg<5).*rand(a,b) > exp(-k*i));
    %现存的树=树-被烧毁的树+新生的树
    %veg = veg - 1 + (veg==5) + (veg==0) - (veg==5).*(vegavg>= burn * rand(a,b));
    set(imh, 'cdata', cat(3,(1<veg&veg<5),(veg==5),zeros(a,b)));%画图;
    drawnow
end
