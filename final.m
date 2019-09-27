%% 计算某一角速度和某一喷油嘴开启时间间隔下的高压油管压强随时间波动方差
function [x,y]=final(A)
i=1;
j=1;
for w=0:0.01:1
    j=1;
    for t=0:100
        [~,~,x(i,j)]=module3_2(A,w,t);
        j=j+1;
    end
    i=i+1;
end
i=1;
j=1;
for w=0:0.01:1
    j=1;
    for t=0:100
        [~,y(i,j)]=module3(t,w,A);
        j=j+1;
    end
    i=i+1;
end


