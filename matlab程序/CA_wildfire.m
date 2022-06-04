clc;
clear;
close all;

%0为空位
%1为燃烧的树
%2为正常的树
n = 300; %构造森林大小
Plight = 5e-6; %被雷击中的概率
Pgrowth = 1e-3;%生长的概率
UL = [n 1:n-1]; %上左邻居
DR = [2:n 1];%下右邻居
veg=zeros(n,n);%森林
imh = image(cat(3,veg,veg,veg));
% veg = empty=0 burning=1 green=2
for i=1:3000 %循环
    %观察每一个空位其上下左右邻居正在燃烧的树的个数（sum为300*300矩阵，每一个值对应森林的每一个空位）
    
    sum =            (veg(UL,:)==1) + ...
        (veg(:,UL)==1)     +      (veg(:,DR)==1) + ...
                     (veg(DR,:)==1);
%现存的树=树-被烧毁的树+新生的树
    veg = 2*(veg==2) - ...
          ( (veg==2) & (sum>0 | (rand(n,n)<Plight)) ) + ...
          2*((veg==0) & rand(n,n)<Pgrowth) ;
     
    set(imh, 'cdata', cat(3,(veg==1),(veg==2),zeros(n)) )%画图
    drawnow
end