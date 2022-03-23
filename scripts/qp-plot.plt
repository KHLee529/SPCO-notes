#!/bin/gnuplot

set encoding utf8
set term png 
set output '../pics/qq.png'

#unset border

set title 'Q-Q Plot'
plot 'qq.txt' using 1:2 with points lw 2 lt rgb 'blue' notitle , \
    'qq.txt' using 1:1 with lines lw 2 lt -1 notitle

set title 'P-P Plot'
set output '../pics/pp.png'

plot 'pp.txt' using 1:2 with points lw 2 lt rgb 'blue' notitle , \
    'pp.txt' using 1:1 with lines lw 2 lt -1 notitle
