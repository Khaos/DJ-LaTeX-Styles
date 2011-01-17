
main = SUACSEThesis-test01
support = SUACSEThesis.sty SUACSEThesisMath.sty
chapters = \
  frontmatter abstract acknowledgements

.PHONY: $(chapters) show clean glotest bibtextest bibertest pdflatexonly

show: $(main).pdf
	open -a Skim.app $<
	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'

thesis: $(main).pdf

bibtextest:
	pdflatex -shell-escape -file-line-error $(main); \
	bibtex $(main); \
	pdflatex -shell-escape -file-line-error $(main)

bibertest:
	pdflatex -shell-escape -file-line-error $(main); \
	biber $(main); \
	pdflatex -shell-escape -file-line-error $(main)

glotest:
	pdflatex -shell-escape -file-line-error $(main); \
	makeindex -s $(main).gst -o $(main).gls $(main).glo; \
	pdflatex -shell-escape -file-line-error $(main)

pdflatexonly:
	pdflatex -shell-escape -file-line-error $(main)

clean:
	-rm -f *.pdf *.log *.aux *.bbl *.bcf *.blg *.figlist *.glo *.gls *.lof *.lot *.xml *.gz *.toc

$(main).pdf: $(main).tex $(support) $(main).gst
	pdflatex -shell-escape -file-line-error $(main); \
	biber $(main); \
	makeindex -s $(main).gst -o $(main).gls $(main).glo; \
	pdflatex -shell-escape -file-line-error $(main); \
	pdflatex -shell-escape -file-line-error $(main)

ch-%.pdf: %.tex ch-%.bbl ch-%.aux $(support)
	pdflatex --shell-escape --jobname=ch-$* \
	  "\includeonly{$*}\input{$(main)}"

ch-%.bbl: $(main).bbl
	cp $(main).bbl ch-$*.bbl

ch-%.aux: $(main).aux
	cp $(main).aux ch-$*.aux
