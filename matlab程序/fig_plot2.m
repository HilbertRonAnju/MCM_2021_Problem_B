load TEST
close all

figure( 'Name', ' 1' );
hold on
% 画图数据来源
plot( alp,num4,'*-' );
hold off
xlabel('\alpha') % 横坐标
ylabel('drone number') % 纵坐标
axis([-inf,inf,-inf,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5);
grid on


figure( 'Name', ' 2' );
hold on
% 画图数据来源
plot( proo,num2,'.-' );
plot( proo,num3,'.-');
hold off
xlabel('the critical fire probability') % 横坐标
ylabel('drone number') % 纵坐标
axis([-inf,inf,-inf,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('first time simulation','second time simulation'); % 图例
% title('the relationships between duty ratio and capacitor voltage ripple') % 标题
grid on

