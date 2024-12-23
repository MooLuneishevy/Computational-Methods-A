function [y]=IterPoint(x0,func,Iter_inf,err_inf)
    xi=x0;
    fprintf('X0 : %16.14f\n',x0);
    fxi=func(xi);
    fprintf('Iter 1 : %16.14f\n',fxi);
    xi=fxi;
    Iter=1;
    while(Iter_inf>Iter)
        fxi=func(xi);
        err=abs(fxi-xi);
        xi=fxi;
        Iter=Iter+1;
        fprintf('Iter %2.0d : %16.14f\n',Iter,fxi);
        if(err<err_inf)
            break;
        end
    end
    y=Iter;
end

x=(1.6:0.1:2.5);
Iter_times=zeros(10,1);
for i=1:10
    xi=x(i);
    Iter_times(i)=IterPoint(xi,@f1,1000,1e-5);
end
max_Iter=max(Iter_times);
if(max_Iter!=1000)
    plot(x,Iter_times,'y');
    hold on;
end
for i=1:10
    xi=x(i);
    Iter_times(i)=IterPoint(xi,@f2,1000,1e-5);
end
max_Iter=max(Iter_times);
if(max_Iter!=1000)
    plot(x,Iter_times,'g');
    hold on;
end
for i=1:10
    xi=x(i);
    Iter_times(i)=IterPoint(xi,@f3,1000,1e-5);
end
max_Iter=max(Iter_times);
if(max_Iter!=1000)
    plot(x,Iter_times,'b');
    hold on;
end
for i=1:10
    xi=x(i);
    Iter_times(i)=IterPoint(xi,@f4,1000,1e-5);
end
max_Iter=max(Iter_times);
if(max_Iter!=1000)
    plot(x,Iter_times,'r');
    hold on;
end
xlabel('xi');
ylabel('Iter_times');
title('exp3-t1');
ylim([0 50]);
xlim([1.6 2.5]);
grid on;

function [y]=f1(x)
    y=(x^2+2)/3;
end

function [y]=f2(x)
    y=sqrt(3*x-2);
end

function [y]=f3(x)
    y=3-2/x;
end

function [y]=f4(x)
    y=(x^2-2)/(2*x-3);
end