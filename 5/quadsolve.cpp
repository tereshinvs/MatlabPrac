/**************************************************************************
* This function returns solutions of quadratic equations as three matrices,
* the first and the second of these are solutions and the third is the
* matrix of discriminants. The third output argument can be skipped.
**************************************************************************/

#include <cmath>
#include <complex>

#include "mex.h"
#include "matrix.h"

const double EPS = 1e-9;

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
	if (nlhs > 3)
		mexErrMsgTxt("Too many output arguments.");
	if (nlhs < 2)
		mexErrMsgTxt("Not enough output arguments.");
	if (nrhs != 3)
		mexErrMsgTxt("Invalid number of input arguments.");

	int m = mxGetM(prhs[0]), n = mxGetN(prhs[0]);
	if (mxGetM(prhs[1]) != m || mxGetN(prhs[1]) != n ||
		mxGetM(prhs[2]) != m || mxGetN(prhs[2]) != n)
		mexErrMsgTxt("Invalid dimensions of input arguments.");

	plhs[0] = mxCreateDoubleMatrix(m, n, mxCOMPLEX);
	plhs[1] = mxCreateDoubleMatrix(m, n, mxCOMPLEX);
	if (nlhs == 3)
		plhs[2] = mxCreateDoubleMatrix(m, n, mxCOMPLEX);

	const double *ar = mxGetPr(prhs[0]), *ai = mxGetPi(prhs[0]);
	const double *br = mxGetPr(prhs[1]), *bi = mxGetPi(prhs[1]);
	const double *cr = mxGetPr(prhs[2]), *ci = mxGetPi(prhs[2]);

	double *x1r = mxGetPr(plhs[0]), *x1i = mxGetPi(plhs[0]);
	double *x2r = mxGetPr(plhs[1]), *x2i = mxGetPi(plhs[1]);
	double *dr = mxGetPr(plhs[2]), *di = mxGetPi(plhs[2]);

	for (int i = 0; i < m * n; i++) {
		std::complex<double> a(ar[i], ai ? ai[i] : 0.0), b(br[i], bi ? bi[i] : 0.0), c(cr[i], ci ? ci[i] : 0.0);
		if (std::abs(a) < EPS)
			mexErrMsgTxt("There is non-quadratic equation in input.");

		std::complex<double> D = b * b - 4.0 * a * c;
		if (nlhs == 3) {
			dr[i] = D.real(); di[i] = D.imag();
		}
		D = std::sqrt(D);

		std::complex<double> x1 = (-b + D) / (2.0 * a), x2 = (-b - D) / (2.0 * a);
		x1r[i] = x1.real(); x1i[i] = x1.imag();
		x2r[i] = x2.real(); x2i[i] = x2.imag();
	}
}
