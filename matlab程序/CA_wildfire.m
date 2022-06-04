clc;
clear;
close all;

%0Ϊ��λ
%1Ϊȼ�յ���
%2Ϊ��������
n = 300; %����ɭ�ִ�С
Plight = 5e-6; %���׻��еĸ���
Pgrowth = 1e-3;%�����ĸ���
UL = [n 1:n-1]; %�����ھ�
DR = [2:n 1];%�����ھ�
veg=zeros(n,n);%ɭ��
imh = image(cat(3,veg,veg,veg));
% veg = empty=0 burning=1 green=2
for i=1:3000 %ѭ��
    %�۲�ÿһ����λ�����������ھ�����ȼ�յ����ĸ�����sumΪ300*300����ÿһ��ֵ��Ӧɭ�ֵ�ÿһ����λ��
    
    sum =            (veg(UL,:)==1) + ...
        (veg(:,UL)==1)     +      (veg(:,DR)==1) + ...
                     (veg(DR,:)==1);
%�ִ����=��-���ջٵ���+��������
    veg = 2*(veg==2) - ...
          ( (veg==2) & (sum>0 | (rand(n,n)<Plight)) ) + ...
          2*((veg==0) & rand(n,n)<Pgrowth) ;
     
    set(imh, 'cdata', cat(3,(veg==1),(veg==2),zeros(n)) )%��ͼ
    drawnow
end