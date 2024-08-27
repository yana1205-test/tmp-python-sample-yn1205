build:
	python -m build

install:
	python -m pip install .

install-dev:
	python -m pip install ".[dev]"

format:
	python -m isort .
	python -m black .

lint:
	python -m pylint ./c2p ./tests

clean:
	@rm -rf build *.egg-info dist
	@find ./plugins -type d \( -name '*.egg-info' -o -name 'dist' \) | while read x; do echo $$x; rm -r $$x ; done 
	python -m pyclean -v .