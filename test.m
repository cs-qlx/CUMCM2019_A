%% 遍历单向阀开启时长确定最优开启时长
function [y]=test
k=1;
for tao=0:0.001:0.7
    [p,result]=module(100,0.85,1000,tao);
    y(k)=result;
    k=k+1;
end
