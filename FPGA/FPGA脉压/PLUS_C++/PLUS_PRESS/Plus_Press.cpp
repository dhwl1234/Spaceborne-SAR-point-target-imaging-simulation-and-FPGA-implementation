#include<iostream>
#include<complex>


using namespace std;

// 矩阵加法 a+b,其中a、b均为n*m型矩阵
double** Add(double** a, double** b, int n, int m) {
	double** res = new double* [n];
	for (int i = 0; i < n; i++) res[i] = new double[m];
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < m; j++) {
			res[i][j] = a[i][j] + b[i][j];
		}
	}
	return res;
}

// 矩阵乘法，a*b,a为n*m型矩阵，b为m*o型矩阵
double** Mul(double** a, double** b, int n, int m, int o) {
	double** res = new double* [n];
	double temp = 0.0;
	for (int i = 0; i < n; i++) res[i] = new double[o];
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < o; j++) {
			temp = 0.0;
			for (int k = 0; k < m; k++) {
				temp += a[i][k] * b[k][j];
			}
			res[i][j] = temp;
		}
	}
	return res;
}

void swap(double* a, double* b);  //声明子程序
// 实数矩阵求逆，返回a的逆，其中a为num型方阵
double** inv(double** a, int num)
{
	int* is, * js, i, j, k;
	int n = num;
	double temp, fmax;
	double** tp = new double* [num];
	for (int i = 0; i < num; i++) tp[i] = new double[num];
	for (i = 0; i < n; i++) {
		for (j = 0; j < n; j++) {
			tp[i][j] = a[i][j];
		}
	}
	is = new int[n];
	js = new int[n];
	for (k = 0; k < n; k++)
	{
		fmax = 0.0;
		for (i = k; i < n; i++) {
			for (j = k; j < n; j++)
			{
				temp = fabs(tp[i][j]);//找最大值
				if (temp > fmax)
				{
					fmax = temp;
					is[k] = i; js[k] = j;
				}
			}
		}

		if ((fmax + 1.0) == 1.0)
		{
			delete[] is;
			delete[] js;
			return NULL;
		}
		if ((i = is[k]) != k)
			for (j = 0; j < n; j++)
				swap(&tp[k][j], &tp[i][j]);//交换指针
		if ((j = js[k]) != k)
			for (i = 0; i < n; i++)
				swap(&tp[i][k], &tp[i][j]);  //交换指针
		tp[k][k] = 1.0 / tp[k][k];
		for (j = 0; j < n; j++)
			if (j != k)
				tp[k][j] *= tp[k][k];
		for (i = 0; i < n; i++)
			if (i != k)
				for (j = 0; j < n; j++)
					if (j != k)
						tp[i][j] = tp[i][j] - tp[i][k] * tp[k][j];
		for (i = 0; i < n; i++)
			if (i != k)
				tp[i][k] *= -tp[k][k];
	}
	for (k = n - 1; k >= 0; k--)
	{
		if ((j = js[k]) != k)
			for (i = 0; i < n; i++)
				swap(&tp[j][i], &tp[k][i]);
		if ((i = is[k]) != k)
			for (j = 0; j < n; j++)
				swap(&tp[j][i], &tp[j][k]);
	}
	delete[] is;
	delete[] js;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
		}
	}
	return tp;
}
void swap(double* a, double* b)
{
	double c;
	c = *a;
	*a = *b;
	*b = c;
}

complex<double>** GetMatrixInverse(complex<double>** src, int n) {
	double** A = new double* [n];
	double** B = new double* [n];
	for (int i = 0; i < n; i++) {
		A[i] = new double[n];
		B[i] = new double[n];
		for (int j = 0; j < n; j++) {
			A[i][j] = src[i][j].real();
			B[i][j] = src[i][j].imag();
		}
	}
	double** A1 = inv(A, n);
	double** A1B = Mul(A1, B, n, n, n);
	double** BA1B = Mul(B, A1B, n, n, n);
	double** AjBA1B = Add(A, BA1B, n, n);
	double** AjBA1B_1 = inv(AjBA1B, n);
	double** A1B_AjBA1B_1 = Mul(A1B, AjBA1B_1, n, n, n);

	complex<double>** res = new complex<double> *[n];
	for (int i = 0; i < n; i++) {
		res[i] = new complex<double>[n];
		for (int j = 0; j < n; j++) {
			res[i][j].real(AjBA1B_1[i][j]);
			res[i][j].imag(-1.0 * A1B_AjBA1B_1[i][j]);
		}
	}
	return res;
}

int main() {
	complex<double>** temp = new complex<double> *[3];
	for (int i = 0; i < 3; i++) {
		temp[i] = new complex<double>[3];
	}
	complex<double> t1(1, 0);
	temp[0][0] = t1;
	temp[2][1] = t1;
	temp[2][2] = t1;
	complex<double> t2(1, 1);
	temp[0][2] = t2;
	temp[1][1] = t2;
	complex<double> t3(0, 1);
	temp[1][0] = t3;
	complex<double> t4(2, -1);
	temp[0][1] = t4;
	complex<double> t5(1, 2);
	temp[1][2] = t5;
	complex<double> t6(-1, 1);
	temp[2][0] = t6;

	cout << "原方程：" << endl;
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			cout << temp[i][j] << " ";
		}
		cout << endl;
	}
	cout << endl << "求逆：" << endl;
	complex<double>** res = GetMatrixInverse(temp, 3);
	for (int i = 0; i < 3; i++) {
		for (int j = 0; j < 3; j++) {
			cout << res[i][j] << " ";
		}
		cout << endl;
	}
	system("pause");
	return 0;
}
/*
int main()
{
	/*complex<double>z(2, 3);
	complex<double>z1;
	complex<double>z2(z);

	cout << z << endl;
	cout << z1 << endl;
	cout << z2 << endl;
	z.real(22);
	z.imag(33);//修改z的实部和虚部的值
	cout << z << endl;

	complex<double>a, b, c;
	cout << "请输入三个复数：";
	cin >> a >> b >> c;
	cout << "a=" << a << endl;
	cout << "b=" << b << endl;
	cout << "c=" << c << endl;
	system("pause");
	return 0;*/
	
}*/