### Important, the LOCAL_LANG_DIR must match one from Makefile
LOCAL_LANG_DIR=pre-commit

PYTHON_BINARY=python3

ifeq (, $(shell which $(PYTHON_BINARY) ))
  $(error "PYTHON=$(PYTHON_BINARY) binary not found in $(PATH)")
endif

ifndef PYTHON_VENV
  PYTHON_VENV=.venv
endif

$(PYTHON_VENV):
	test -d ${PYTHON_VENV} || ${PYTHON_BINARY} -m venv ${PYTHON_VENV}
	. ${PYTHON_VENV}/bin/activate && pip install -U pip
	touch ${PYTHON_VENV}

pre-commit-$(PYTHON_VENV): $(PYTHON_VENV)

$(LOCAL_LANG_DIR)-clean-env:
	rm -rf ${PYTHON_VENV}
	find . -iname "*.pyc" -delete

.PHONY: $(LANG_DIR)-$(PYTHON_VENV)
$(LOCAL_LANG_DIR)-$(PYTHON_VENV): $(PYTHON_VENV)
