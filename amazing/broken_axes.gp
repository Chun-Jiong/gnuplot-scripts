
set terminal epslatex standalone color 8 size 3.2in,2.4in

#set offset 0.0, 0.0, graph 0.0, graph 0.0
set output 'broken_axes.tex'

reset
# load must be after reset
load '../colorbrewer/qualitative/Set1.plt'

A=4.5; # This is where the break point is located
B=3.0; # This is how much is cut out of the graph
C=0;  # The lower limit of the graph
D=10;  # The upper limit (with the cut-out) of the graph
E1=-1; # The min of the y range
E2=1;  # The max of the y range
eps=0.03*(E2-E1)
eps2=0.005*(D-B-C)

f(x) = (x<A?1:1/0)
g(x) = (x>A?1:1/0)
h(x) = (x<A?x:x+B)

set xrange [C:D]
set yrange [E1:E2]

set xtics 0, 2, A

set xtics add (gprintf("%.0f", 6+B) 6)
set xtics add (gprintf("%.0f", 8+B) 8)
set xtics add (gprintf("%.0f", 10+B) 10)

set format x "%.0f"
set format y "%.1f"

set arrow 1 from A-eps2, E1 to A+eps2, E1 nohead lc rgb "#ffffff" front
set arrow 2 from A-eps2, E2 to A+eps2, E2 nohead lc rgb "#ffffff" front
set arrow 3 from A-eps-eps2, E1-eps to A+eps-eps2, E1+eps nohead front
set arrow 4 from A-eps+eps2, E1-eps to A+eps+eps2, E1+eps nohead front
set arrow 5 from A-eps-eps2, E2-eps to A+eps-eps2, E2+eps nohead front
set arrow 6 from A-eps+eps2, E2-eps to A+eps+eps2, E2+eps nohead front

plot \
   f(x)*sin(x) w lp ls 1 lw 1.5 title "$\\sin(x)$", \
g(x)*sin(h(x)) w lp ls 1 lw 1.5 notitle

set output
