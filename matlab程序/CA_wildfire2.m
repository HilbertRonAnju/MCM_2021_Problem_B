%%
%元胞自动机，燃烧森林模型
% 2016/10/8
% 规则：
% (1)正在燃烧的树变成空格位；
% (2)如果绿树格位的最近邻居中有一个树在燃烧，则它变成正在燃烧的树
%     (对角线以sqrt(1/2)-0.5的概率引燃)；
% (3)在空格位，树以概率p生长；
% (4)在最近的邻居中没有正在燃烧的树的情况下树在每一时步以概率f(闪
%     电)变为正在燃烧的树。
% 参考文献:
% 祝玉学，赵学龙译，<<物理系统的元胞自动机模拟>>, p23
%%
close all;clc;clear;
figure;
s=300;   %树林大小
p=0.02;   % 概率p
f=1e-5; % 概率f
p_t=sqrt(1/2)-0.5;
set(gcf,'DoubleBuffer','on');
%S=round(rand(s)*2);
S=ones(s);
Sk=zeros(s+2);
Sk(2:s+1,2:s+1)=S;
ti=0;
%%
% 白色表示正在燃烧(S中等于2的位置)
% 灰色表示绿树(S中等于1的位置)
% 黑色表示空格位(S中等于0的位置)
C=zeros(s+2,s+2,3);
R=zeros(s);
G=zeros(s);
B=zeros(s);
R(S==2)=1;G(S==2)=1;B(S==2)=1;
R(S==1)=0.5;G(S==1)=0.5;B(S==1)=0.5;
C(2:s+1,2:s+1,1)=R;
C(2:s+1,2:s+1,2)=G;
C(2:s+1,2:s+1,3)=B;
Ci=imshow(C);
tp=title(['T = ',num2str(ti)]);
%%
while ti<=3000;
    ti=ti+1;
    St=Sk;
    %%
    St(Sk==2)=0; % for rule (1)
    %%
    Su=zeros(s+2);Sf=Sk;Sf(Sf<1.5)=0;Sf=Sf/2;
    Su(2:s+1,2:s+1)=Sf(1:s,2:s+1)+Sf(2:s+1,1:s)+...
        Sf(2:s+1,3:s+2)+Sf(3:s+2,2:s+1)+...
        Sf(1:s,1:s).*(rand(s)<p_t)+Sf(1:s,3:s+2).*(rand(s)<p_t)+...
        Sf(3:s+2,1:s).*(rand(s)<p_t)+Sf(3:s+2,3:s+2).*(rand(s)<p_t);
    St(Sk==1&Su>0.5)=2; % for rule (2)
    %%
    Se=zeros(s+2);Se(Sk==0)=1;
    St(2:s+1,2:s+1)=St(2:s+1,2:s+1)+Se(2:s+1,2:s+1).*(rand(s)<p);%for rule (3)
    %%
    Ss=zeros(s+2);Ss(Sk==1 & Su==0)=1;
    St(2:s+1,2:s+1)=St(2:s+1,2:s+1)+Ss(2:s+1,2:s+1).*(rand(s)<f);% for rule (4)
    %%
    Sk=St;
    S_nt=ones(size(Sk(2:end-1,2:end-1)));
    S_k=sum(sum(S_nt(Sk(2:end-1,2:end-1)==0)));
    S_c=sum(sum(S_nt(Sk(2:end-1,2:end-1)==1)));
    S_s=sum(sum(S_nt(Sk(2:end-1,2:end-1)==2)));
    list(ti,:)=[S_c,S_s,S_k];
    %%
    R=zeros(s+2);G=zeros(s+2);B=zeros(s+2);
    R(Sk==2)=1;G(Sk==2)=1;B(Sk==2)=1;
    R(Sk==1)=0.5;G(Sk==1)=0.5;B(Sk==1)=0.5;
    C(:,:,1)=R;C(:,:,2)=G;C(:,:,3)=B;
    set(Ci,'CData',C);
    %set(tp,'string',['T = ',num2str(ti)]);
    set(tp,'string',['T = ',num2str(ti),',存 = ',num2str(S_c),',烧 = ',num2str(S_s),',空 = ',num2str(S_k)]);
    pause(0.1);
end
%%
figure(2)
bar(list,'stacked','DisplayName','list');
legend('存','烧','空');
grid on;