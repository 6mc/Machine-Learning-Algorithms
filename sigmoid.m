function [g] = sigmoid(z)
%UNTÝTLED2 Summary of this function goes here
%   Detailed explanation goes here
g=zeros(size(z));
g=1.0./(1.0+exp(-z));
end

