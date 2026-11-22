# sbx-kits

My personal [Docker Sandboxes](https://docs.docker.com/ai/sandboxes/) kits (schema v3).

## Kits

| Kit | Kind | Description |
|---|---|---|
| [`base`](base/) | mixin | Git identity, and GitHub SSH/git URLs rewritten to HTTPS |
| [`network`](network/) | mixin | Common network allow list (e.g. `deb.debian.org`) |
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
sbx run claude --kit ./base --kit ./network --kit ./claude-config
sbx run codex --kit ./base --kit ./network --kit ./codex-config
```

## Usage

See [yasukei/sbx-workspace](https://github.com/yasukei/sbx-workspace).
