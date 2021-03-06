function [U1,Y,error]=Power(A,U)
for j=1:101
    xx=-4+(j-1)*0.08;
    x(j)=xx;
    p2(j)=100*xx*xx-200*xx;
end
plot(x,p2)
A=[-1 -1/2 0; -1/2 -1 2; 0 2 -1];
U=[1 1 1];

%%  Power method for estimating the largest eigenvalue
%%   A is the matrix and U is an initial Guess
%%
Nmax=100;
%% 
for k=1:Nmax
 Unew=A*U;
 [c,i]=max(abs(Unew));
 Umax=Unew(i);
 U=Unew/Umax;
 Test=A*U-Umax*U;
end
Unorm=U'*U;
Unorm=sqrt(Unorm);
U1=U/Unorm;
 Y=Umax;
 error=norm(Test);
end   