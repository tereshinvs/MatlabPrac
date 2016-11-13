function result = get_global_max(y)
	result = [];
	maximum = max(y);
	for i = 1 : size(y, 2)
		if y(i) >= maximum - 1e-5
			result = [result; i];
		end
	end
end
