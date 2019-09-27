%% 遍历角速度得到稳定在100MPa下的最优角速度
function [y]=test2(needle_A)
k=1;
for w=0:0.001:0.06
    [~,result]=module2(w,needle_A);
    y(k)=result;
    k=k+1;
end
