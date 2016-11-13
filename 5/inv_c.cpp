/**************************************************************************
* This function returns inverse matrix of matrix mat using Gaussian method.
**************************************************************************/

#include <cmath>
#include <complex>
#include <vector>
#include <algorithm>

#include "mex.h"
#include "matrix.h"

typedef std::vector<std::vector<std::complex<long double> > > complex_matrix;

const double EPS = 1e-9;

void swap_rows(complex_matrix &mat, int row1, int row2) {
	if (row1 != row2)
		std::swap(mat[row1], mat[row2]);
}

int find_row_with_not_null_at(complex_matrix &mat, int col) {
	for (int i = col; i < mat[col].size(); i++)
		if (std::abs(mat[i][col]) > EPS)
			return i;
	return -1;
}

void mexFunction(int nlhs, mxArray *plhs[], int nrhs, const mxArray *prhs[]) {
	if (nrhs != 1)
		mexErrMsgTxt("Invalid number of input arguments.");
	if (nlhs != 1)
		mexErrMsgTxt("Invalid number of output arguments");

	int m = mxGetM(prhs[0]), n = mxGetN(prhs[0]);
	if (m != n)
		mexErrMsgTxt("Input matrix must be square-shape.");

	const double *ar = mxGetPr(prhs[0]), *ai = mxGetPi(prhs[0]);

	// Read input
	complex_matrix mat;
	mat.resize(n);
	for (int i = 0; i < n; i++) {
		mat[i].resize(n);
		for (int j = 0; j < n; j++)
			mat[i][j] = std::complex<long double>(ar[i * n + j], ai ? ai[i * n + j] : 0.0);
	}

	// Construct the identity matrix for Gaussian method.
	complex_matrix res;
	res.resize(n);
	for (int i = 0; i < n; i++) {
		res[i].resize(n);
		res[i][i] = std::complex<double>(1.0, 0.0);
	}

	for (int i = 0; i < n; i++) {
		// Find row to swap with current if there is 0 in current row on diagonal.
		int row_to_swap = find_row_with_not_null_at(mat, i);
		if (row_to_swap == -1)
			mexErrMsgTxt("Input matrix is not invertible.");
		swap_rows(mat, i, row_to_swap);
		swap_rows(res, i, row_to_swap);

		// Set diagonal element to 1.
		std::complex<long double> tmp = mat[i][i];
		for (int j = 0; j < n; j++) {
			mat[i][j] /= tmp;
			res[i][j] /= tmp;
		}

		// Subtract the current row from another.
		for (int j = 0; j < n; j++) {
			if (j == i)
				continue;
			std::complex<long double> coef = -mat[j][i];
			for (int q = 0; q < n; q++) {
				mat[j][q] += coef * mat[i][q];
				res[j][q] += coef * res[i][q];
			}
		}
	}

	// Generate output
	plhs[0] = mxCreateDoubleMatrix(n, n, mxCOMPLEX);
	double *resr = mxGetPr(plhs[0]), *resi = mxGetPi(plhs[0]);
	for (int i = 0; i < n; i++)
		for (int j = 0; j < n; j++) {
			resr[i * n + j] = double(res[i][j].real());
			resi[i * n + j] = double(res[i][j].imag());
		}
}