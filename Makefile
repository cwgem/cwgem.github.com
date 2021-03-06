ASCIIDOC=asciidoc
ASCIIDOC_OPTIONS=-a pygments -a badges -a icons -a iconsdir=/images -a linkcss -a stylesdir=/css -a disable-javascript -a resetcss -b xhtml-lite --theme modern
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
