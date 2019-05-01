function [Problem] = sigmoid_regression(x_train, y_train, x_test, y_test, varargin)
% This file defines logistic regression (binary classifier) problem
%
% Inputs:
%       x_train     train data matrix of x of size dxn.
%       y_train     train data vector of y of size 1xn.
%       x_test      test data matrix of x of size dxn.
%       y_test      test data vector of y of size 1xn.
%       lambda      l2-regularized parameter. 
% Output:
%       Problem     problem instance. 
%
%
% The problem of interest is defined as
%
%           min f(w) = 1/n * sum_i^n f_i(w),           
%           where 
%           f_i(w) = 1 + exp(-y_i' .* (w'*x_i)) + lambda/2 * w^2.
%
% "w" is the model parameter of size d vector.
%
%
% This file is part of GDLibrary and SGDLibrary.
%
% Created by H.Kasai on Feb. 17, 2016
% Modified by H.Kasai on Mar. 16, 2017


    if nargin < 5
        lambda = 0.01;
    else
        lambda = varargin{1};
        display(lambda);
    end

    d = size(x_train, 1);
    n_train = length(y_train);
    n_test = length(y_test);      
    
    Problem.name = @() 'sigmoid_regression';    
    Problem.dim = @() d;
    Problem.samples = @() n_train;
    Problem.lambda = @() lambda;
    Problem.classes = @() 2;  
    Problem.hessain_w_independent = @() false;
    Problem.x_norm = @() sum(x_train.^2,1);
    Problem.x = @() x_train;

    Problem.cost = @cost;
    function f = cost(w)
        %f_old = sum(log(1+exp(-y_train.*(w'*x_train)))/n_train,2)+ lambda * (w'*w) / 2; %is replaced below 
        % becasuse log(sigmoid(a)) = log(1/(1+exp(-a))) = log1 - log(1+exp(-a)) = -log(1+exp(-a)).
        %f = -sum(log(sigmoid(y_train.*(w'*x_train)))/n_train,2) + lambda * (w'*w) / 2;
        f = sum(sigmoid(y_train.*(w'*x_train)),2)/n_train + lambda * (w'*w) / 2;
    end

    Problem.cost_batch = @cost_batch;
    function f = cost_batch(w, indices)
        
        f = sum(sigmoid(y_train(indices).*(w'*x_train(:,indices)))/n_train,2) + lambda * (w'*w) / 2;
        
    end

    Problem.grad = @grad;
    function g = grad(w, indices)
        
        % org code
        % g = -sum(((ones(d,1) * (sigmoid(-y_train(indices).*(w'*x_train(:,indices))) .* y_train(indices))) .* x_train(:,indices))/length(indices),2) + lambda * w;
        %
        % (log(1+exp(-y_train.*(w'*x_train)))' = -y_train.*x_train * (exp(-y_train.*(w'*x_train))/(1+exp(-y_train.*(w'*x_train))))
        %   = -y_train.*x_train * (1 - sigmoid(y_train.*(w'*x_train)))
        % or
        % (log(sigmoid(y_train.*(w'*x_train)))' = y_train.*x_train * 1/sigmoid(y_train.*(w'*x_train)) * (sigmoid(y_train.*(w'*x_train)))'
        %   = y_train.*x_train * 1/sigmoid(y_train.*(w'*x_train)) * (- sigmoid(y_train.*(w'*x_train)) * (1 - sigmoid(y_train.*(w'*x_train))))
        %   = -y_train.*x_train * (1 - sigmoid(y_train.*(w'*x_train)))
        %g_old = -sum(ones(d,1) * y_train(indices).*x_train(:,indices) * (ones(1,length(indices))-sigmoid(y_train(indices).*(w'*x_train(:,indices))))',2)/length(indices)+ lambda * w;
        
        e = exp(-1*y_train(indices)'.*(x_train(:,indices)'*w));
        s = e./((1+e).^2);
        g = -(1/length(indices))*((s.*y_train(indices)')'*x_train(:,indices)')';
        g = full(g)+ lambda * w;
        
    end

    Problem.full_grad = @full_grad;
    function g = full_grad(w)
        
        %g = -sum(ones(d,1) * y_train.*x_train * (ones(1,n_train)-sigmoid(y_train.*(w'*x_train)))',2)/n_train+ lambda * w;
        g = grad(w, 1:n_train);
    end

  
    Problem.prediction = @prediction;
    function p = prediction(w)
        
        p = sigmoid(w' * x_test);
        
        class1_idx = p>0.5;
        class2_idx = p<=0.5;         
        p(class1_idx) = 1;
        p(class2_idx) = -1;         
        
    end

    Problem.accuracy = @accuracy;
    function a = accuracy(y_pred)
        
        a = sum(y_pred == y_test) / n_test; 
        
    end

    Problem.calc_solution = @calc_solution;
    function w_opt = calc_solution(problem, maxiter, method)
        
        if nargin < 3
            method = 'sg';
        end        
        
        options.max_iter = maxiter;
        options.verbose = true;
        options.tol_optgap = 1.0e-24;
        options.tol_gnorm = 1.0e-16;
        options.step_alg = 'backtracking';
        
        if strcmp(method, 'sg')
            [w_opt] = gd(problem, options);
        elseif strcmp(method, 'cg')
            [w_opt] = ncg(problem, options);
              
        end
    end


   
end