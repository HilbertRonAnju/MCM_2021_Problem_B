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
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 08-Feb-2021 01:00:10 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( temp, data );

% Set up fittype and options.
ft = fittype( 'poly1' );

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft );

% Plot fit with data.
subplot(1,3,2)
h = plot( fitresult, xData, yData );
xlabel('Averge Temperature of the region(centigrade)') % 横坐标
ylabel('Critical Ignition Probability)') % 纵坐标
axis([-inf,inf,-inf,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('actual data result','result fit'); % 图例
title('(b)')
grid on

