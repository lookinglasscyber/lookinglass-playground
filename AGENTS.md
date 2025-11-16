# Repository Guidelines

## Project Structure & Module Organization
- `src/` holds all runtime modules; keep feature-specific packages under `src/agents` or `src/services` so imports stay clean (`python -m src.main` bootstraps experiments).
- `tests/` mirrors the source tree and only stores `test_*.py` modules; fixtures or shared helpers belong in `tests/support`.
- `assets/` is the drop zone for prompt corpora, sample JSON, or notebooks that agents depend on, while `infra/` keeps deployment manifests or IaC snippets.
- Use `scripts/` for repeatable operational tasks (data refreshers, smoke demos) and `docs/` for deep dives referenced from this guide.

## Build, Test, and Development Commands
- `make setup` creates `.venv` and installs dev dependencies from `requirements-dev.txt`.
- `make lint` runs Ruff on `src/` and `tests/` to catch style or import issues quickly.
- `make format` applies Black to normalize indentation and wrapping before review.
- `make test` executes the Pytest suite; combine with `-k pattern` for scoped runs.
- `make run` launches `python -m src.main`, which is the entry point for local agent sandboxes.

## Coding Style & Naming Conventions
- Target Python 3.11+, 4-space indentation, and type annotate every public callable.
- Module names are snake_case, classes are PascalCase, constants are UPPER_SNAKE; favor dependency injection over globals so agents stay composable.
- Lint with Ruff (`ruff check`) and format with Black (`black src tests`) before committing; both rulesets must pass CI.
- Store secrets via environment variables or `.env` ignored in Git; never hard-code API keys inside `src/`.

## Testing Guidelines
- Pytest is the single test runner; each behavior gets a `test_<feature>.py` file colocated with mirrors of the runtime package tree.
- Aim for ≥80% coverage on agent orchestration modules and always include at least one integration-style test per agent pipeline.
- Use descriptive names (`test_agent_handles_rate_limits`) and rely on fixtures for network stubs placed in `tests/conftest.py`.
- Run `make test` locally and ensure new tests fail without the targeted change.

## Commit & Pull Request Guidelines
- Follow Conventional Commits (`feat: add sentiment agent`, `fix: patch rate limiter`) so automation can infer release notes.
- Keep PRs small (<400 lines) with a summary, screenshots or logs if UX/output changes, and links to any Jira/GitHub issue.
- Require green CI (lint + tests) before requesting review; tag a reviewer familiar with the touched area and note any follow-up TODOs in the description.
