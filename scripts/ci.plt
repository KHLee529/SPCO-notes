#!/bin/gnuplot

set term png 
set output '../pics/ci.png'

unset border
unset xtics
unset ytics

invsqrt2pi = 0.398942280401433
normal(x,mu,sigma)=sigma<=0?1/0:invsqrt2pi/sigma*exp(-0.5*((x-mu)/sigma)**2)

set yrange [-0.05:0.45]
set label "← 0.95 →" at  0, 0.42 center
set label "→ 0.025" at  2.2, 0.05 left
set label "0.025 ←" at  -2.2, 0.05 right
set label "-1.96" at  -1.96, -0.02 center
set label "1.96" at  1.96, -0.02 center

plot [-5:5] normal(x,0,1) with lines lw 2 lt -1 notitle, \
    [-1.96:1.96] normal(x,0,1) with impulse lt -1 notitle, \
    '+' using (-1.96):(0.45) with impulse lw 1 lt -1 notitle, \
    '+' using (1.96):(0.45) with impulse lw 1 lt -1 notitle, \
    0 with lines lw 2 lt -1 notitle

