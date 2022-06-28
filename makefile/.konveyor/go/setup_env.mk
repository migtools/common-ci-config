### Important, the LANG_DIR must match one from Makefile
LANG_DIR=go

# We require PYTHON_VENV for the pre-commit CLI
$(LANG_DIR)-dev-env: $(PYTHON_VENV)
	./$(COMMON_GIT_DIR)/makefile/scripts/install_dev_tools -v .venv -c go

$(LANG_DIR)-clean-dev-env:
	@echo "Cleaning up..."
