%% 计算引入减压阀前后对高压油管稳定性的影响
function [result]=final_test(A)
i=1;
for d=0.1:0.1:5
    j=1;
    for w=0:0.01:1
[~,sum1]=module3_2(A,w,50.1,100-d,100+d);
[~,sum2]=module3(50.1,w,A);
result(i,j)=sum1-sum2;
j=j+1;
    end
    i=i+1;
end
