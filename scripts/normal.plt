#!/bin/gnuplot

set term png 
set output '../pics/normal.png'

unset border
unset xtics
unset ytics
set yzeroaxis lw 2
show yzeroaxis

invsqrt2pi = 0.398942280401433
normal(x,mu,sigma)=sigma<=0?1/0:invsqrt2pi/sigma*exp(-0.5*((x-mu)/sigma)**2)

plot normal(x,0,2) with lines lw 2 title 'X bar with n1', \
    normal(x,0,3) with lines lw 2 title 'X bar with n2', \
    normal(x,0,4) with lines lw 2 title 'X bar with n3'
