function ME = cg(img,T)
%x ����ͼ��
%T ���ڴ�С
[m,n,index] = size(img);
ME = zeros(m,n,index);
K = T;
for k = 1:index
    for i = 1:m
        for j = 1:n
            itu = 0;
            for z = (i+K):(i-K)
                for x = (j+K):(j-K)
                itu = itu + img(z,x,k);
                end
            end
            ME(i,j,k) = (1/((2*T+1).^2)).*itu;
        end
    end
end

