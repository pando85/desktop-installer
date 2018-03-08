VENV_BASE += .venv
VENV_BIN := $(VENV_BASE)/bin
PROJECT := desktop-installer

export PATH := $(pwd)/$(VENV_BIN):$(PATH)

.PHONY: venv requirements \
		test yamllint flake8 ansible-lint check clean

venv:
	if [ ! -d "$(VENV_BASE)" ]; then \
		virtualenv -p python2 $(VENV_BASE); \
	fi

requirements: venv
	${VENV_BIN}/pip install -r requirements.txt

test: check
	cd roles/vscode/ && \
	../../${VENV_BIN}/molecule test

yamllint: requirements
	${VENV_BIN}/$@ roles

flake8: requirements
	${VENV_BIN}/$@ roles

ansible-lint: requirements
	${VENV_BIN}/$@ roles

check: yamllint flake8 ansible-lint

clean:
	rm -rf $(VENV_BASE)
