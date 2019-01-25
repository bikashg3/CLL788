function [theta, J_history] = GradientDescent_SLMS(X, y, theta, alpha, iterations)

	% prepare variables
	m = length(y) ;
	J_history = zeros(iterations, 1) ;
	k=0;
	theta_old = [1;1];
	while norm(theta-theta_old) > 1e-08
		theta_old = theta;
		k = k + 1;
        for i = 1: m,
        	h = X(i,:) * theta ; % hypothesis vector
			t1 = theta(1) + alpha * (y(i) - h);
			t2 = theta(2) + alpha  * ((y(i) - h) .* X(i, 2));
			theta(1) = t1;
			theta(2) = t2;
			%disp(theta)
		end
% 		if k == 2
% 			break
% 		end
        %disp(theta);

		J_history(k) =  ComputeCost(X, y, theta);
	end
	disp(k);
end
