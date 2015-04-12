%Data will be loaded into X, y
load('ex6data1.mat');

graph(X,y);

y(y==0) = -1;
visualizeBoundaryLinear(X,y,fitcsvm(X,y))

