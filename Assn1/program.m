% read data
data = xlsread('Assn1.xlsx');
X = data(:,1) ;
y = data(:,2) ;

% number of training examples
m = length(y) ; 

% Plot the data
figure; hold on
a1 = plot(X , y, 'rx', 'MarkerSize', 10) ; M0 = 'Training Data'; % Plot the data
title ('Training examples') ;
ylabel ('Profit in Lakhs') ; % Set the y-axis label
xlabel ('Population of City in 10,000s') ; % Set the x-axis label

theta = zeros(2,1) ; % initial weights(parameters)
iterations = 1500 ; % iterations needed for gradient descent
alpha = 0.0001 ; % learning rate

% Compute the cost function

% adding ones column to X
X = [ones(m, 1), data(:,1)] ;
J = ComputeCost(X, y, theta) ;

% running gradient descent and time analysis
t = cputime;
[theta_batch, J_history] = GradientDescent (X, y, theta, alpha, iterations);
e1 = cputime - t;

t = cputime;
[theta_SLMS, J_history_SLMS] = GradientDescent_SLMS (X, y, theta, alpha, iterations);
e2 = cputime - t;

t = cputime;
[theta_least_sqr] = inv(X'*X)*X'*y;
e3 = cputime - t;


%plotting linear regression line
a_batch = plot(X(:,2), X*theta_batch, 'g-'); M1 = 'Batch LMS' ;
a_SLMS = plot(X(:,2), X*theta_SLMS, 'b-'); M2 = 'Stochastic LMS';
a_least = plot(X(:,2), X*theta_least_sqr, 'm-'); M3 = 'Least Square';

legend([a1;a_batch;a_SLMS;a_least],M0,M1,M2,M3);

disp('Time analysis of methods');
disp(['Batch: ', num2str(e1) ,' Stochastic: ', num2str(e2) ,' Least Square: ', num2str(e3)]);

RMSE= sqrt(mean((y-X*(theta_batch)).^2));
% err = loss(X*theta_batch,X,y);
% disp(err)