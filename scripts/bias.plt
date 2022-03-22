#!/bin/gnuplot

unset border
unset ytics
unset xtics

set output "../pics/bias.png"
set term png size 1000,1000 font "Monospace 10"

set xrange [-30:30]
set yrange [-30:30]

plot "target.txt" using 1:2:3 with circle lw 5 lt -1 notitle,\
"dense.txt" using 1:2 with points pt 7 ps 4 lt rgb 'blue' notitle,\
"dense.txt" using ($1 - 15):($2 + 15) with points pt 7 ps 4 lt rgb 'purple' notitle,\
"dense.txt" using ($1 * 4):($2 * 4) with points pt 7 ps 4 lt rgb 'red' notitle,\
"dense.txt" using ($1 * 4 - 17):($2 * 4 + 12) with points pt 7 ps 4 lt rgb 'orange' notitle,\
