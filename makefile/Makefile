### Konveyor Makefile template

ifndef LANG_DIR
  LANG_DIR=python
endif

ifndef PROJECT_MAKEFILE
  PROJECT_MAKEFILE=Makefile.mk
endif

# Makefile targets which are common across all projects
.PHONY: tests
.PHONY: dev-env clean-dev-env

tests:
	$(MAKE) $(LANG_DIR)-tests

dev-env:
	$(MAKE) $(LANG_DIR)-dev-env

clean-dev-env:
	$(MAKE) $(LANG_DIR)-clean-dev-env

### Python environment is needed to run pre-commit CLI
include ./python/setup_env.mk
setup-pre-commit: $(PYTHON_VENV)
	. ${PYTHON_VENV}/bin/activate && pip install pre-commit \
	  > ${PYTHON_VENV}/pre-commit-install.log

### Include lanuguage specific parts of the Makefile
ifneq ("$(wildcard $(LANG_DIR)/tests.mk)","")
    include ./$(LANG_DIR)/tests.mk
endif

# Include project specific Makefile
ifneq ("$(wildcard $(PROJECT_MAKEFILE))","")
    include $(PROJECT_MAKEFILE)
endif
