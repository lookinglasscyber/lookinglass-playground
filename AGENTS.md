# Repository Guidelines

## Project Structure & Module Organization
`src/` hosts the runtime modules, with `src/main.py` providing the `python -m src.main` entry point; add new logic in subpackages under `src/` with clear `__init__.py` exports so imports stay predictable. `tests/` mirrors the source tree through `tests/test_<feature>.py`, while shared fixtures and fakes should live in `tests/conftest.py`. Keep sample payloads inside `assets/`, deep-dive notes inside `docs/`, infrastructure artifacts in `infra/`, and reusable utilities in `scripts/` so every task can be invoked consistently via the `Makefile`.

## Build, Test, and Development Commands
Run `make setup` once to create `.venv` and install everything listed in `requirements-dev.txt`. `make lint` (Ruff) and `make format` (Black) keep the codebase review-ready, while `make test`—or a targeted `pytest -q tests/test_smoke.py`—executes the suite. Use `make run` for a local smoke of the entry point and `make clean` whenever the environment or caches need a reset.

## Coding Style & Naming Conventions
Target Python 3.11+, rely on 4-space indentation, and annotate all public callables so the agent surfaces remain composable. Modules stay snake_case, classes use PascalCase, and constants are UPPER_SNAKE_CASE; pass dependencies explicitly rather than introducing hidden globals. Always run `ruff check` and `black src tests` before committing, and keep credentials in environment variables or ignored `.env` files instead of source control.

## Testing Guidelines
Pytest is the sole framework, so every module ships alongside unit coverage plus an integration-style guard whenever it orchestrates external systems. Write descriptive names (`test_agent_handles_rate_limits`), centralize fixtures in `tests/conftest.py`, and avoid bespoke mocks that obscure failures. Aim for roughly 80% line coverage across `src/`, confirm that new tests fail without the fix, and finish each change with `make test`.

## Commit & Pull Request Guidelines
History already follows Conventional Commits (`ci: add lint and test workflow`, `chore: bootstrap repository`), so continue using scoped prefixes such as `feat:` or `fix:`. Pull requests must describe intent, link the tracking issue, and attach logs or screenshots when output changes; keep diffs focused (<400 lines when practical) and list any follow-up TODOs. Request review only once lint and tests pass, and call out the manual validation you performed in the description.
