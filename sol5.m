%% 计算5s到达稳定时的单向阀开启时长
function [tao,z]=sol5
flag=1;
tao=0;
k=1;
while flag==1
    [p,~]=module(100,0.85,5000,tao);
    if p(1,500000)>=150                              %循环找到5s时高压油管压强达到150MPa的最短单向阀开启时长
        flag=0;
    end
    tao=tao+0.01
end
for x=0:0.01:1
    [p,result]=module(150,0.8679,1000,x);
    y(k)=result;                                     %找到5s后使得高压油管稳定在150MPa的单向阀开启时长
    k=k+1;
end
[~,z]=min(y);
z=z*0.01;
[p1,~]=module(100,0.85,5000,tao);                     %作图
[p2,~]=module(150,0.8679,2000,tao);
p=[p1(1,:),p2(1,:)];
plot(p);

