function nn = iris_of_train(N, trainNum)
flag = 0;

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
for ii = 1:trainNum
    train_x = double(imread([xDir xName{ii,:}]))/255;
    train_x = split(train_x,N(1));
    train_y = double(imread([yDir yName{ii,:}]))/255;
    train_y = split(train_y,N(1));
    % normalize
    [train_x, mu, sigma] = zscore(train_x);
    if flag == 0
        rand('state',0)
        nn = nnsetup(N);
        nn.activation_function = 'sigm';    %  Sigmoid activation function
        nn.learningRate = 0.5;                %  Sigm require a lower learning rate
        opts.numepochs =  50;               %  Number of full sweeps through data
        %opts.batchsize = size(train_x,1)/trainNum;               %  Take a mean gradient step over this many samples
        opts.batchsize = 353;           % if input patch size is 64
        %opts.batchsize = 345;           % if input patch size is 256
        %opts.batchsize = 329;           % if input patch size is 1024
        nn = nntrain(nn, train_x, train_y, opts);
    else
        nn = nntrain(nn, train_x, train_y, opts);
    end 
end