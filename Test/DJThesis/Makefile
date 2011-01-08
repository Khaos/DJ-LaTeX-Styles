
main = SUACSEThesis-test01
support = SUACSEThesis.sty SUACSEThesisMath.sty
chapters = \
  frontmatter abstract acknowledgements

.PHONY: $(chapters) show clean glotest

show: $(main).pdf
	open -a Skim.app $<
	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'

thesis: $(main).pdf

glotest:
	pdflatex -shell-escape -interaction=nonstopmode -file-line-error $(main); \
	makeindex -s $(main).gst -o $(main).gls $(main).glo; \
	pdflatex -shell-escape -interaction=nonstopmode -file-line-error $(main)

clean:
	-rm -f *.pdf *.log *.aux *.bib *.figlist *.glo *.lof *.lot *.xml *.gz *.toc

# $(main).pdf: $(main).tex $(addsuffix .tex,$(chapters)) $(support)
# 	pdflatex --shell-escape $(main); \
# 	bibtex $(main)
