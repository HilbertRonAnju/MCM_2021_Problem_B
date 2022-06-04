% clc;
% clear;
close all
load k_6to1
a = 0.6:0.02:1;
area = 0.2^2 .* mean(resultmat);

figure(1)
[fitresult, gof] = createFit1(a, area)

temp = 16:0.1:18;

s = randn(1,21)./10; 
data = s+a;
[fitresult, gof] = createFit2(temp, data)
subplot(1,3,3)
x = 0:0.1:10;
y = 17.*exp(0.00117.*x);
plot(x,y,'r-')
xlabel('Year') % ｺ瞹�
ylabel('Averge Temperature of the region(centigrade)') % ﾗﾝﾗ�?
axis([-inf,inf,-inf,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
title('(c)')
grid on
