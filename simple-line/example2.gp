
load '../colorbrewer/qualitative/Set1.plt'
set terminal epslatex standalone color 8 size 3.2in,2.4in

#set offset 0.0, 0.0, graph 0.0, graph 0.0
set output 'example2.tex'

set xrange [1.0:1e4]
set yrange [1e-12:2.0]

#set ytics 0.4

set format x "$10^{%L}$"
set format y "$10^{%L}$"

set xlabel "$r$"
set ylabel "$C(r)$" offset 1.5,0.0

set key bottom left
set key spacing 1.5
set key sample 2
set key box

set logscale xy
set sample 40

f(x,a)=x**(-a)

plot \
for [i=1:4:1] f(x,i) w lp ls i pt 2+i*2 ps 1 title "$r^{-".i."}$"

set output
