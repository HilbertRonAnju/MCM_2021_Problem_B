%0为空位
%1为燃烧的树
%2为正常的树
a = 500; %构造森林大小
b = 400;
% burn = 0.95;
k = 0.006;
veg = 5*ones(a,b);
imh = image(cat(3,veg,veg,veg));
W = fspecial('gaussian',[51,51],1); 
vegpast = zeros(a,b);
% veg = empty=0 burning=1-4 green=5
resultmat = zeros(5,25);
for burn = 0.7:0.01:0.95
    for turn = 1:5
        veg=5*ones(a,b);%森林
        veg(a/2:a/2+1,b/2:b/2+1)=[4 4;4 4];
        for i=1:1000 %循环
            %观察每一个空位其上下左右邻居正在燃烧的树的个数（sum为300*300矩阵，每一个值对应森林的每一个空位）
            vegpast = veg;
            vegavg = imfilter(double(veg<5&veg>1), W, 'replicate');
            %现存的树=树-被烧毁的树+新生的树
             veg = veg - 1 + (veg==5) + (veg==0) + (veg<0) ...
             - (veg==5).*(vegavg * burn>= rand(a,b)) ...
             - 5*((1<veg&veg<5).*rand(a,b) > exp(-k*i));
            %现存的树=树-被烧毁的树+新生的树
            veg = veg - 1 + (veg==5) + (veg==0) - (veg==5).*(vegavg * burn>=rand(a,b));
            %set(imh, 'cdata', cat(3,(1<veg&veg<5),(veg==5),zeros(a,b)));%画图;
            %drawnow
            if sum(sum((vegpast==5) == (veg==5))) == a * b
                break;
            end
        end
        resultmat(turn,int16(100*burn-69)) = a*b-sum(sum((veg==5)));
    end
end


