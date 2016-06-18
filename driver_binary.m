load Data\mnist_uint8.mat
train_x=double(train_x);
train_y=double(train_y);
test_x=double(test_x);
test_y=double(test_y);

class4=4;

%training data
class4_inds=find(train_y(:,class4)==1);
X=double(train_x(class4_inds,:));
X = X';
[evecs,evals]=compute_pca(X);




