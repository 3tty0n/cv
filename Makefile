APP = yizawa
LATEXMK = latexmk

DATE := $(shell date)
deploy: $(APP).pdf
	@cp $(APP).pdf docs
	@git add -f docs/
	@git commit -m "deploying at $(DATE)"
	@git push
	@git add .
	@git commit -m "update at $(DATE)"
	@git push

$(APP).pdf: $(APP).tex
	$(LATEXMK) $<

clean:
	$(LATEXMK) -c $(APP)

dist:
	cp my-bib.bib ~/Dropbox/cv/my-bib.bib

.PHONY: docs/$(APP).pdf $(APP).pdf deploy clean
