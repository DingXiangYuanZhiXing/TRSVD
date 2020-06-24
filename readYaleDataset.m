function [data, labels]=readYaleDataset(dataDir,l,readnum,n) 
% Read images from YaleDataset 
% Input:
%   dataDir - path
%   l,n - each image is a l*n matrix
%   readnum - the number of images to read in each folder
% Output:
%   data - l*N*n tensor
%   labels - N*1 vector
dirs = dir(dataDir);
N = readnum*(numel(dirs)-2);
disp(N);
data = zeros(l,N,n);  
labels = [];  
num=1;
for i = 3:numel(dirs)  
    imgDir = dirs(i).name;  
    imgDir = fullfile(dataDir, imgDir);  
    imgList = dir(fullfile(imgDir, '*.pgm')); 
    for j = 1:readnum  
        imgName = imgList(j).name;  
        if strcmp('Ambient.pgm',  imgName(end-10:end))  
            continue;  
        end  
        im = imread(fullfile(imgDir, imgName));  
        if size(im, 3) ==3  
            im = rgb2gray(im);  
        end  
        im = imresize(im, [32 32]);  
        data(:,num,:) = im;  
        num=num+1;
    end  
    labels = [labels ones(1, readnum) * (i-2)];  
end
end