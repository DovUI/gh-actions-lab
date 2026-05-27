# GitHub Actions Lab

A playground repo for experimenting with GitHub Actions.

## Workflows

| Workflow | Trigger | What it does |
|----------|---------|-------------|
| **Hello World** (`hello.yml`) | Manual (`workflow_dispatch`) | Takes a name input, prints a greeting and env info. Start here. |
| **CI** (`ci.yml`) | Push/PR to `main` | Lints for whitespace, validates JSON, runs tests, uploads artifacts. Shows job dependencies (`needs`) and matrix builds. |
| **Scheduled** (`scheduled.yml`) | Cron (Mondays 9am UTC) + manual | Runs a repo health check. Shows scheduled triggers. |

## Getting started

1. Create a new repo on GitHub
2. Push this code:
   ```bash
   cd gh-actions-lab
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/YOUR_USER/gh-actions-lab.git
   git branch -M main
   git push -u origin main
   ```
3. Go to the **Actions** tab in your repo
4. Run the "Hello World" workflow manually to verify everything works
5. Make a change and open a PR to see the CI workflow run

## Things to try

- Modify `hello.yml` to add more steps or inputs
- Add a new OS to the matrix in `ci.yml`
- Add a step that uses `${{ secrets.MY_SECRET }}` (create the secret in repo Settings > Secrets)
- Add a new workflow that builds a Docker image
- Try `if:` conditionals on steps (e.g., `if: github.event_name == 'pull_request'`)
- Add branch protection rules that require CI to pass before merging
