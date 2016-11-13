function result = f(x, y, z, alpha)
	if isinf(alpha)
		result = zeros(size(x, 1), size(y, 2), size(z, 3));
		for i1 = 1 : size(x, 1)
			for i2 = 1 : size(y, 2)
				for i3 = 1 : size(z, 3)
					result(i1, i2, i3) = max(abs([x(i1, i2, i3); y(i1, i2, i3); z(i1, i2, i3)]));
				end
			end
		end
	else
		result = (abs(x).^alpha + abs(y).^alpha + abs(z).^alpha).^(1 / alpha);
	end
end
