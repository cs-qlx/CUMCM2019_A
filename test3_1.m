%% 遍历喷油嘴开启时间间隔及角速度得到最优解
function [y1,y2,y3,z]=test3_1(A)
z=test3(A,0);
for t=1:100
    [temp]=test3(A,t);
    z=[z,temp];
end
[m,n]=min(z(2,:));
y1=m;
y3=n;
y2=z(1,n);
