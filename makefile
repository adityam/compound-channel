bsc-code.pdf : code.tex
	texexec wrapper.tex --result=bsc-code

bsc-code.tex: bsc-code.Rnw
	R CMD Sweave bsc-code.Rnw

code.tex: bsc-code.tex
	sed -e '/\(Schunk\|Sinput\)/d' \
		-e 's/\\\(begin\|end\){Soutput}/~~~~/; s/^> /    /' \
		 bsc-code.tex | pandoc -w context > code.tex
	
