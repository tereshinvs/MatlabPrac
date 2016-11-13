function result = inv_matlab(mat)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function returns inverse matrix of matrix mat using Gaussian method.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	EPS = 1e-9;

	m = size(mat, 1);
	n = size(mat, 2);
	if m ~= n
		error('Input matrix must be square-shape');
	end
	
	result = eye(n);
	
	for i = 1 : n
		% Find row to swap with current if there is 0 in current row on
		% diagonal.
		row_to_swap = -1;
		for j = i : n
			if abs(mat(j, i)) > EPS
				row_to_swap = j;
				break
			end
		end
		if row_to_swap == -1
			error('Input matrix is not invertible.');
		end
		
		for j = 1 : n
			tmp = mat(i, j);
			mat(i, j) = mat(row_to_swap, j);
			mat(row_to_swap, j) = tmp;
			
			tmp = result(i, j);
			result(i, j) = result(row_to_swap, j);
			result(row_to_swap, j) = tmp;
		end
		
		% Set diagonal element to 1.
		tmp = mat(i, i);
		for j = 1 : n
			mat(i, j) = mat(i, j) / tmp;
			result(i, j) = result(i, j) / tmp;
		end
		
		% Subtract the current row from another.
		for j = 1 : n
			if j == i
				continue;
			end
			coef = -mat(j, i);
			for q = 1 : n
				mat(j, q) = mat(j, q) + coef * mat(i, q);
				result(j, q) = result(j, q) + coef * result(i, q);
			end
		end
	end
end
