function result = compare_conv(conv1, conv2)
% This function returns 1 if convex hull conv1 is equal to conv2 (tests if
% conv1 can be shifted to conv2) and 0 otherwise.
	if size(conv1, 1) ~= size(conv2, 1)
		result = 0;
		return;
	end

	conv1 = conv1(1 : end - 1);
	conv2 = conv2(1 : end - 1);
	
	k = size(conv1, 1);
	while conv1(1) ~= conv2(1)
		conv1 = circshift(conv1, 1);
		k = k - 1;
		if k == 0
			result = 0;
			return;
		end
	end
	
	result = all(conv1 == conv2);
end
