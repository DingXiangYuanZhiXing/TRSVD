function [m]=mean(X)
    train_num=size(X,2); %ÑµÁ·Í¼Æ¬µÄÊýÄ¿
    row=size(X,1);
    column=size(X,3);
    sum=zeros(row,column);
    for i=1:train_num 
        image=reshape(X(:,i,:),[row,column]);
        sum=sum+image;
    end
    m=sum/train_num; % mean image
end