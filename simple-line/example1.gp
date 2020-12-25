
load "~/Documents/GitHub/gnuplot-scripts/colorbrewer/qualitative/Set1.plt"
set terminal epslatex standalone color 8 size 3.2in,2.4in

#set offset 0.0, 0.0, graph 0.0, graph 0.0
set output 'example1.tex'

set xrange [0.0:4*pi]
set yrange [-1.1:1.1]

set ytics 0.4

set format x "$%3.1f$"
set format y "$%3.1f$"

set xlabel "$\\omega$"
set ylabel "$\\sin$" offset 2.0,0.0

#set key bottom left
set key at 5.2, -0.10
set key spacing 1.5
set key sample 2

plot \
for [i=0:4:1] sin(x/2.0+pi/16*i) w lp ls i+1 pt 4+i*2 ps 1 title "$\\sin(\\frac{\\omega}{2}+\\frac{".i."}{16}\\pi)$"

set output
