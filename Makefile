APP = yizawa
LATEXMK = latexmk

$(APP).pdf: $(APP).tex
	$(LATEXMK) $<

clean:
	$(LATEXMK) -c $(APP)

DATE := $(shell date)
deploy: $(APP).pdf update
	@cp $(APP).pdf docs/cv.pdf
	@git add -f docs/
	@git commit -m "deploying at $(DATE)"
	@git push

update:
	@git add .
	@git commit -m "updated at $(DATE)"

.PHONY: docs/$(APP).pdf $(APP).pdf deploy update clean
