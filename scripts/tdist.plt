# set terminal pngcairo  transparent enhanced font "arial,10" fontscale 1.0 size 600, 400 
# set output 'prob2.9.png'
#

set term png size 1000,1000
set output '../pics/tdist.png'

set xrange [-5:5]

isint(x)=(int(x)==x)
Binv(p,q)=exp(lgamma(p+q)-lgamma(p)-lgamma(q))
normal(x,mu,sigma)=sigma<=0?1/0:invsqrt2pi/sigma*exp(-0.5*((x-mu)/sigma)**2)
t(x,nu)=nu<0||!isint(nu)?1/0:  Binv(0.5*nu,0.5)/sqrt(nu)*(1+real(x*x)/nu)**(-0.5*(nu+1.0))
invsqrt2pi = 0.398942280401433
plot normal(x, 0, 1) with lines lw 2 title 'Standard Normal', \
    t(x, 1) with lines lw 2 title 'T(ν=1)',\
    t(x, 3) with lines lw 2 title 'T(ν=3)',\
    t(x, 10) with lines lw 2 title 'T(ν=10)',\
    t(x, 30) with lines lw 2 title 'T(ν=30)',\
    '+' using (0):(0.4) with impulse notitle lt -1

