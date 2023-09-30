APP = yizawa
PORTFOLIO = portfolio
LATEXMK = latexmk

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

all: $(PORTFOLIO).html $(APP).pdf

$(PORTFOLIO).html: $(PORTFOLIO).tex
	make4ht -l -s $(basename $<) -c $(PORTFOLIO).cfg
	biber $(basename $<)
	make4ht -l -s $(basename $<) -c $(PORTFOLIO).cfg

$(APP).pdf: $(APP).tex
	$(LATEXMK) $<

clean:
	$(LATEXMK) -c $(APP)
	$(RM) $(PORTFOLIO).html

cleanportfolio:
	$(RM) $(PORTFOLIO).html

dist:
	cp my-bib.bib ~/Dropbox/cv/my-bib.bib

.PHONY: docs/$(APP).pdf $(APP).pdf deploy clean
