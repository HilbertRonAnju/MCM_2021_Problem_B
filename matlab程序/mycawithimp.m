%0为空�?
%1为燃烧的�?
%2为正常的�?
clc;
clear;
a = 500; %构�?�森林大�?
b = 400;
burn = 0.7919;
k = 0.005;
veg = 5*ones(a,b);
imh = image(cat(3,veg,veg,veg));
W = fspecial('gaussian',[51,51],0.9); 
vegpast = zeros(a,b);
% veg = empty=0 burning=1-4 green=5
vegimp = zeros(a,b);
veg(a/2:a/2+1,b/2:b/2+1)=[4 4;4 4];
burnresult = zeros(a,b,5);
burnresult10_8 = zeros(10,8,5);

for turn = 1:5
        veg = 5*ones(a,b);
        veg(a/2:a/2+1,b/2:b/2+1)=[4 4;4 4];
    for i=1:1000 %循环
        %观察每一个空位其上下左右邻居正在燃烧的树的个数（sum�?300*300矩阵，每�?个�?�对应森林的每一个空位）
        vegpast = veg;
        vegavg = imfilter(double(veg<5&veg>1), W, 'replicate');
        %现存的树=�?-被烧毁的�?+新生的树
         veg = veg - 1 + (veg==5) + (veg==0) + (veg<0) ...
         - ((veg==5).*vegavg / burn >= rand(a,b) ) ...
         - 5*((1<veg&veg<5).*rand(a,b) > exp(-k*i));
        set(imh, 'cdata', cat(3,(1<veg&veg<5),(veg==5),zeros(a,b)));%画图;
        drawnow
        vegimp = vegimp + (veg <= 0);
        if sum(sum((vegpast==5) == (veg==5))) == a * b
            break;
        end
    end

    sum(sum((vegpast==0)))
    burnresult(:,:,turn) = vegimp;
    % set(imh, 'cdata', cat(3,1-vegimp/i,1-vegimp/i,1-vegimp/i));%画图;
    % drawnow

    result = zeros(10,8);
    xstart = 100;
    ystart = 75;
    for x = 1:10
        for y = 1:8
            for i = 1:25
                for j = 1:25
                    result(x,y) = result(x,y) + vegimp(xstart+x*25+i,ystart+y*25+j);
                end
            end
        end
    end
    result = result / max(max(result));
    %image(cat(3,result,result,result));
    %drawnow
    burnresult10_8(:,:,turn) = result
end


