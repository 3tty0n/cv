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
	@git add docs/
	@git commit -m "deploying at $(DATE)"

update:
	@git add .
	@git commit -m "updated at $(DATE)"

.PHONY: $(APP).pdf deploy clean
