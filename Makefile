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
	$(TEX) $(texfile)
	$(BIB) $(texfile)
	$(IDX) $(texfile)
	$(TEX) $(texfile)
	$(TEX) $(texfile)

clean:
	@find . | egrep "\.(aux|log|out|gz|toc|bak|bbl|blg|ilg|ind)" | xargs rm -f
	@rm -f $(texfile).idx
	@find . | egrep "\.pdf" | xargs rm -f
	@find . | egrep "~" | xargs rm -f
	@find $(subdir) | egrep "\.(aux|tmp)" | xargs rm -f
	@find $(subdir) | egrep "~" | xargs rm -f
