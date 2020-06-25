function [data, labels]=readForTensorFace(dataDir,l,readnum,n) 
% Read images from YaleDataset For TensorFace
% Input:
%   dataDir - path
%   l,n - each image is a l*n matrix
%   readnum - the number of images to read in each folder
% Output:
%   data - P*V*I*E*pix tensor
%   labels - 1*N vector

% dataDir='E:\matlab³ÌÐò\CroppedYale';
% l=32;
% readnum=5;
% n=32;
dirs = dir(dataDir);
N = readnum*(numel(dirs)-2);
labels = [];  
num=1;
b=[];
p=[];
a=[];
e=[];
for i = 3:numel(dirs)  
    imgDir = dirs(i).name;  
    imgDir = fullfile(dataDir, imgDir);  
    imgList = dir(fullfile(imgDir, '*.pgm')); 
    for j = 1:readnum  
        imgName = imgList(j).name;  
        if strcmp('Ambient.pgm',  imgName(end-10:end))  
            continue;  
        end  
        b=unique([b str2num(imgName(6:7))]);
        p=unique([p str2num(imgName(10:11))]);
        a=unique([a str2num(imgName(13:16))]);
        e=unique([e str2num(imgName(18:20))]);
    end  
end

P=length(b);
V=length(p);
I=length(a);
E=length(e);
pix=l*n;
L=zeros(P,V,I,E,pix);
data = tenzeros([P V I E pix]);
for i = 3:numel(dirs)  
    imgDir = dirs(i).name;  
    imgDir = fullfile(dataDir, imgDir);  
    imgList = dir(fullfile(imgDir, '*.pgm')); 
    for j = 1:readnum  
        imgName = imgList(j).name;  
        if strcmp('Ambient.pgm',  imgName(end-10:end))  
            continue;  
        end  
        idx1=find(b==str2num(imgName(6:7)));
        idx2=find(p==str2num(imgName(10:11)));
        idx3=find(a==str2num(imgName(13:16)));
        idx4=find(e==str2num(imgName(18:20)));
        im = imread(fullfile(imgDir, imgName));  
        if size(im, 3) ==3  
            im = rgb2gray(im);  
        end  
        im = imresize(im, [32 32]);
        L(idx1,idx2,idx3,idx4,:)=im(:);

    end  
    labels = [labels ones(1, readnum) * (i-2)];  
end
data=tensor(L);
end
