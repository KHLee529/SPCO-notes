#!/bin/gnuplot

set term png 
set output '../pics/f-test.png'

unset border
unset xtics
unset ytics
set xzeroaxis lw 2
show xzeroaxis

set xrange[0:5]

Binv(p,q)=exp(lgamma(p+q)-lgamma(p)-lgamma(q))
isint(x)=(int(x)==x)
f(x,d1,d2)=d1<=0||!isint(d1)||d2<=0||!isint(d2)?1/0:  Binv(0.5*d1,0.5*d2)*(real(d1)/d2)**(0.5*d1)*x**(0.5*d1-1.0)/(1.0+(real(d1)/d2)*x)**(0.5*(d1+d2))

set label 'α' at 3.6, 0.1 left 

plot f(x,5,5) title 'F(ν_1, ν_2)',\
    [3.5:5] f(x,5,5) with impulse notitle,\
    '+' using (3.5):(0.5) with impulse lt -1 notitle

