SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

ASSIGNMENTS = $(wildcard assignment_*.tex)
SOLUTIONS = $(ASSIGNMENTS:.tex=_solution.tex)

CODE=$(wildcard code/**)
IMAGES=$(wildcard images/**)

# Since we can't know where we use which sample code or image, we always have to
# rebuild when we change some file there.
OTHER_FILES=preamble.tex $(CODE) $(IMAGES)

all: $(addprefix out/, $(ASSIGNMENTS:.tex=.pdf) $(SOLUTIONS:.tex=.pdf))

%_solution.tex: %.tex $(OTHER_FILES)
	cp $< $@
	sed -i '1s;^;\\def\\issolution{1}\n;' $@

out/%.pdf: %.tex $(OTHER_FILES)
	latexmk $<
	latexmk -c $<

clean:
	rm -f $(ASSIGNMENTS:.tex=.pdf) $(SOLUTIONS:.tex=.pdf)
	rm -rf out

# You probably never have to call this unless you explicitly built some solution
# tex files.
distclean:
	rm -rf $(SOLUTIONS)

.PHONY: all clean distclean
