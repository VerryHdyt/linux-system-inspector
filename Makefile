PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

.PHONY: test check install uninstall

test:
	bash tests/test_cli.sh

check:
	bash -n bin/linux-system-inspector tests/test_cli.sh

install:
	install -Dm755 bin/linux-system-inspector "$(DESTDIR)$(BINDIR)/linux-system-inspector"

uninstall:
	rm -f "$(DESTDIR)$(BINDIR)/linux-system-inspector"
