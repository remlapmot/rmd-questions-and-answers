all : index.html rmd-questions-and-answers.pdf
	echo All files are now up to date

index.html : rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("rmd-questions-and-answers.Rmd", output_format = "html_document")'
	mv rmd-questions-and-answers.html ./docs/index.html

rmd-questions-and-answers.pdf : rmd-questions-and-answers.Rmd
	Rscript -e 'rmarkdown::render("rmd-questions-and-answers.Rmd", output_format = "pdf_document")'
	mv rmd-questions-and-answers.pdf ./docs/rmd-questions-and-answers.pdf