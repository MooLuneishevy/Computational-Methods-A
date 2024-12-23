function [x]=Gausscolumn(A,b)
    [size_i,size_j]=size(A);
    for j=1:size_i
        [posi_x,posi_y]=max(abs(A(j:size_i,j)));
        posi_y=posi_y+j-1;
        A([posi_y,j],:)=A([j,posi_y],:);
        b([posi_y,j])=b([j,posi_y]);
        for i=j+1:size_i
            d=-A(i,j)/A(j,j);
            A(i,:)=A(i,:)+d*A(j,:);
            b(i)=b(i)+d*b(j);
        end
    end
    x=zeros(size_i,1);
    x(size_i)=b(size_i)/A(size_i,size_i);
    for i=size_i-1:-1:1
        x(i)=(b(i)-sum(x(i+1:size_i).*A(i,i+1:size_i)'))/A(i,i);
    end
end
function RandomPerturbation(A,b)
    [size_i,size_j]=size(A);
    prex=Gausscolumn(A,b);
    norm_b=norm(b);
    norm_prex=norm(prex);
    axis_1=zeros(100,1);
    axis_2=zeros(100,1);
    for i=1:100
        delta=rand(size_i,1)-0.5;
        x=Gausscolumn(A,b+delta);
        axis_1(i)=norm(x-prex)/norm_prex;
        axis_2(i)=norm(delta)/norm_b;
    end
    plot(axis_1,axis_2,'bo');
    conf=norm(A)*norm(A^-1);
    hold;
    max_x=max(axis_1);
    max_y=max(axis_2);
    plot([0,max_x],[0,max_y*conf],'-r*');
    xlabel('delta of b');
    ylabel('delta of x');
    title('exp2');
    grid on;
end