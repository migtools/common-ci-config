### Important, the LANG_DIR must match one from Makefile
LOCAL_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
LOCAL_LANG_DIR = $(notdir $(patsubst %/,%,$(dir $(LOCAL_PATH))))

$(LOCAL_LANG_DIR)-dev-env: $(PYTHON_VENV)
	$(info **** To run VENV: $$source ${PYTHON_VENV}/bin/activate)
	$(info **** To later deactivate VENV: $$deactivate)
	$(info **** To destroy: make go-away)

# Clean-up specific to python. Note that .venv is destroyed by
# clean-up from setup_env.mk from pre-commit.
$(LOCAL_LANG_DIR)-clean-dev-env:
	@echo "Cleaning up..."
