function [ optRate, optThreshold ] = findOpt(nn, upThreshold, lowerThreshlod , inc)
%Find optimal mask threshlod
%nn �O�w�g�V�m�����Ѽ�
%upThreshold �O�j�M�W��
%lowerThreshold �O�j�M�U��
%inc �O���W�q

% run test
load TestDataName.mat
threshold = lowerThreshlod:inc:upThreshold;
optRate = 0;
optThreshold = 0;

for i=1:size(threshold,2)
    sum = 0;
    for j=1:size(xName,1)
        j;
        str = strcat(xDir,xName{j});
        str2 = strcat(yDir,yName{j});
        im = imread(str);
        im2 = imread(str2);
        correct = iris_mask_test(nn,im,im2, 16,threshold(i));
        sum = sum + correct;
    end
    avg = sum/size(xName,1);
    if avg > optRate
        optThreshold = threshold(i);
        optRate = avg;
    end
end
end

