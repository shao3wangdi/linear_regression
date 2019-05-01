clc;

iter=5;

max_iter=200;

epsilon=0.5;

eta=0.1;

s =100;

p =256;

sigma = 0.05;

relerror1= [];
relerror2= [];
relerror3= [];
relerror4= [];


%--------------------------Testing epsilon v.s. relative error-------------
relerror5= [];
epsilon_1 = 0.5;
epsilon_2 = 0.1;
epsilon_3 = 1;
epsilon_4 = 2;
epsilon_5 = 0;
% for f_0=0.5:0.5:4
% n=f_0*1000;
%     
% [X, Y, theta] = data_generate_nonlinear(s, p, n, sigma);
% 
% relerror1 = [relerror1,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon_1, iter)];
% 
% 
% relerror2 = [relerror2,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon_2, iter)];
% 
% 
% relerror3 = [relerror3,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon_3, iter)];
% 
% relerror4 = [relerror4,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon_4, iter)];
% 
% 
% end
% 
% 
% x= 0.5*1000:0.5*1000:4*1000;
% figure 
% plot(x, relerror1, x, relerror2, x, relerror3, x, relerror4)
% xlabel('Sample size');
% ylabel('Relative Error');
% title('Estimation with p=256 and s*=100')
% legend('\epsilon=0.5', '\epsilon=0.1', '\epsilon=1', '\epsilon=2')

%--------------------------------------------------------------------------
% p=256;
% 
% for f_0=0.5:0.5:4
% n= f_0*10^3;
% [X, Y, theta] = data_generate_nonlinear(s, p, n, sigma);
% 
% relerror2 = [relerror2,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter)];
% 
% end
% 
% p=512;
% 
% for f_0=0.5:0.5:4
% n= f_0*10^3;
% [X, Y, theta] = data_generate_nonlinear(s, p, n, sigma);
% 
% relerror1 = [relerror1,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter)];
% 
% end
% 
% p=1024;
% 
% for f_0=0.5:0.5:4
% n= f_0*10^3;
% 
% [X, Y, theta] = data_generate_nonlinear(s, p, n, sigma);
% 
% relerror3 = [relerror3,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter)];
% 
% end
% 
% 
% p=2048;
% 
% for f_0=0.5:0.5:4
% n= f_0*10^3;
% [X, Y, theta] = data_generate_nonlinear(s, p, n, sigma);
% 
% relerror4 = [relerror4,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter)];
% 
% end
% 
% 
% x= 0.5*10^3:0.5*10^3:4*10^3;
% figure 
% plot(x, relerror1, x, relerror2, x, relerror3, x, relerror4)
% xlabel('Sample size');
% ylabel('Relative Error');
% title('Estimation with s*=100 and \epsilon=0.5')
% legend('p=512', 'p=256', 'p=1024', 'p=2048')

% -------------------------------------------------------------------------
% 
s=100;

for f_0=0.5:0.5:4
n= f_0*10^3;
[X, Y, theta] = data_generate_nonlinear(s, p, n, sigma);

relerror1 = [relerror1,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter)];

end
s=30;

for f_0=0.5:0.5:4
n= f_0*10^3;
[X, Y, theta] = data_generate_nonlinear(s, p, n, sigma);

relerror2 = [relerror2,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter)];

end



s=50;

for f_0=0.5:0.5:4
n= f_0*10^3;
[X, Y, theta] = data_generate_nonlinear(s, p, n, sigma);

relerror3 = [relerror3,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter)];

end



s=150;

for f_0=0.5:0.5:4
n= f_0*10^3;
[X, Y, theta] = data_generate_nonlinear(s, p, n, sigma);

relerror4 = [relerror4,  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter)];

end



x= 0.5*10^3:0.5*10^3:4*10^3;
figure 
plot(x, relerror1, x, relerror2, x, relerror3, x, relerror4)
xlabel('Sample size');
ylabel('Relative Error');
title('Estimation with p=256 and \epsilon=0.5')
legend('s*=100', 's*=30', 's=50', 's*=150')