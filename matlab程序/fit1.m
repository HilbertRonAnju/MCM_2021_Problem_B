clc;
clear;
close all

% load k_7to_95 %��������
load k_6to1 %��������

area = 0.2^2 .* mean(resultmat);
n = length(area);
a = linspace(0.6,1,n);
sort(a,1);
s = randn(1,n)./10; 
data = s+a;

start = 17.3;%��һ���¶�
endding = 17.5; %��ʮ���¶�
para = (1/10)*log(endding/start);
x = 0:0.1:10;
y = start.*exp(para.*x);
temp = linspace(18.9,16,n);


figure(1)
[fitresult, gof] = createFit1(a, area) % �����������
[fitresult, gof] = createFit2(temp, data) % ��ϲ������¶�
subplot(1,3,3) % �¶���ʱ��Ĺ�ϵ
plot(x,y,'r-')
xlabel('Year')
ylabel('Averge Temperature of the region(centigrade)')
axis([-inf,inf,-inf,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
title('(c)')
grid on
