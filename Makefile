.PHONY: clean

all: html htmlsolns pdf pdfsolns
	echo All files are now up to date

html: ./docs/index.html

./docs/index.html: rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "html_document")' && \
	mv rmd-questions-and-answers.html ./docs/index.html

htmlsolns: ./docs/rmd-questions-and-answers-solutions.html

./docs/rmd-questions-and-answers-solutions.html: rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "html_document", output_file = "$(basename $<)-solutions", params = list(solutions = TRUE))' && \
	mv rmd-questions-and-answers-solutions.html ./docs/rmd-questions-and-answers-solutions.html

pdf: ./docs/rmd-questions-and-answers.pdf 

./docs/rmd-questions-and-answers.pdf: rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "pdf_document")' && \
	mv rmd-questions-and-answers.pdf ./docs/rmd-questions-and-answers.pdf

pdfsolns: ./docs/rmd-questions-and-answers-solutions.pdf

./docs/rmd-questions-and-answers-solutions.pdf: rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("$<", output_format = "pdf_document", output_file = "$(basename $<)-solutions", params = list(solutions = TRUE))' && \
	mv rmd-questions-and-answers-solutions.pdf ./docs/rmd-questions-and-answers-solutions.pdf

clean:
	rm ./docs/*