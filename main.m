% %Data will be loaded into X, y
load('ex6data1.mat');

y(y==0) = -1;

d = X;

figure

% plot training data
hold on;
pos = find(y==1);
scatter(X(pos,1), X(pos,2), 'r')
pos = find(y==-1);
scatter(X(pos,1), X(pos,2), 'b')

% now plot support vectors
hold on;
sv = full(model.SVs);
plot(sv(:,1),sv(:,2),'ko');

% now plot decision area
[xi,yi] = meshgrid([min(X(:,1)):0.01:max(X(:,1))],[min(X(:,2)):0.01:max(X(:,2))]);
dd = [xi(:),yi(:)];
[predicted_label, accuracy, decision_values] = svmpredict(zeros(size(dd,1),1), dd, model);
pos = find(predicted_label==1);
hold on;
redcolor = [1 0.8 0.8];
bluecolor = [0.8 0.8 1];
h1 = plot(dd(pos,1),dd(pos,2),'s','color',redcolor,'MarkerSize',10,'MarkerEdgeColor',redcolor,'MarkerFaceColor',redcolor);
pos = find(predicted_label==-1);
hold on;
h2 = plot(dd(pos,1),dd(pos,2),'s','color',bluecolor,'MarkerSize',10,'MarkerEdgeColor',bluecolor,'MarkerFaceColor',bluecolor);
uistack(h1, 'bottom');
uistack(h2, 'bottom');