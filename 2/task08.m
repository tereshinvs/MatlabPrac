n = 100;
k = 150;
pnts = random('Normal', 0, 1, k, n);
A = pdist2(pnts', pnts', 'euclidean');
disp('pnts:');
disp(pnts);
disp('A:');
disp(A);

SQ = zeros(2, n);
SQ(1, :) = sum(pnts.^2, 1);
SQ(2, :) = ones(1, n);
SQ_P_S = fliplr(SQ') * SQ;
CR = 2 * pnts' * pnts;
B = sqrt(SQ_P_S - CR);
disp('B:');
disp(B);

disp('A - B:');
disp(norm(A - B));
%disp(A == B);
