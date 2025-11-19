# Quick Start: Clean Claude CLI Project

## 🚀 Fastest Method (30 seconds)

```bash
# 1. Navigate to clean projects
cd ~/projects/CleanProjects

# 2. Create your project
mkdir my-project
cd my-project

# 3. Start Claude
claude
```

**That's it!** No `.claude/` directory = completely clean setup.

---

## What You Get

✅ **Clean State:**
- No custom agents
- No workflows
- No slash commands
- No MCP servers (unless globally configured)

✅ **Still Available:**
- File operations (Read, Write, Edit)
- Bash commands
- Web search
- All core Claude CLI features

---

## Common Use Cases

### Simple Script

```bash
cd ~/projects/CleanProjects
mkdir python-script
cd python-script
claude
# Ask: "Help me write a script to process CSV files"
```

### Learning

```bash
cd ~/projects/CleanProjects
mkdir learn-rust
cd learn-rust
claude
# Ask: "Teach me Rust basics with examples"
```

### Quick Test

```bash
cd ~/projects/CleanProjects
mkdir test-library
cd test-library
claude
# Ask: "Show me how to use library X"
```

---

## Adding Extensions Later

If you decide you need agents/workflows:

```bash
# Copy specific agent
mkdir -p .claude/agents
cp ~/projects/Tools/.claude/agents/writing-agent.md .claude/agents/

# Copy everything
cp -r ~/projects/Tools/.claude .
```

---

## Disabling Extensions in Existing Project

```bash
# Temporarily disable
mv .claude .claude.disabled
claude

# Restore
mv .claude.disabled .claude
```

---

## Troubleshooting

**Q: I still see custom agents**
A: Check for `.claude/` directory: `ls -la .claude`

**Q: How do I know it's clean?**
A: No agent names in startup message, no custom slash commands

**Q: Where's my backup?**
A: `~/.config/claude-cli-backups/current-setup-2025-11-15/`

---

**Need the full guide?** See `README.md` in this directory.
