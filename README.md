# claude-echolog

> **Stop rediscovering. Every fix, insight, and pattern Claude finds is silently logged and never forgotten.**

[![Version](https://img.shields.io/badge/version-0.5.0-blue)](https://github.com/goyaljai/claude-echolog)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)
[![Platform](https://img.shields.io/badge/platform-Claude%20Code-purple)](https://claude.ai/code)
[![Zero Setup](https://img.shields.io/badge/setup-zero%20effort-orange)]()

---

You set up Kafka last month. Claude fixed a nasty rebalancing bug. New project, same stack — Claude starts from scratch. **Again.**

`claude-echolog` fixes that. Every meaningful insight gets logged. Every new session, Claude already knows.

---

## How It Works

```
You work normally
    ↓
Claude completes something meaningful
    ↓
~/claude-echolog.md  ← silently appended
    ↓
Next session starts → Claude reads it → builds on it
```

---

## Log Format

3 lines. Strict. Generic. Reusable by anyone.

```markdown
## 2026-05-27
**What:** Fixed Kafka consumer group rebalancing issue on slow message processors in Spring Boot.
**How:** Low timeout values cause rebalance loops — both configs must be tuned together to fix.
**Key:** max.poll.interval.ms=600000, session.timeout.ms=30000 in application.yml consumer config.
```

```markdown
## 2026-05-27 [error-fix]
**What:** npm install failing with EACCES permission denied on fresh Mac machine setup.
**How:** npm global directory owned by root — transferring ownership to current user fixes permanently.
**Key:** sudo chown -R $(whoami) ~/.npm
```

Works for **everyone** — code, design, presentations, PDF, data, anything.

---

## Hooks

| Hook | Trigger | Does |
|------|---------|------|
| `UserPromptSubmit` | Every session start | Injects `~/claude-echolog.md` into context |
| `PostToolUse` | After Write / Edit / Bash | Prompts Claude to log if work was meaningful |
| `PreCompact` | Before `/compact` | Logs before context wipe — nothing lost |
| `PostCompact` | After `/compact` | Re-injects knowledge base to resume context |
| `Stop` | On `/exit` | Writes final session summary |

---

## Install

> Run in your **terminal** — not inside a Claude session.

```bash
claude plugin marketplace add goyaljai/claude-echolog
claude plugin install claude-echolog@claude-echolog-marketplace
```

**Inside a Claude session?** Use `!` prefix:
```
! claude plugin marketplace add goyaljai/claude-echolog
! claude plugin install claude-echolog@claude-echolog-marketplace
```

**Then activate** (one-time consent):
```bash
touch ~/.claude/echolog-consent.flag
```

---

## Commands

| Command | Does |
|---------|------|
| `/echolog` | Manually inject full knowledge base into current session |

---

## What Runs On Your Machine

| Script | When | What |
|--------|------|------|
| `inject-knowledge.sh` | Session start | Reads `~/claude-echolog.md` → injects into context |
| `post-tool-prompt.sh` | After tool use | Reminds Claude to log meaningful work |
| `pre-compact-prompt.sh` | Before compact | Reminds Claude to log before wipe |
| `inject-post-compact.sh` | After compact | Re-injects knowledge base |
| `cleanup-session.sh` | On exit | Deletes session flag + prompts final log |

No network calls. No telemetry. Writes only to `~/claude-echolog.md`.

[View source →](https://github.com/goyaljai/claude-echolog/tree/main/scripts)

---

## Your Knowledge Base

`~/claude-echolog.md` — plain markdown, local, yours forever.

- Read it anytime
- Share with teammates for instant knowledge transfer  
- It compounds — every session makes Claude smarter

---

## Privacy

Everything stays on your machine. `~/claude-echolog.md` never leaves unless you choose to share it.

---

## License

MIT — [goyaljai](https://github.com/goyaljai)

*Built because Claude kept forgetting. Now it doesn't.*
