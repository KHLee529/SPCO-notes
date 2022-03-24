#!/bin/gnuplot

set term png 
set output '../pics/chisq-test.png'

unset border
unset xtics
unset ytics
set xzeroaxis lw 2
show xzeroaxis

set xrange[0:30]

log2 = 0.693147180559945
isint(x)=(int(x)==x)
chisq(x,k)=k<=0||!isint(k)?1/0:  x<=0?0.0:exp((0.5*k-1.0)*log(x)-0.5*x-lgamma(0.5*k)-k*0.5*log2)

set label 'α' at 21, 0.015 left 

plot chisq(x,10) title 'χ^2(ν)',\
    [20:30] chisq(x,10) with impulse lt -1 notitle,\
    '+' using (20):(0.09) with impulse lt -1 notitle
