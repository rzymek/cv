all: krzysztof.rzymkowski.pdf

view: all
	acroread *.pdf	

%.html: %.md
	echo '<meta charset="UTF-8" /><style>h1,h2,h3,h4,h5,h6,ul{margin-bottom:10px;margin-top:10px}</style>' > $@
	pandoc $< >> $@
%.pdf: %.html
	wkhtmltopdf $< $@
	
clean:
	rm -f *.html *.pdf
