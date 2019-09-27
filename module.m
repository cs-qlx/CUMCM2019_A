%% 计算不同单向阀开启时长高压油管压强随时间变化及稳定性
function [p,sum]=module(p0,rou0,th,tao)
%输入参数：高压油管初始压强p0，密度rou0，经历时间th，单向阀开启时间tao
rou=0.8711; %160MPa燃油密度
A=pi*0.7^2;
dt=0.01;
p(1,1)=p0;
p(2,1)=rou0;
V=pi*5^2*500;
C=0.85; 
num=th/dt; %遍历步数
for i=1:num-1
    m=mod((i-1)*dt,100);   %确定喷油嘴所处工作状态
    n=mod((i-1)*dt,tao+10);      %确定单向阀所处工作状态
    if m>=0&&m<=0.2
        dQ2=m*100*dt;          %喷油嘴喷油速率上升
        dm2=dQ2*p(2,i);
    end
    if m>0.2&&m<=2.2
        dQ2=20*dt;              %喷油嘴喷油速率达到最大且保持不变
        dm2=dQ2*p(2,i);
    end
    if m>2.2&&m<=2.4
        dQ2=(20-(m-2.2)*100)*dt;        %喷油嘴喷油速率逐渐降低
        dm2=dQ2*p(2,i);
    end
    if m>2.4&&m<100
        dQ2=0;                         %喷油嘴进入休息状态
        dm2=dQ2*p(2,i);
    end
    if n>=0&&n<=tao
        dQ1=C*A*sqrt(2*(160-p(1,i))/rou)*dt;       %单向阀处于开启时间
        dm1=dQ1*rou;
    end
    if n>tao&&n<=tao+10
        dQ1=0;                          %单向阀处于时长为10ms的关闭状态
        dm1=dQ1*rou;
    end
     dm=dm1-dm2;                        %计算高压管内燃油质量差，密度差
    drou=dm/V;
    E=645.4*exp(0.00671*p(1,i))+905.6;     %计算弹性模量
    dp=drou/p(2,i)*E;
    p(2,i+1)=p(2,i)+drou;                  %更新下一时刻高压油管压强与密度
    p(1,i+1)=p(1,i)+dp;
end
sum=var(p(1,:));                           %记录该参数下的高压油管压强波动方差
