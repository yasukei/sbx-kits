#!/usr/bin/env bash
# Claude Code status line:
#   model | effort | dir | ctx:N% | 5h:N% (reset in XhYYm) | 7d:N%
# Segments with no data are omitted.

input=$(cat)
get() { jq -r "$1" <<<"$input"; }

model=$(get '.model.display_name')
effort=$(get '.effort.level // empty')
cwd=$(get '.workspace.current_dir')
ctx=$(get '.context_window.used_percentage // empty')
five=$(get '.rate_limits.five_hour.used_percentage // empty')
reset=$(get '.rate_limits.five_hour.resets_at // empty | floor')
seven=$(get '.rate_limits.seven_day.used_percentage // empty')

# Show "<repo> / <worktree>" when inside a Claude Code worktree.
case "$cwd" in
  */.claude/worktrees/*)
    tree=${cwd#*/.claude/worktrees/}
    dir="$(basename "${cwd%%/.claude/worktrees/*}") / ${tree%%/*}"
    ;;
  *)
    dir=$(basename "$cwd")
    ;;
esac

printf '\033[36m%s\033[0m' "$model"
[ -n "$effort" ] && printf ' | \033[35m%s\033[0m' "$effort"
printf ' | \033[34m%s\033[0m' "$dir"
[ -n "$ctx" ] && printf ' | \033[33mctx:%.0f%%\033[0m' "$ctx"
if [ -n "$five" ]; then
  printf ' | \033[32m5h:%.0f%%\033[0m' "$five"
  if [ -n "$reset" ]; then
    s=$((reset - $(date +%s)))
    [ "$s" -lt 0 ] && s=0
    printf '\033[32m (reset in %dh%02dm)\033[0m' $((s / 3600)) $((s % 3600 / 60))
  fi
fi
[ -n "$seven" ] && printf ' | \033[31m7d:%.0f%%\033[0m' "$seven"
true
