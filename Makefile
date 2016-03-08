.PHONY: all bin dotfiles etc

all: bin dotfiles etc

bin:
	# add aliases for things in bin
	for file in $(shell find $(CURDIR)/bin -type f); do \
		f=$$(basename $$file); \
		sudo ln -sf $$file /usr/local/bin/$$f; \
	done

dotfiles:
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done

etc:
	for file in $(shell find $(CURDIR)/etc -type f); do \
		f=$$(echo $$file | sed -e 's|$(CURDIR)||'); \
		sudo ln -f $$file $$f; \
	done
#	systemctl --user daemon-reload
#	sudo systemctl daemon-reload
