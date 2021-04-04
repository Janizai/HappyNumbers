import numpy as np
import matplotlib.pyplot as plt
from scipy.optimize import curve_fit

def f(x, a, b, c):
    return  a * np.sin(b * x) + c

filename = 'numbers.dat'

data = np.loadtxt(filename)
x, y = data[:, 1], data[:, 0] / data[:, 1]

fig = plt.figure()

xt = np.linspace(x[0], x[-1], 10 ** 5)

plt.plot(x, y, label = 'data')
plt.plot(xt, [1.0/7.0] * len(xt), label = r'$1/7$')

#popt, pcov = curve_fit(f, x, y)
#plt.plot(xt, f(xt, *popt), 'r-', label = 'fit')

plt.xlabel(r'$x$')
plt.ylabel(r'$y$')
plt.legend()
#plt.xlim(1, x[-1])
#plt.ylim(0.138, 0.146)
plt.show()
