### Important, the LANG_DIR must match one from Makefile
LANG_DIR=go

GO_VENV:
	mkdir .venv
	mkdir .venv/bin

$(LANG_DIR)-dev-env: GO_VENV
	./$(COMMON_GIT_DIR)/makefile/scripts/install_dev_tools -v .venv -c go
	export  PATH=$PATH:.venv/bin
	export GOPATH="$HOME/go_projects"
	export GOBIN="$GOPATH/bin"
	export GOROOT=$HOME/go
	export PATH=$PATH:$GOROOT/bin


$(LANG_DIR)-clean-dev-env:
	@echo "Cleaning up..."
