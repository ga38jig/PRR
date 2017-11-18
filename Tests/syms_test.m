% Tests the mechanics of syms

syms x
syms f(x)

f(x) = 2*x
f(4)

syms g(f(x))

g(f) = f+1
g(f(4))