# Contributing Guide

Thank you for your interest in contributing to this project.

## Branching Strategy

This repository follows a Git Flow-inspired workflow.

- `main` – Production-ready code
- `develop` – Integration branch
- `feature/*` – Feature development

## Development Workflow

1. Create a feature branch from `develop`.
2. Make focused changes.
3. Commit using Conventional Commits.
4. Push the branch to GitHub.
5. Open a Pull Request into `develop`.
6. Merge after review.

## Commit Message Format

Examples:

```text
feat: add EKS cluster module

fix: correct IAM policy

docs: update deployment guide

ci: add GitHub Actions workflow

refactor: simplify Helm values
```

## Code Standards

- Follow production best practices.
- Keep commits small and focused.
- Update documentation whenever functionality changes.
- Never commit secrets or credentials.
