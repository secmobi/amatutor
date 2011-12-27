texfile = amatutor-cn
reffile = ama
subdir = chapter-cn

TEX = xelatex
BIB = bibtex

all: $(texfile).pdf

pdf: all

$(texfile).pdf: $(texfile).tex $(reffile).bib $(subdir)/*.tex
	$(TEX) $(texfile).tex
	$(BIB) $(texfile).aux
	$(TEX) $(texfile).tex
	$(TEX) $(texfile).tex

clean:
	@find . | egrep "\.(aux|idx|log|out|gz|toc|bak|bbl|blg)" | xargs rm -f
	@find . | egrep "\.pdf" | xargs rm -f
	@find . | egrep "~" | xargs rm -f
	@find $(subdir) | egrep "\.aux" | xargs rm -f
	@find $(subdir) | egrep "~" | xargs rm -f
