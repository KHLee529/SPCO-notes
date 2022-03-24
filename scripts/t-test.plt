#!/bin/gnuplot

set term png

set xrange [-4:4]
set yrange [-0.02:0.4]
unset border
unset xtics
unset ytics

set xzeroaxis lw 1
show xzeroaxis

isint(x)=(int(x)==x)
Binv(p,q)=exp(lgamma(p+q)-lgamma(p)-lgamma(q))
normal(x,mu,sigma)=sigma<=0?1/0:invsqrt2pi/sigma*exp(-0.5*((x-mu)/sigma)**2)
t(x,nu)=nu<0||!isint(nu)?1/0:  Binv(0.5*nu,0.5)/sqrt(nu)*(1+real(x*x)/nu)**(-0.5*(nu+1.0))
invsqrt2pi = 0.398942280401433

set output '../pics/t-test-less.png'

set label "α" at -2, 0.07 right
set label "t" at -2, -0.01 center
set label "0" at 0, -0.01 center

plot normal(x, 0, 1) with lines lw 2 title 'T-Distribution with ν=n-1', \
    '+' using (-2):(0.4) with impulse notitle lt -1 ,\
    '+' using (0):(0.4) with impulse notitle lt -1 ,\
    [-4:-2] normal(x, 0, 1) with impulse notitle lt -1

set output '../pics/t-test-great.png'

unset label
set label "α" at 2, 0.07 left
set label "t" at 2, -0.01 center
set label "0" at 0, -0.01 center

plot normal(x, 0, 1) with lines lw 2 title 'T-Distribution with ν=n-1', \
    '+' using (2):(0.4) with impulse notitle lt -1 ,\
    '+' using (0):(0.4) with impulse notitle lt -1 ,\
    [2:4] normal(x, 0, 1) with impulse notitle lt -1

set output '../pics/t-test-ne.png'

unset label
set label "α/2" at 2.3, 0.04 left
set label "α/2" at -2.3, 0.04 right
set label "t_1" at -2.3, -0.01 center
set label "t_2" at 2.3, -0.01 center
set label "0" at 0, -0.01 center

plot normal(x, 0, 1) with lines lw 2 title 'T-Distribution with ν=n-1', \
    '+' using (-2.3):(0.4) with impulse notitle lt -1 ,\
    '+' using (2.3):(0.4) with impulse notitle lt -1 ,\
    '+' using (0):(0.4) with impulse notitle lt -1 ,\
    [-4:-2.3] normal(x, 0, 1) with impulse notitle lt -1, \
    [2.3:4] normal(x, 0, 1) with impulse notitle lt -1
