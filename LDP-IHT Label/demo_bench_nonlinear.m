
s= 150;
 
f_0=5;

sigma = 0.05;

eta = 0.2;

epsilon = 0;
clc;

max_iter=1000;

iter = 1;

I = rgb2gray(imread('image.jpg')); %The size of the image is 2448*3264

I= im2double(I);

[p, w] = size(I);

[U,S,V] = svd(I, 'econ'); 

b = svds(S,s); % returns the k largest singular values.

beta = b/norm(b);

a=norm(b);

theta = [beta; zeros( (p-s), 1)];

[X, Y] = data_generate_real_nonlinear(s, p, f_0, sigma, theta);


[relerror1, theta_now1] =  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter);

new_image1= U*diag(theta_now1.'*a)*V.' ;

epsilon = 2;
[relerror2, theta_now2] =  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter);

new_image2= U*diag(theta_now2.'*a)*V.' ;

epsilon = 1;
[relerror3, theta_now3] =  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter);

new_image3= U*diag(theta_now3.'*a)*V.' ;

epsilon = 0.5;

[relerror4, theta_now4] =  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter);

new_image4= U*diag(theta_now4.'*a)*V.' ;

epsilon = 0.1;

[relerror5, theta_now5] =  dp_iht_nonlinear(X, Y, theta, s, eta, max_iter, sigma, epsilon, iter);

new_image5= U*diag(theta_now5.'*a)*V.' ;


figure
subplottight( 2, 3, 1)
imshow(I,'border', 'tight')
subplottight( 2, 3, 2)
imshow(new_image1, 'border', 'tight')
subplottight( 2, 3, 3)
imshow(new_image2, 'border', 'tight')
subplottight( 2, 3, 4)
imshow(new_image3, 'border', 'tight')
subplottight( 2, 3, 5)
imshow(new_image4, 'border', 'tight')
subplottight( 2, 3, 6)
imshow(new_image5, 'border', 'tight')