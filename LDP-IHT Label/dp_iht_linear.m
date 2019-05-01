function [relerror, theta_now] = dp_iht_linear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter)
%Input: 
%      X is a n*p random matrix. 
%      Y is a n*1 reponse vector.
%      theta is the true vector we want to estimate.
%      s is the sparsity level.
%      eta is the step size.
%      max_iter is the maximal iteration number of IHT.
%      epsilon is the privacy level.
%      sigma is the noise level.
%      iter reflects the time of experiment.
%Output:
%      relerror is ||theta_T-theta||/||theta||
if epsilon==0
   
   Sigma = 0;
else
    
   Sigma = 2*sqrt(2)*sigma*sqrt(log(1/0.001))/epsilon;
   
end

relerror=1;

[n, p] = size(X);

Y = Y + normrnd(0, Sigma, [n, 1]);

theta_now = normrnd(0, 1, [p, 1]);

rel_vec = zeros(max_iter, 1);

for i=1:iter

for t=1: max_iter
    
    theta_now = theta_now-eta*(1/n*(X.'*(X*theta_now-Y)));
    
    [~, sortind] = sort(abs(theta_now),'descend');
    
    theta_now(sortind(s+1:end)) =  0;
    
    %For real world image
%      if norm(theta_now)>1
%         theta_now= theta_now/norm(theta_now);
%     end

    
    rel_vec(t)= norm(theta_now-theta)/norm(theta);
    
end
%    relerror=min(min(rel_vec), relerror);
    relerror= mean(rel_vec);
end
end

