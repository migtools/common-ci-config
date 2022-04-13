### Important, the LANG_DIR must match one from Makefile
LOCAL_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
LOCAL_LANG_DIR = $(notdir $(patsubst %/,%,$(dir $(LOCAL_PATH))))

$(LOCAL_LANG_DIR)-tests:
	$(MAKE) pre-commit

pre-commit: setup-pre-commit
	. ${PYTHON_VENV}/bin/activate && pre-commit

isort: setup-pre-commit
	. ${PYTHON_VENV}/bin/activate && pre-commit run isort

flake8: setup-pre-commit
	. ${PYTHON_VENV}/bin/activate && pre-commit run flake8
