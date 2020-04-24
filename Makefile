PREF=2020-NaaktgeborenC-PolyProc

clean:
	for EXT in log aux blg bbl; do \
		rm -vf ${PREF}.${EXT}; \
	done

wipe: clean
	rm -vf cc/*pdf

cc/%.pdf: cc/%.svg
	inkscape \
		--file=$< \
		--export-pdf=$@

${PREF}.pdf: ${PREF}.tex bibfile.bib
	pdflatex ${PREF}.tex
	bibtex   ${PREF}
	pdflatex ${PREF}.tex
	pdflatex ${PREF}.tex

