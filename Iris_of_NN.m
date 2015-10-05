function Iris_of_NN
loadData;

% normalize
[train_x, mu, sigma] = zscore(train_x);

%% split training data into training and validation data
vx   = train_x(1:8709,:);
tx = train_x(8710:end,:);
vy   = train_y(1:8709,:);
ty = train_y(8710:end,:);

rand('state',0)
nn                      = nnsetup([64 16 4 16 64]);     
nn.output               = 'sigm';                   %  use softmax output
opts.numepochs          = 5;                           %  Number of full sweeps through data
opts.batchsize          = 100;                        %  Take a mean gradient step over this many samples
opts.plot               = 1;                           %  enable plotting
nn = iris_of_nntrain(nn, tx, ty, opts, vx, vy);                %  nntrain takes validation set as last two arguments (optionally)

%[er, bad] = nntest(nn, test_x, test_y);
%assert(er < 0.1, 'Too big error');
