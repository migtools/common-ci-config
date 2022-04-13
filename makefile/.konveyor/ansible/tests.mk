LOCAL_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
LOCAL_LANG_DIR = $(notdir $(patsubst %/,%,$(dir $(LOCAL_PATH))))

$(LOCAL_LANG_DIR)-tests:
	$(MAKE) pre-commit

pre-commit: setup-pre-commit
	. ${PYTHON_VENV}/bin/activate && pre-commit