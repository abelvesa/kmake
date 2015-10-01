# We need to support our own make rules of course!
## With nothing to compile, all we do here is install rules

# Follow the standard autoconf rules for install paths
DESTDIR?=
PREFIX?=/usr/local/

bindir:=$(DESTDIR)$(PREFIX)/bin
completiondir:=$(DESTDIR)/etc/bash_completion.d

INSTALL?=install -D

all:
configure:

install:
	$(INSTALL) kmake $(bindir)
	$(INSTALL) bash_completion.d/kmake.completion $(completiondir)
