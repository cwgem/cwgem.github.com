ASCIIDOC=asciidoc
ASCIIDOC_OPTIONS=-a pygments -a badges -a icons -a iconsdir=/images -b xhtml11 --theme flask
MKDIR_P=mkdir -p

SRCDIR=sources
MARKDOWN=$(shell find ./$(SRCDIR) -type f -name '*.txt')
HTML=$(MARKDOWN:%.txt=%.html)

.PHONY: all clean rebuild

all: $(HTML)

%.html : %.txt
	@$(MKDIR_P) $(dir $(subst $(SRCDIR)/,,$*.html))
	$(ASCIIDOC) $(ASCIIDOC_OPTIONS) -o $(subst $(SRCDIR)/,,$*.html) $*.txt

clean:
	- $(RM) $(subst $(SRCDIR)/,,$(HTML))

rebuild: clean all
