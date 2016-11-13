function result = get_local_mins(y)
	if size(y, 2) == 0
		result = [];
		return;
	end
	if size(y, 2) == 1
		result = [1];
		return;
	end
	result = [];
	if y(1) < y(2)
		result = [1];
	end
	for i = 2 : size(y, 2) - 1
		if y(i) < y(i - 1) && y(i) < y(i + 1)
			result = [result; i];
		end
	end
	if y(end) < y(end - 1)
		result = [result; size(y, 2)];
	end
end
