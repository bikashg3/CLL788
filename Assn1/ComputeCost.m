function J = ComputeCost (X, y, theta)
	m = length(y);
	% compute the hypothesis matrix
	h = X * theta;

	% Calculate the cost 
	J = 1 / (2 * m) * sum((h - y) .^2);
end
 