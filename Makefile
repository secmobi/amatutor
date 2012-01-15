texfile = amatutor-cn
reffile = $(texfile)
styfile = $(texfile)
subdir = chapter-cn

TEX = xelatex
BIB = bibtex
IDX = makeindex

all: $(texfile).pdf

pdf: all

$(texfile).pdf: $(texfile).tex $(styfile).sty $(reffile).bib $(subdir)/*.tex
	$(TEX) $(texfile).tex
	$(BIB) $(texfile).aux
	$(IDX) $(texfile).idx
	$(TEX) $(texfile).tex
	$(TEX) $(texfile).tex

clean:
	@find . | egrep "\.(aux|idx|log|out|gz|toc|bak|bbl|blg|ilg|ind)" | xargs rm -f
	@find . | egrep "\.pdf" | xargs rm -f
	@find . | egrep "~" | xargs rm -f
	@find $(subdir) | egrep "\.(aux|tmp)" | xargs rm -f
	@find $(subdir) | egrep "~" | xargs rm -f
