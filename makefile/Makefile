### Konveyor Makefile template

MK_SCRIPTS_DIR=.konveyor

LANG_DIR ?= python

ifndef PROJECT_MAKEFILE
  PROJECT_MAKEFILE=Makefile.mk
endif

# note the following is required for the makefile help
## TARGET: DESCRIPTION
## ------: -----------
## help: print each make target with a description
.PHONY: help
help:
	@echo ""
	@(printf ""; sed -n 's/^## //p' Makefile) | column -t -s :

# Makefile targets which are common across all projects
.PHONY: tests
.PHONY: dev-env go-away

## tests: execute the available unit or itegration tests
tests:
	$(MAKE) $(LANG_DIR)-tests

## dev-env: create the language specific development environment
dev-env:
	$(MAKE) $(LANG_DIR)-dev-env

## go-away: remove the development environment files added by the dev-env command
go-away:
	$(MAKE) $(LANG_DIR)-clean-dev-env
	$(MAKE) pre-commit-clean-env

### Python environment is needed to run pre-commit CLI
include ./$(MK_SCRIPTS_DIR)/pre-commit/setup_env.mk
setup-pre-commit: pre-commit-$(PYTHON_VENV)
	. ${PYTHON_VENV}/bin/activate && pip install pre-commit \
	  > ${PYTHON_VENV}/pre-commit-install.log

ifneq ("$(wildcard ./$(MK_SCRIPTS_DIR)/$(LANG_DIR)/setup_env.mk)","")
    include ./$(MK_SCRIPTS_DIR)/$(LANG_DIR)/setup_env.mk
endif

### Include lanuguage specific parts of the Makefile
ifneq ("$(wildcard ./$(MK_SCRIPTS_DIR)/$(LANG_DIR)/tests.mk)","")
    include ./$(MK_SCRIPTS_DIR)/$(LANG_DIR)/tests.mk
endif

# Include project specific Makefile
ifneq ("$(wildcard $(PROJECT_MAKEFILE))","")
    include $(PROJECT_MAKEFILE)
endif
