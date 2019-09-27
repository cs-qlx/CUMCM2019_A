%% 遍历角速度，得到对应开启时间间隔下的最优角速度
function [z]=test3(A,t)
k=1;
for w=0:0.01:1
    [~,result]=module3(t,w,A);
    y(k)=result;
    k=k+1;
end
[m,n]=min(y);
z(1,1)=0.01+n*0.001;
z(2,1)=m;
