
LGFILES = *~ *.tex *.aux *-inc.eps *-inc.pdf *.log
#view="evince"
view="open"

ifdef FILE
single:
	-gnuplot $(FILE)
	-epstopdf $$(echo $(FILE)| sed "s#.gp#-inc.eps#g")
	-pdflatex $$(echo $(FILE)| sed "s#.gp#.tex#g")
	-$(view) $$(echo $(FILE)| sed "s#.gp#.pdf#g") &

show:
	-evince $$(echo $(FILE)| sed "s#.gp#.pdf#g") &

# cut the blackspace
rmsp:
	$(HOME)/bin/rmspace $$(echo $(FILE)| sed "s#.gp#.pdf#g") &
	-echo $$(echo $(FILE)| sed "s#.gp#.pdf#g")
else
all: gp pdf clean

gp:
	-for fig in $$(ls *.gp); do \
		gnuplot $${fig}; \
	done

pdf:
	-for fig in $$(ls *.tex); do \
		epstopdf $$(echo $${fig}| awk -F . '{print $$1}')-inc.eps; \
		pdflatex $${fig}; \
	done

show:
	-evince *.pdf &

rmsp:
	-for fig in $$(ls *.tex); do \
		$(HOME)/bin/rmspace $$(echo $(FILE)| sed "s#.gp#.pdf#g"); \
		echo $$(echo $(FILE)| sed "s#.gp#.pdf#g"); \
	done
endif

clean:
	-rm ${LGFILES}
	-rm -f *.pdf-original

cleanall:
	-rm ${LGFILES}
	-for fig in $$(ls *.gp); do \
		rm -f $$(echo $${fig}| awk -F . '{print $$1}').pdf; \
	done

.PHONY: single all gp pdf show clean
