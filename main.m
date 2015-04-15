% %Data will be loaded into X, y
load('ex6data1.mat');

y(y==0) = -1;

d = X;
model = svmtrain2(y,X,'-t 0');

figure
axis equal;
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

%Plot w vector
w = model.SVs' * model.sv_coef;
b = -model.rho;

if model.Label(1) == -1
  w = -w;
  b = -b;
end

line([0,w(1)]+1.9225,[0,w(2)]+3.4225);
%plot(w);

% now plot decision area
[xi,yi] = meshgrid([-2:0.01:6],[-1:0.01:6]);
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


