#!/bin/gnuplot

set encoding utf8
set term png 
set output '../pics/mle.png'
set xrange [-10:10]

unset xtics
unset ytics

invsqrt2pi = 0.398942280401433
normal(x,mu,sigma)=sigma<=0?1/0:invsqrt2pi/sigma*exp(-0.5*((x-mu)/sigma)**2)
f(x)=0
g(x)=2

set multiplot layout 3,1

plot normal(x,0,2) with lines lw 2 title 'p.d.f. of  Normal(μ_1, σ)', \
    '+' using (0):(normal(0,0,2)) with impulse lt -1 notitle, \
    '+' using (0.2):(normal(0.2,0,2)) with impulse lt -1 notitle, \
    '+' using (0.5):(normal(0.5,0,2)) with impulse lt -1 notitle, \
    '+' using (1.1):(normal(1.1,0,2)) with impulse lt -1 notitle, \
    '+' using (2.2):(normal(2.2,0,2)) with impulse lt -1 notitle, \
    '+' using (-0.2):(normal(-0.2,0,2)) with impulse lt -1 notitle, \
    '+' using (-0.4):(normal(-0.4,0,2)) with impulse lt -1 notitle, \
    '+' using (-0.9):(normal(-0.9,0,2)) with impulse lt -1 notitle, \
    '+' using (-2.3):(normal(-2.3,0,2)) with impulse lt -1 notitle

plot normal(x,3,2) with lines lw 2 title 'p.d.f. of  Normal(μ_2, σ)', \
    '+' using (0):(normal(0.001,3,2)) with impulse lt -1 notitle, \
    '+' using (0.2):(normal(0.2,3,2)) with impulse lt -1 notitle, \
    '+' using (0.5):(normal(0.5,3,2)) with impulse lt -1 notitle, \
    '+' using (1.1):(normal(1.1,3,2)) with impulse lt -1 notitle, \
    '+' using (2.2):(normal(2.2,3,2)) with impulse lt -1 notitle, \
    '+' using (-0.2):(normal(-0.2,3,2)) with impulse lt -1 notitle, \
    '+' using (-0.4):(normal(-0.4,3,2)) with impulse lt -1 notitle, \
    '+' using (-0.9):(normal(-0.9,3,2)) with impulse lt -1 notitle, \
    '+' using (-2.3):(normal(-2.3,3,2)) with impulse lt -1 notitle

plot normal(x,-3,2) with lines lw 2 title 'p.d.f. of  Normal(μ_2, σ)', \
    '+' using (0):(normal(0.001,-3,2)) with impulse lt -1 notitle, \
    '+' using (0.2):(normal(0.2,-3,2)) with impulse lt -1 notitle, \
    '+' using (0.5):(normal(0.5,-3,2)) with impulse lt -1 notitle, \
    '+' using (1.1):(normal(1.1,-3,2)) with impulse lt -1 notitle, \
    '+' using (2.2):(normal(2.2,-3,2)) with impulse lt -1 notitle, \
    '+' using (-0.2):(normal(-0.2,-3,2)) with impulse lt -1 notitle, \
    '+' using (-0.4):(normal(-0.4,-3,2)) with impulse lt -1 notitle, \
    '+' using (-0.9):(normal(-0.9,-3,2)) with impulse lt -1 notitle, \
    '+' using (-2.3):(normal(-2.3,-3,2)) with impulse lt -1 notitle

