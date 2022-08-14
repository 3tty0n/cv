APP = yizawa
PORTFOLIO = portfolio
LATEXMK = latexmk

DATE := $(shell date)
deploy: all
	@cp $(APP).pdf docs
	@cp $(PORTFOLIO).html docs
	@git add -f docs/
	@git commit -m "deploying at $(DATE)"
	@git push
	@git add .
	@git commit -m "update at $(DATE)"
	@git push

all: $(PORTFOLIO).html $(APP).pdf

$(PORTFOLIO).html: $(PORTFOLIO).tex
	make4ht -l -s $(basename $<)
	biber $(basename $<)
	make4ht -l -s $(basename $<)

$(APP).pdf: $(APP).tex
	$(LATEXMK) $<

clean:
	$(LATEXMK) -c $(APP)

dist:
	cp my-bib.bib ~/Dropbox/cv/my-bib.bib

.PHONY: docs/$(APP).pdf $(APP).pdf deploy clean
