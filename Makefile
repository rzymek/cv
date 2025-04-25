all: krzysztof.rzymkowski.pdf Makefile

view: all
	xreader *.pdf	

%.html: cv/%.md
	echo '<meta charset="UTF-8" /><style>h1,h2,h3,h4,h5,h6,ul{margin-bottom:10px;margin-top:10px}</style>' > $@
	pandoc $< >> $@
%.pdf: %.html
	wkhtmltopdf --margin-top 2cm --margin-bottom 2cm --margin-left 2cm --margin-right 2cm $< $@
setup:
	sudo apt-get install wkhtmltopdf pandoc 
clean:
	rm -f *.html *.pdf
