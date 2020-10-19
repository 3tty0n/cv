APP = main
LATEXMK = latexmk

$(APP).pdf: $(APP).tex
	$(LATEXMK) $<

clean:
	$(LATEXMK) -c $(APP)

DATE := $(shell date)
deploy: docs/$(APP).pdf  update

docs/$(APP).pdf: $(APP).pdf
	@cp $< docs/
	@mv docs/main.pdf docs/cv.pdf
	@git add -f docs/
	@git commit -m "deploying at $(DATE)"
	@git push

update:
	@git add .
	@git commit -m "updated at $(DATE)"

.PHONY: docs/$(APP).pdf $(APP).pdf deploy update clean
