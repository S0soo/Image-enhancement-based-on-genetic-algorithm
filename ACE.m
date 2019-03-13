clc;
clear;
%% ����ͼ��
img = imread('1.jpg');
[m,n,index] = size(img);
% C = 10;
%% ��ͨ�˲����� 
GS = fspecial('gaussian', [5 5], 2);
img2 = imfilter(img,GS,'same');
%% ��Ƶ�ɷ�
I_H = double(img) - double(img2);
%% �Ŵ��㷨
f = @(C) psnr(double(img) + cg(I_H,50)+C*(I_H-cg(I_H,50)),double(img));
C = ga(f,1,[],[],[],[],1,2);
%% ͼ����ǿ
ME = cg(I_H,50);
I_HE =ME + C*(I_H-ME); %I_HE = cg(I_H,50)+C*(I_H-ME)
img_f = double(img) + I_HE; %img_f = double(img) + cg(I_H,50)+C*(I_H-ME)
img_r = uint8(img_f);
PS = psnr(img,img_r)
%% ���ͼ��
figure(100)
imshow([img img_r]);
title(['ԭʼͼ��','��ǿͼ��']);
% imshow(img_r)

%ԭʼͼ��
figure(200)
subplot(231)
imshow(img(:,:,1))
title('ԭʼR')
subplot(234)
imhist(img(:,:,1))
title('ԭʼR')

subplot(232)
imshow(img(:,:,2))
title('ԭʼG')
subplot(235)
imhist(img(:,:,2))
title('ԭʼG')

subplot(233)
imshow(img(:,:,3))
title('ԭʼB')
subplot(236)
imhist(img(:,:,3))
title('ԭʼB')

%��ǿͼ��
figure(300)
subplot(231)
imshow(img_r(:,:,1))
title('��ǿR')
subplot(234)
imhist(img_r(:,:,1))
title('��ǿR')

subplot(232)
imshow(img_r(:,:,2))
title('��ǿG')
subplot(235)
imhist(img_r(:,:,2))
title('��ǿG')

subplot(233)
imshow(img_r(:,:,3))
title('��ǿB')
subplot(236)
imhist(img_r(:,:,3))
title('��ǿB')
