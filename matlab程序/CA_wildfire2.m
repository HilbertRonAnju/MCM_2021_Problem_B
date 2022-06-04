%%
%Ԫ���Զ�����ȼ��ɭ��ģ��
% 2016/10/8
% ����
% (1)����ȼ�յ�����ɿո�λ��
% (2)���������λ������ھ�����һ������ȼ�գ������������ȼ�յ���
%     (�Խ�����sqrt(1/2)-0.5�ĸ�����ȼ)��
% (3)�ڿո�λ�����Ը���p������
% (4)��������ھ���û������ȼ�յ��������������ÿһʱ���Ը���f(��
%     ��)��Ϊ����ȼ�յ�����
% �ο�����:
% ף��ѧ����ѧ���룬<<����ϵͳ��Ԫ���Զ���ģ��>>, p23
%%
close all;clc;clear;
figure;
s=300;   %���ִ�С
p=0.02;   % ����p
f=1e-5; % ����f
p_t=sqrt(1/2)-0.5;
set(gcf,'DoubleBuffer','on');
%S=round(rand(s)*2);
S=ones(s);
Sk=zeros(s+2);
Sk(2:s+1,2:s+1)=S;
ti=0;
%%
% ��ɫ��ʾ����ȼ��(S�е���2��λ��)
% ��ɫ��ʾ����(S�е���1��λ��)
% ��ɫ��ʾ�ո�λ(S�е���0��λ��)
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
    set(tp,'string',['T = ',num2str(ti),',�� = ',num2str(S_c),',�� = ',num2str(S_s),',�� = ',num2str(S_k)]);
    pause(0.1);
end
%%
figure(2)
bar(list,'stacked','DisplayName','list');
legend('��','��','��');
grid on;