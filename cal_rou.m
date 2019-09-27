%% 计算燃油密度与压强的关系
function [p,k]=cal_rou
%% 数据的初始化
p(1,1)=100;
p(2,1)=0.85;
dp=0.01;    
num=(160-100)/dp;
for i=1:num
%% 递推求得100MPa到160MPa压强
    E=645.4*exp(0.00671*p(1,i))+905.6;
    drou=p(2,i)/E*dp;
    p(2,i+1)=p(2,i)+drou;
    p(1,i+1)=p(1,i)+dp;
end
%% 递推求得0到100MPa的压强
num2=100/dp;
k(1,1)=100;
k(2,1)=0.85;
for i=1:num2
    E=645.4*exp(0.00671*k(1,i))+905.6;
    drou=k(2,i)/E*dp;
    k(2,i+1)=k(2,i)-drou;
    k(1,i+1)=k(1,i)-dp;
end
