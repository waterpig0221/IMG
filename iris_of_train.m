function nn = iris_of_train(N, trainNum)

% train_x = double(train_x) / 255;
% test_x  = double(test_x)  / 255;
% train_y = double(train_y);
% test_y  = double(test_y);

% load Data
load DataName;
if size(xName,1) ~= trainNum
    xName = xName(1:trainNum,:);
    yName = yName(1:trainNum,:);
end
train_x = [];
train_y = [];
for ii = 1:trainNum
    im = double(imread([xDir xName{ii,:}]))/255;
    im = split(im,N(1));
    train_x = [train_x ;im];
    im = double(imread([yDir yName{ii,:}]))/255;
    im = split(im,N(1));
    train_y = [train_y ;im];
end
% test_x = train_x;
% test_y = train_y;

% normalize
[train_x, mu, sigma] = zscore(train_x);
% test_x = normalize(test_x, mu, sigma);

rand('state',0)
nn = nnsetup(N);

nn.activation_function = 'sigm';    %  Sigmoid activation function
nn.learningRate = 1;                %  Sigm require a lower learning rate
opts.numepochs =  50;               %  Number of full sweeps through data
opts.batchsize = size(train_x,1)/trainNum;               %  Take a mean gradient step over this many samples

nn = nntrain(nn, train_x, train_y, opts);

% [er, bad] = nntest(nn, test_x, test_y);
% assert(er < 0.1, 'Too big error');