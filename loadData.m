patchCount = 1;
input = imread('s1_1.bmp');
groundtruth = imread('oc1_1.bmp');
train_y = zeros(64,18709);
train_x = zeros(64,18709);
for j=1:53
    for k=1:353
        t = input(j:j+7,k:k+7);
        train_x(:,patchCount) = double(t(:));
        t = groundtruth(j:j+7,k:k+7);
        train_y(:,patchCount) = double(t(:))/255;
        patchCount = patchCount + 1;
    end
end
train_x = train_x';
test_x = train_x;
train_y = train_y';
test_y = train_y;