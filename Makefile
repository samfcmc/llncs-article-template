BASENAME=article
NAME=$(BASENAME).tex
PDF=$(BASENAME).pdf
LATEX_COMPILER=pdflatex
LATEX_FLAGS=-shell-escape
GLOSSARIES_COMPILER=makeglossaries
BIB_COMPILER=bibtex
TRASH_FILES=*.aux .bb *.bl *.lo *.lo *.nl *.ou *.to *.bc *.run.xml *.bbl *.blg *.fdb_latexmk *.fls *.log *.toc *.synctex.gz *.acn *.glo *.ist *.lof *.lot *.out *.acr *.alg *.glg *.gls *.glsdefs *.lol *.dvi


all: build

pdf:
	$(LATEX_COMPILER) $(LATEX_FLAGS) $(NAME)

bibliography: pdf
	$(BIB_COMPILER) $(BASENAME)

bibliography_pdf: bibliography
	$(LATEX_COMPILER) $(LATEX_FLAGS) $(NAME)
	$(LATEX_COMPILER) $(LATEX_FLAGS) $(NAME)

glossaries: pdf
	$(GLOSSARIES_COMPILER) $(BASENAME)

glossaries_pdf: glossaries
	$(LATEX_COMPILER) $(LATEX_FLAGS) $(NAME)

build: pdf glossaries bibliography_pdf

clean:
	rm -f $(TRASH_FILES) $(PDF)
