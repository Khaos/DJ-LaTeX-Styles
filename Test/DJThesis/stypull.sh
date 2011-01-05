# cp SUACSEThesis.sty ../../Source/DJThesis/PhDThesis01/SUACSEThesis.sty
cp ../../Source/DJThesis/PhDThesis01/SUACSEThesis.sty SUACSEThesis.sty
cp ../../Source/DJThesis/PhDThesis01/SUACSEThesisMath.sty SUACSEThesisMath.sty

cp ../../Source/DJThesis/PhDThesis01/SUACSEThesis.sty tmp/SUACSEThesis.sty
cp ../../Source/DJThesis/PhDThesis01/SUACSEThesisMath.sty tmp/SUACSEThesisMath.sty

# pdflatex -shell-escape -interaction=nonstopmode -file-line-error SUACSEThesis-test01.tex

# open -a Skim.app SUACSEThesis-test01.pdf