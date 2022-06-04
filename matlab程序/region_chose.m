clc;
clear;
close all

load DATA
load COORD
load LATLON

m = size(latlon20,1);
latlon = [];
data_real = [];
coord = [];

for i = 1:m
    if latlon20(i,1) >= -39 && latlon20(i,1) <= -33 && latlon20(i,2) >= 144 && latlon20(i,2) <= 152
        latlon = [latlon;latlon20(i,:)];
        coord = [coord;Rs(i,:)];
        data_real = [data_real;data(i,:)];
        %         disp('+1');
    else
        %         disp('000000000000000000');
    end
end

save ANALYSISDATA data_real coord latlon
[n,m] = size(data_real);
X = data_real;
Z = X ./ repmat(sum(X.*X) .^ 0.5, n, 1);
disp('Standardization finish')

if sum(sum(Z<0)) >0
    disp('There are negative numbers in the original normalized Z matrix, so x needs to be re normalized')
    for i = 1:n
        for j = 1:m
            Z(i,j) = [X(i,j) - min(X(:,j))] / [max(X(:,j)) - min(X(:,j))];
        end
    end
    disp('X重新进行标准化得到的标准化矩阵Z为:  ')
    disp(Z)
end
weight = Entropy_Method(Z);
disp('weigh is');
disp(weight)
D_P = sum([(Z - repmat(max(Z),n,1)) .^ 2 ] .* repmat(weight,n,1) ,2) .^ 0.5;   % D+ 与最大值的距离向量
D_N = sum([(Z - repmat(min(Z),n,1)) .^ 2 ] .* repmat(weight,n,1) ,2) .^ 0.5;   % D- 与最小值的距离向量
S = D_N ./ (D_P+D_N);    % 未归一化的得分
stand_S = S ./ sum(S);
stand_S = stand_S ./ max(stand_S);
disp('End of severity scoring')
disp(max(stand_S))

coord1 = [];
latlon1 = [];
stand_S1 =[];

for i = 1:length(stand_S)
    if stand_S(i) > 0
        stand_S1 = [stand_S1;stand_S(i)];
        latlon1 = [latlon1;latlon(i,:)];
        coord1 = [coord1;coord(i,:)];
    end
end
        
figure(1)
hold on
m_proj('Mercator','long',[144 152],'lat',[-39 -33]);
m_coast('patch',[1 .85 .7]);
m_grid('linestyle','none','linewidth',2,'tickdir','out','xaxisloc','bottom','yaxisloc','left','fontsize',12,'fontname','times new roman');
m_scatter(latlon1(:,2),latlon1(:,1),30, stand_S1,'filled', 'MarkerFaceColor', 'flat', 'MarkerEdgeColor', 'w','linewi',0.5) ;%画实心点图
hold off
contourcmap( 'jet', [0:0.1:1], 'colorbar', 'on','location', 'vertical', 'fontsize', 10,'fontname','times new roman');%显示图例
colormap(jet);

save ANALYSISDATA data_real coord latlon


