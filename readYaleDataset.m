function readYaleDataset(dataDir , saveName) %
    dirs = dir(dataDir);  
    data = [];  
    labels = [];  
    for i = 3:numel(dirs)  
        imgDir = dirs(i).name;  
        imgDir = fullfile(dataDir, imgDir);  
        imgList = dir(fullfile(imgDir, '*.pgm'));  % 65个
        for j = 1:20  %numel(imgList)，每个数据集里只取20张图片  
            imgName = imgList(j).name;  
            if strcmp('Ambient.pgm',  imgName(end-10:end))  
                continue;  
            end  
            im = imread(fullfile(imgDir, imgName));  
            if size(im, 3) ==3  
                im = rgb2gray(im);  
            end  
            im = imresize(im, [32 32]);  
            im = reshape(im, 32*32, 1);  
            data = [data im];  
        end  
        labels = [labels ones(1, 20-1) * (i-2)];  
%     disp('success');
    end  
    disp('all images are saved');
    save(saveName, 'data', 'labels');  
end  