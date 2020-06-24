function [A]=meandeviation(L)
    m=mean(L);
    train_num=size(L,2); %ÑµÁ·Í¼Æ¬µÄÊýÄ¿
    row=size(L,1);
    column=size(L,3);
    A=zeros(row,train_num,column);
    for i=1:train_num;
       A(:,i,:) = L(:,i,:)-reshape(m,row,1,column); 
    end
end