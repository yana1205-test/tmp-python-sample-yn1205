.PHONY: build
build:
	python -m build

.PHONY: install
install:
	python -m pip install .

.PHONY: install-dev
install-dev:
	python -m pip install ".[dev]"

.PHONY: format
format:
	python -m isort .
	python -m black .

.PHONY: lint
lint:
	python -m pylint ./c2p ./tests

.PHONY: test
test: ARGS ?= 
test: TARGET ?= tests/
test:
	@OUTPUT_PATH=/dev/null python -m pytest $(ARGS) $(TARGET)

.PHONY: it
it: ARGS ?= 
it: TARGET ?= it/
it:
	@OUTPUT_PATH=/dev/null pytest $(ARGS) $(TARGET)

.PHONY: clean
clean:
	@rm -rf build *.egg-info dist
	@find ./plugins -type d \( -name '*.egg-info' -o -name 'dist' \) | while read x; do echo $$x; rm -r $$x ; done 
	python -m pyclean -v .