function [fitresult, gof] = createFit1(a, area)
%CREATEFIT(A,AREA)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : a
%      Y Output: area
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 07-Feb-2021 23:04:37 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( a, area );

% Set up fittype and options.
ft = fittype( 'power1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [1093.69730788857 13.3774767416175];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
subplot(1,3,1)
plot( fitresult, xData, yData );
xlabel('Critical Ignition Probability') % 横坐标
ylabel('Wildfire Area (km^{2})') % 纵坐标
axis([-inf,inf,-inf,inf]);
set(gca,'FontName','Times New Roman');
set(findobj('Type','line'),'LineWidth',1.5)
legend('simulation result','result fit'); % 图例
title('(a)')
grid on
