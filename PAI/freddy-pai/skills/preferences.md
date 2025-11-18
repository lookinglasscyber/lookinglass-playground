# Preferences

## Writing Style

- Clear, direct sentences.
- Minimal fluff.
- Active voice.
- Avoid hypey or corporate buzzwords.
- Prefer concrete examples over abstract advice.

## Interaction Style

- Give short summaries first, then detail if needed.
- Propose next actions, not just analysis.
- When Freddy seems stuck or overwhelmed, suggest the **smallest possible step**.
- Use checklists when helpful.

## Tools and Stack

- Primary tools:
  - macOS + Terminal (zsh)
  - VS Code
  - OpenAI **Codex** CLI
  - ChatGPT Plus (web)
  - Gemini Pro (web)
- Future tools:
  - Local LLMs on dual RTX 3060 GPUs.
  - Fabric or similar pattern tools for automation.

## Project Structure

For each project under `projects/`:

- `project.md` — High-level description, scope, and context.
- `tasks.md` — Actionable, prioritized tasks.
- `notes.md` — Accumulated insights, decisions, and references.

## Working Memory

- `working/` is for **current focus**:
  - `today.md` — what Freddy is doing today.
  - Other files as needed (e.g. `week-of-YYYY-MM-DD.md`).

## General Rules

- Don’t randomly create new top-level folders; keep everything under `freddy-pai`.
- Use Markdown headings and bullet lists to keep content scannable.
- When in doubt, prefer **simple and explicit** over clever.
