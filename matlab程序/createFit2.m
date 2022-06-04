function [fitresult, gof] = createFit2(temp, data)
%CREATEFIT(TEMP,DATA)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : temp
%      Y Output: data
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  ������� FIT, CFIT, SFIT.

%  �� MATLAB �� 08-Feb-2021 01:00:10 �Զ�����


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( temp, data );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
subplot(1,3,2)
h = plot( fitresult, xData, yData );
xlabel('Averge Temperature of the region(centigrade)') % ������
ylabel('Critical Ignition Probability)') % ������
axis([-inf,inf,-inf,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('actual data result','result fit'); % ͼ��
title('(b)')
grid on

