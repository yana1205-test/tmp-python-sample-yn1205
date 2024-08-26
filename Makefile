PYTHON := $(shell pwd)/.venv/bin/python

.venv:
	@echo Please create venv firstly

build: .venv
	@$(PYTHON) -m build

install: .venv
	@$(PYTHON) -m pip install .

install-dev: .venv
	@$(PYTHON) -m pip install ".[dev]"

format: .venv
	@$(PYTHON) -m isort .
	@$(PYTHON) -m black .

lint: .venv
	@$(PYTHON) -m pylint ./c2p ./tests

clean: .venv
	@rm -rf build *.egg-info dist
	@find ./plugins -type d \( -name '*.egg-info' -o -name 'dist' \) | while read x; do echo $$x; rm -r $$x ; done 
	@$(PYTHON) -m pyclean -v .