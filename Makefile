.PHONY: clean

all: html pdf
	echo All files are now up to date

html: ./docs/index.html

./docs/index.html: rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "html_document")' && \
	mv rmd-questions-and-answers.html ./docs/index.html

pdf: ./docs/rmd-questions-and-answers.pdf 

./docs/rmd-questions-and-answers.pdf: rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "pdf_document")' && \
	mv rmd-questions-and-answers.pdf ./docs/rmd-questions-and-answers.pdf

clean:
	rm ./docs/*