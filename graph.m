function [  ] = graph( X, y )
%GRAPH Summary of this function goes here
%   Detailed explanation goes here
    pos_examples = X(y==1,:);
    neg_examples = X(y==0,:);
    scatter(pos_examples(:,1),pos_examples(:,2));
    hold on;
    scatter(neg_examples(:,1),neg_examples(:,2));
    hold off;
end

