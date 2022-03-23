#!/bin/gnuplot

set encoding utf8
set term png 
set output '../pics/mvue1.png'
set xrange [-10:10]

unset xtics
unset ytics

invsqrt2pi = 0.398942280401433
normal(x,mu,sigma)=sigma<=0?1/0:invsqrt2pi/sigma*exp(-0.5*((x-mu)/sigma)**2)
f(x)=0
g(x)=2

plot normal(x,0,2) with lines lw 2 title 'p.d.f. of  @^{ \^}X_1', \
    normal(x,0,3) with lines lw 2 title 'p.d.f. of  @^{ \^}X_2', \
    normal(x,0,4) with lines lw 2 title 'p.d.f. of  @^{ \^}X_3', \
    '< echo "0 0.4"' with impulse lw 2 lt -1 title 'θ', \
    '< echo "-0.4 0.4"' with impulse lw 2 lt rgb 'red' notitle, \
    normal(x,-0.4,1) with lines lw 2 title 'p.d.f. of  @^{ \^}X_0'
