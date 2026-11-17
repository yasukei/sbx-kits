# sbx-kits

My personal [Docker Sandboxes](https://docs.docker.com/ai/sandboxes/) kits (schema v3).

## Kits

| Kit | Kind | Description |
|---|---|---|
| [`base`](base/) | mixin | Git identity, and GitHub SSH/git URLs rewritten to HTTPS |
| [`claude-config`](claude-config/) | mixin | Claude Code status line. Requires `claude` |
| [`codex-config`](codex-config/) | mixin | Codex status line. Requires `codex` |

## Develop

```sh
# Validate
sbx kit validate ./base

# Inspect the resolved kit
sbx kit inspect ./base                 # summary
sbx kit inspect ./base --format yaml   # full content

# Use in a new sandbox
sbx run claude --kit ./base --kit ./claude-config
sbx run codex --kit ./base --kit ./codex-config
```

## Usage

```sh
# Allow github.com/yasukei/
sbx settings set kit.allowedSources '["docker.io/","dhi.io/","github.com/yasukei/"]'

# Run a new sandbox
sbx run shell \
  --kit sbx/claude-mixin \
  --kit sbx/codex-mixin \
  --kit "git+https://github.com/yasukei/sbx-kits.git#dir=base" \
  --kit "git+https://github.com/yasukei/sbx-kits.git#dir=claude-config" \
  --kit "git+https://github.com/yasukei/sbx-kits.git#dir=codex-config"
```

