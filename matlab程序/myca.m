clc;
clear;
close all
%0Ϊ��λ
%1Ϊȼ�յ���
%2Ϊ��������
a = 200; %����ɭ�ִ�С
b = 160;
burn = 1.0;
k = 0.005;

veg=5*ones(a,b);%ɭ��
veg(100:101,80:81)=[4 4;4 4];
imh = image(cat(3,veg,veg,veg));
W = fspecial('gaussian',[51,51],1);
% veg = empty=0 burning=1-4 green=5
for i=1:1000 %ѭ��
    %�۲�ÿһ����λ�����������ھ�����ȼ�յ����ĸ���
    %(sumΪ300*300����ÿһ��ֵ��Ӧɭ�ֵ�ÿһ����λ)
    vegavg = imfilter(double(veg<5&veg>1), W, 'replicate');
    %�ִ����=��-���ջٵ���+��������
    veg = veg - 1 + (veg==5) + (veg==0) + (veg<0) ...
        - (veg==5).*(vegavg>= burn * rand(a,b)) ...
        - 5*((1<veg&veg<5).*rand(a,b) > exp(-k*i));
    %�ִ����=��-���ջٵ���+��������
    %veg = veg - 1 + (veg==5) + (veg==0) - (veg==5).*(vegavg>= burn * rand(a,b));
    set(imh, 'cdata', cat(3,(1<veg&veg<5),(veg==5),zeros(a,b)));%��ͼ;
    drawnow
end
