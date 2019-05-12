
    clc;
    clear;
    close all;

    problem = logistic_regression(x_train, y_train, x_test, y_test, 0.001); 
    options.step_init = 0.1; 
    options.max_iter=400;
    options.step_alg= 'tfocs_backtracking';
%  -------------------Optimality gap vs Epsilon------------
%     [w_opt, info_opt] = iht(problem, options);
%  
%     options.optval= problem.cost(w_opt);
%     options.epsilon=2;
%     
%     options.opt_vec = w_opt;
%     
%     [w_gd1, info_gd1] = dp_iht(problem, options); 
% 
%     options.epsilon=0.5;
%     [w_gd2, info_gd2] = dp_iht(problem, options); 
%     
%     options.epsilon=1;
% 
%     [w_gd3, info_gd3] = dp_iht(problem, options); 
%     
%     options.epsilon=0.1;
%     [w_gd4, info_gd4] = dp_iht(problem, options);   
%     
%     display_graph('iter','optimality_gap', {texlabel('epsilon=2'), texlabel('epsilon=0.5'),texlabel('epsilon=1'), texlabel('epsilon=0.1')}, {w_gd1, w_gd2, w_gd3, w_gd4}, {info_gd1, info_gd2,info_gd3, info_gd4});
%  
% -------------Testing different sparsity---------------------------------
    options.max_iter=400;
    options.epsilon=2;
    s1=10; s2=20; s3=30; s4=40;
    options.sparsity=10;
    [w_opt, info_opt1] = iht(problem, options);
    options.optval= problem.cost(w_opt);
    options.opt_vec = w_opt;
    [w_gd1, info_gd1] = dp_iht(problem, options); 

    options.sparsity=20;
    [w_opt, info_opt2] = iht(problem, options);
    options.optval= problem.cost(w_opt);
    options.opt_vec = w_opt;
    [w_gd2, info_gd2] = dp_iht(problem, options); 
    
    options.sparsity=30;
    [w_opt, info_opt3] = iht(problem, options);
    options.optval= problem.cost(w_opt);
    options.opt_vec = w_opt;
    [w_gd3, info_gd3] = dp_iht(problem, options);   
    
    options.sparsity=40;
    [w_opt, info_opt4] = iht(problem, options);
    options.optval= problem.cost(w_opt);
    options.opt_vec = w_opt;
    [w_gd4, info_gd4] = dp_iht(problem, options);   
    
    display_graph('iter','optimality_gap', {'s=10', 's=20','s=30', 's=40'}, {w_gd1, w_gd2, w_gd3, w_gd4}, {info_gd1, info_gd2,info_gd3, info_gd4});

%---Testing differentiteration----------------------------------------------
%     x_train=M(1:500000,1:15)';
%     y_train=N(1:500000,:)';
%     x_test=M(500000:end,1:15)';
%     y_test=N(500000:end,:)';
%     problem = logistic_regression(x_train, y_train, x_test, y_test, 0.001);
%      options.max_iter=300;
%     options.epsilon=1;
%     options.sparsity=10;
%     [w_opt, info_opt1] = iht(problem, options);
%     options.optval= problem.cost(w_opt);
%     options.opt_vec = w_opt;
%     [w_gd1, info_gd1] = dp_iht(problem, options); 
%     
%      x_train=M(1:500000,1:30)';
%     y_train=N(1:500000,:)';
%     x_test=M(500000:end,1:30)';
%     y_test=N(500000:end,:)';
%     problem = logistic_regression(x_train, y_train, x_test, y_test, 0.001);
%   
%     options.sparsity=10;
%     [w_opt, info_opt1] = iht(problem, options);
%     options.optval= problem.cost(w_opt);
%     options.opt_vec = w_opt;
%     [w_gd2, info_gd2] = dp_iht(problem, options); 
%     
%     x_train=M(1:500000,:)';
%     y_train=N(1:500000,:)';
%     x_test=M(500000:end,:)';
%     y_test=N(500000:end,:)';
%     problem = logistic_regression(x_train, y_train, x_test, y_test, 0.001);
%     options.sparsity=10;
%     [w_opt, info_opt1] = iht(problem, options);
%     options.optval= problem.cost(w_opt);
%     options.opt_vec = w_opt;
%     [w_gd3, info_gd3] = dp_iht(problem, options); 
%      display_graph('iter','optimality_gap', {'p=15', 'p=30', 'p=54'}, {w_gd1, w_gd2, w_gd3}, {info_gd1, info_gd2,info_gd3});
