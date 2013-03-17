ASCIIDOC=asciidoc
ASCIIDOC_OPTIONS=-a pygments -a badges -a icons -a iconsdir=/images -b custom --theme flask
MKDIR_P=mkdir -p

SRCDIR=sources
MARKDOWN=$(shell find ./$(SRCDIR) -type f -name '*.asciidoc')
HTML=$(MARKDOWN:%.asciidoc=%.html)

.PHONY: all clean rebuild

all: $(HTML)

%.html : %.asciidoc
	@$(MKDIR_P) $(dir $(subst $(SRCDIR)/,,$*.html))
	$(ASCIIDOC) $(ASCIIDOC_OPTIONS) -o $(subst $(SRCDIR)/,,$*.html) $*.asciidoc

clean:
	- $(RM) $(subst $(SRCDIR)/,,$(HTML))

rebuild: clean all
