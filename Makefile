APP = main
LATEXMK = latexmk

$(APP).pdf: $(APP).tex
	$(LATEXMK) $<

clean:
	$(LATEXMK) -c $(APP)

DATE := $(shell date)
deploy: $(APP).pdf
	@cp $< docs/
	@git add docs/
	@git commit -m "deploying at $(DATE)"

.PHONY: $(APP).pdf deploy clean
