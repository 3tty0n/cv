APP = yizawa
PORTFOLIO = portfolio
LATEXMK = latexmk
CSS = solarized-light.min.css

DATE := $(shell date)
deploy: all
	@cp $(APP).pdf docs
	@cp $(PORTFOLIO).html $(PORTFOLIO).css docs
	@git add -f docs/
	@git commit -m "deploying at $(DATE)"
	@git push
	@git add .
	@git commit -m "update at $(DATE)"
	@git push

all: $(PORTFOLIO).html css $(APP).pdf

$(PORTFOLIO): $(PORTFOLIO).html

$(PORTFOLIO).html: $(PORTFOLIO).tex $(PORTFOLIO).cfg my-bib.bib
	make4ht -l -s $(basename $<) -c $(PORTFOLIO).cfg
	biber $(basename $<)
	make4ht -l -s $(basename $<) -c $(PORTFOLIO).cfg

css:
	cp $(CSS) docs

$(APP).pdf: $(APP).tex
	$(LATEXMK) $<

clean:
	$(LATEXMK) -c $(APP)
	$(RM) $(PORTFOLIO).html

clean-portfolio:
	$(RM) $(PORTFOLIO).html

dist:
	cp my-bib.bib ~/Dropbox/cv/my-bib.bib

.PHONY: docs/$(APP).pdf $(APP).pdf css deploy clean
