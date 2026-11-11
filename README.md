# sbx-kits

My personal [Docker Sandboxes](https://docs.docker.com/ai/sandboxes/) kits (schema v3).

## Kits

| Kit | Kind | Description |
|---|---|---|
| [`base`](base/) | mixin | Git identity, and GitHub SSH/git URLs rewritten to HTTPS |
| [`claude-config`](claude-config/) | mixin | Claude Code status line (model, effort, dir, context %, 5h/7d rate limits with reset time). Requires `claude` |

## Usage

```sh
# Validate
sbx kit validate ./base

# Inspect the resolved kit
sbx kit inspect ./base                 # summary
sbx kit inspect ./base --format yaml   # full content

# Use in a new sandbox
sbx run claude --kit ./base --kit ./claude-config
```

