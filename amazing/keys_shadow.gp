
set terminal epslatex standalone color 8 size 3.2in,2.4in

#set offset 0.0, 0.0, graph 0.0, graph 0.0
set output 'keys_shadow.tex'

reset
# load must be after reset
load '../colorbrewer/qualitative/Set1.plt'

xl=0; xh=1; yl=-1; yh=1;
eps=0.010;
rx=0.55; ry=0.8; kw=0.40; kh=0.15
lh=0.06; al=0.1

key1="$x^2e^{-x}$"
key2="$\\cos(13x)e^{-3x}$"

set table 'shadowkey.dat'
splot [xl:xh] [yl:yh] x/(xh-xl)
unset table

#set object 1 rect from graph rx,ry rto kw,kh fc rgb "#aaaaaa" fs solid 1.0 lw 0.0 front
#set object 2 rect from graph rx-eps,ry+eps rto kw,kh fs border rgb "#FFFFFF" front
set object 1 rect from graph rx,ry rto kw,kh fc rgb "#aaaaaa" fs solid 1.0 border rgb "#aaaaaa" front
set object 2 rect from graph rx-eps,ry+eps rto kw,kh front
set label 1 at graph 1.1*al+rx, ry+2*lh key1 front
set label 2 at graph 1.1*al+rx, ry+lh key2 front
set arrow from graph rx, ry+2*lh rto al, 0 ls 1 lw 2.5 nohead front
set arrow from graph rx, ry+lh   rto al, 0 ls 2 lw 2.5 nohead front

unset colorbox
unset key
set palette maxcolors 256
set palette defined (0 "#8888ff", 1 "#ffffff")

set xrange [0.0:1.0]
set yrange [-1.0:1.0]

set format x "$%3.1f$"
set format y "$%3.1f$"

plot [xl:xh] [yl:yh] 'shadowkey.dat' w image, \
x*x*exp(-x) w l ls 1 lw 2.5, cos(13*x)*exp(-3*x) w l ls 2 lw 2.5

# delete temple data #
!rm -f shadowkey.dat

set output
