unalias gbr 2>/dev/null || true

gbr() {
  local branch

  branch=$(
    git for-each-ref \
      --sort=-committerdate \
      --format='%(refname:short)%09%(committerdate:relative)' \
      refs/heads/ |
    fzf \
      --ansi \
      --delimiter=$'\t' \
      --with-nth=1,2 \
      --prompt='branch> '
  )

  [[ -z "$branch" ]] && return

  branch="${branch%%$'\t'*}"
  git switch "$branch"
}
