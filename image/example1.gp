
set terminal epslatex standalone color 8 size 3.2in,3.2in

#set offset 0.0, 0.0, graph 0.0, graph 0.0
set output 'example1.tex'

set style line 11 lc rgb '#808080' lt 1
set border 31 front ls 11
set tics nomirror out scale 0.75

L=128
set xrange [0.5:L-0.5]
set yrange [0.5:L-0.5]

set format x "$%4.0f$"
set format y "$%4.0f$"

set xlabel "$L_x$"
set ylabel "$L_y$" offset 2.0,0.0

set cbtics scale 0.55
set cbtics pi/2
set cbtics ("$0$" 0, "$\\pi/2$" pi/2, "$\\pi$" pi, "$3\\pi/2$" 3*pi/2, "$2\\pi$" 2*pi)

set palette positive nops_allcF maxcolors 0 gamma 1.5 color model HSV
set palette defined ( 0 0 1 1, 1 1 1 1   )

set size square

plot "example1.dat" matrix w image notitle

set output
