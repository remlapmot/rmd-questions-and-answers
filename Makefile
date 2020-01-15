.PHONY: all html pdf clean

all: html pdf
	echo All files are now up to date

html: rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("rmd-questions-and-answers.Rmd", output_format = "html_document")' && \
	mv rmd-questions-and-answers.html ./docs/index.html

pdf: rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("rmd-questions-and-answers.Rmd", output_format = "pdf_document")' && \
	mv rmd-questions-and-answers.pdf ./docs/rmd-questions-and-answers.pdf

clean:
	rm ./docs/*