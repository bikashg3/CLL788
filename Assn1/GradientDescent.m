function [theta, J_history] = GradientDescent(X, y, theta, alpha, iterations)

	% prepare variables
	m = length(y) ;
	J_history = zeros(iterations, 1) ;
	k = 0;
	theta_old = ones(2,1);
	while norm(theta - theta_old) > 1e-08
		k = k+1;
		theta_old = theta;
		%alpha = 1/i;
        h = X * theta ; % hypothesis vector
        %theta = theta + alpha * sum((y-h) .* X);
		t1 = theta(1) + alpha * sum(y - h);
		t2 = theta(2) + alpha  * sum((y - h) .* X(:, 2));
		theta(1) = t1;
		theta(2) = t2;
        %disp(theta);

		J_history(k) =  ComputeCost(X, y, theta);
    end
    disp('LMS');
	disp(k);
end
