# Git Helpers

Small everyday git workflow helpers.

- **`update_branch.sh`** — stashes your work-in-progress, fetches and rebases
  the current branch onto `development` (only if it's actually behind), then
  restores your stash. Aborts the rebase and restores your stash if the
  rebase hits conflicts, instead of leaving the repo mid-rebase.
- **`merge_stashes.sh`** — a worked example for applying a specific stash
  and resolving each conflicted file by concatenating both versions (current
  + stashed) rather than picking one — useful when a stash and the working
  tree both added independent content to the same file (e.g. two people
  appending new test cases) and you want to keep both rather than overwrite
  one.

## Author

Juan Correa
