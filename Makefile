PREF=2020-NaaktgeborenC-PolyProc

clean:
	rm ${PREF}.log
	rm ${PREF}.aux
	rm ${PREF}.blg
	rm ${PREF}.bbl

${PREF}.pdf: ${PREF}.tex bibfile.bib
	pdflatex ${PREF}.tex
	bibtex   ${PREF}
	pdflatex ${PREF}.tex
	pdflatex ${PREF}.tex

