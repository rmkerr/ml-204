%Data will be loaded into X, y
load('ex6data1.mat');

graph(X,y);

y(y==0) = -1;

model = svmtrain(X,y,'Showplot',true);
svmclassify(model,X,'Showplot',true)

