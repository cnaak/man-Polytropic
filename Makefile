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

fig/%.pdf: fig/%.svg
	inkscape \
		--file=$< \
		--export-pdf=$@

${PREF}.pdf: ${PREF}.tex \
		cc/by-nc-nd.pdf \
		fig/idealDieselExample.pdf \
		fig/nonExactPolytropic.pdf \
		bibfile.bib
	pdflatex --enable-write18 ${PREF}.tex
	bibtex ${PREF}
	pdflatex --enable-write18 ${PREF}.tex
	pdflatex --enable-write18 ${PREF}.tex

