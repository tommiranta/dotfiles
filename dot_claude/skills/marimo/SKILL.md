---
name: marimo
description: Start working on a marimo notebook. Use when the user wants to create or edit marimo notebooks for data science workflows.
argument-hint: [notebook-path]
---

# Marimo Notebook Development Session

You are starting a marimo notebook development session. Follow these guidelines:

## Setup Checklist

Before making any edits, confirm with the user:

1. **Is marimo running with `--watch`?** The user should have started marimo with:
   ```bash
   uv run marimo edit --watch <notebook-path>
   ```
   This is required for Claude's edits to appear in real-time.

2. **What notebook are we working on?** If not specified as an argument, ask for the notebook file path.

## Context Files

Request the user add these to context if not already present:
- The target notebook file (e.g., `@notebooks/my_analysis.py`)
- Any relevant helper modules or data files

## Working with Marimo

When editing notebooks, remember:

- **Only edit cell contents** inside `@app.cell` decorators
- Marimo handles function parameters and return statements automatically
- Each edit should look like:
  ```python
  @app.cell
  def _():
      <your code here>
      return
  ```
- **Never redeclare variables** across cells
- **UI element values** must be accessed in a separate cell from where they're defined
- The **last expression** in a cell is automatically displayed

## Preferred Libraries

- **polars** for data manipulation (not pandas)
- **altair** for visualizations (with tooltips)
- **mo.sql()** for DuckDB queries
- **boto3** via helper modules for AWS services

## Starting the Session

Ask the user:

1. What is the goal for this notebook session? (e.g., data exploration, visualization, AWS integration)
2. Do you have a specific notebook file to edit, or should we create a new one?
3. Is marimo running with `--watch`?

Arguments provided: $ARGUMENTS
