function [X, Y, theta] = data_generate_nonlinear(s, p, n, sigma)
%Data Generation for high dimensional sparse linear regression
%Input:
%     s is the sparsity of the variable theta.
%     p is the dimensionality of the each x_i.
%     f_0 is the oversampling rate of the data size n.
%     sigma is the noise level.
%Output:
%     X is a n*p matrix.
%     Y is a p*1 response vector, where y_i=<x_i,theta>+sigma_i
%     theta is the vector we want to estimate.


X = (rand( n , p) < 0.5 )*2-1; %generate X

theta_1 = rand( p , 1);

[~, sortind] =  sort(theta_1,'descend');

theta_1(sortind(s+1:end,:)) =   0;

theta = theta_1;

noise = rand( n , 1 )*2*sigma-sigma;

Y = 2*X*theta+ arrayfun(@cos,X*theta) + noise; 

end


