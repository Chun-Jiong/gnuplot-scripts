
set terminal epslatex standalone color 8 size 3.2in,2.4in

#set offset 0.0, 0.0, graph 0.0, graph 0.0
set output 'curve_shadow.tex'

reset
# load must be after reset
load '../colorbrewer/qualitative/Set1.plt'

h(x) = x*x*x-5*x*x+x+20
a = 0.05
b = -0.5
unset colorbox

set iso 2, 2
set table 'thickbg.dat'
sp [0:5] [0:30] y
unset table

set sample 20
set table 'thick.dat'
plot [0:5] h(x)+5*(0.5-rand(0))
unset table

set tics font ", 8" nomirror front
set palette defined (0 0.95 0.95 0.95, 1 0.95 0.95 0.95)

set xrange [0.0:5.0]
set yrange [0.0:30.0]

set xlabel 'TIME'
set ylabel 'Price' offset 1.5

plot [0:5] [0:30] 'thickbg.dat' w ima t '',\
'thick.dat' u ($1+a):($2+b) w l lt -1 lc rgb "#eeeeee" lw 19 t '',\
'' u ($1+a):($2+b) w l lt -1 lc rgb "#dddddd" lw 17 t '',\
'' u ($1+a):($2+b) w l lt -1 lc rgb "#cccccc" lw 15 t '',\
'' u ($1+a):($2+b) w l lt -1 lc rgb "#bbbbbb" lw 13 t '',\
'' u ($1+a):($2+b) w l lt -1 lc rgb "#aaaaaa" lw 11 t '',\
'' u ($1+a):($2+b) w l lt -1 lc rgb "#999999" lw 9 t '',\
'' u 1:2 w l lt -1 lc rgb "#ff0000" lw 10 t  ''

# delete temple data #
!rm -f thickbg.dat thick.dat

set output
