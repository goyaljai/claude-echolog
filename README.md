# claude-echolog

**Stop rediscovering. Every fix, insight, and pattern Claude finds is silently logged and never forgotten.**

You set up Kafka last month and hit a weird rebalancing issue. Claude fixed it. New project, same stack — Claude starts from scratch. Again.

`claude-echolog` fixes that. Every meaningful task, fix, and insight Claude discovers gets automatically logged to a local knowledge base. Every new session, Claude reads it first. No commands. No manual effort. Just use Claude normally.

---

## How It Works

```
You work normally
    → Claude completes something meaningful
    → Silently appended to ~/claude-echolog.md

Next session starts
    → Claude reads ~/claude-echolog.md automatically
    → Already knows your Kafka fix, your Docker flag, your PDF trick
    → Builds on it instead of starting from scratch
```

---

## The Log Format

Every entry is 3 lines — strict, generic, reusable:

```
## 2026-05-27
**What:** Fixed Kafka consumer group rebalancing issue on slow message processors.
**How:** Low timeout values cause rebalance loops — both configs must be tuned together.
**Key:** max.poll.interval.ms=600000, session.timeout.ms=30000 in application.yml
```

```
## 2026-05-27 [error-fix]
**What:** npm install failing with EACCES permission denied on fresh Mac setup.
**How:** npm global directory owned by root — needs ownership transferred to current user.
**Key:** sudo chown -R $(whoami) ~/.npm
```

**Works for everyone** — development, design, presentations, PDF manipulation, anything Claude does.

---

## Hooks

Five hooks. All automatic. Nothing to remember.

| Hook | Does |
|------|------|
| `UserPromptSubmit` | Injects knowledge base on first prompt of session |
| `PostToolUse` | Logs after substantive work — strict criteria, no noise |
| `PreCompact` | Logs before context wipe — nothing lost mid-session |
| `PostCompact` | Reinjects full knowledge base after compaction |
| `Stop` | Writes final session summary, resets for next session |

---

## Install

### Option 1: Claude Code Marketplace (recommended)

**If installing from your terminal:**
```bash
claude plugin marketplace add goyaljai/claude-echolog
claude plugin install claude-echolog@claude-echolog-marketplace
```

**If installing from inside a Claude Code session** (use `!` prefix to run directly):
```
! claude plugin marketplace add goyaljai/claude-echolog
! claude plugin install claude-echolog@claude-echolog-marketplace
```

> The `!` prefix bypasses Claude's safety check — it runs the command directly in your terminal.

### Option 2: Manual

```bash
git clone https://github.com/goyaljai/claude-echolog ~/claude-echolog
cd ~/claude-echolog
bash bin/setup.sh
```

---

## Commands

| Command | Does |
|---------|------|
| `/echolog` | Manually inject full knowledge base into current session |

---

## Your Knowledge Base

Lives at `~/claude-echolog.md`. Plain markdown. Yours forever.

- Open it anytime to read what was built and learned
- Share it with teammates for instant knowledge transfer
- It compounds — every session makes Claude smarter

---

## What Gets Logged

**Yes:**
- Non-obvious configs and commands that solved real problems
- Error fixes with exact reproduction and solution
- Patterns and approaches that work across projects

**No:**
- Trivial changes (typo fixes, formatting)
- Project-specific logic that won't apply elsewhere
- Conversational sessions with no real output

The rule: *if a teammate starting fresh would benefit from knowing this, it gets logged.*

---

## Privacy

Everything stays local. `~/claude-echolog.md` never leaves your machine unless you choose to share it.

---

## License

MIT — [goyaljai](https://github.com/goyaljai)

*Built because Claude kept forgetting. Now it doesn't.*
