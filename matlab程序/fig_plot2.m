load TEST
close all

figure( 'Name', ' 1' );
hold on
% ��ͼ������Դ
plot( alp,num4,'*-' );
hold off
xlabel('\alpha') % ������
ylabel('drone number') % ������
axis([-inf,inf,-inf,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5);
grid on


figure( 'Name', ' 2' );
hold on
% ��ͼ������Դ
plot( proo,num2,'.-' );
plot( proo,num3,'.-');
hold off
xlabel('the critical fire probability') % ������
ylabel('drone number') % ������
axis([-inf,inf,-inf,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('first time simulation','second time simulation'); % ͼ��
% title('the relationships between duty ratio and capacitor voltage ripple') % ����
grid on

