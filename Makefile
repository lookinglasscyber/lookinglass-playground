PYTHON ?= python3
VENV := .venv

.PHONY: setup lint format test run clean

setup:
	$(PYTHON) -m venv $(VENV)
	. $(VENV)/bin/activate && pip install --upgrade pip
	. $(VENV)/bin/activate && pip install -r requirements-dev.txt

lint:
	. $(VENV)/bin/activate && ruff check src tests

format:
	. $(VENV)/bin/activate && black src tests

test:
	. $(VENV)/bin/activate && pytest -q

run:
	. $(VENV)/bin/activate && $(PYTHON) -m src.main

clean:
	rm -rf $(VENV) .pytest_cache .ruff_cache
