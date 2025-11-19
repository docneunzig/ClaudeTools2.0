# Clean Claude CLI Projects

This directory contains projects started with a clean Claude CLI setup (no custom agents, skills, MCP servers, or workflows).

## How to Start a New Clean Project

### Method 1: Start in This Directory (Recommended)

```bash
# Navigate to clean projects directory
cd ~/projects/CleanProjects

# Create new project
mkdir my-new-project
cd my-new-project

# Initialize git (optional)
git init

# Start Claude CLI
claude
```

**Benefits:**
- No `.claude/` directory = no custom agents, workflows, or commands
- No MCP servers loaded
- Clean, minimal Claude CLI experience
- Perfect for simple tasks or learning

### Method 2: Temporarily Disable Extensions

If you need to work in an existing directory without extensions:

```bash
# Rename .claude directory to disable it
mv .claude .claude.disabled

# Start Claude CLI (clean state)
claude

# When done, restore extensions
mv .claude.disabled .claude
```

### Method 3: Use Clean Config Profile (Advanced)

Create a minimal config for specific projects:

```bash
# In your project directory, create minimal .claude/ folder
mkdir -p .claude
echo '{}' > .claude/config.json

# Start Claude CLI
claude
```

## What Gets Disabled

When you start a project without a `.claude/` directory:

**Disabled:**
- ❌ Custom agents (orchestrator, research, writing, etc.)
- ❌ Slash commands (`/commit`, `/review`, etc.)
- ❌ Project-specific workflows
- ❌ Workflow engine
- ❌ Custom memory/templates

**Still Available:**
- ✅ All built-in Claude CLI features
- ✅ File reading/writing/editing
- ✅ Bash commands
- ✅ Web search
- ✅ Code execution
- ✅ Global MCP servers (if configured in `~/.config/claude-cli/mcp/`)

## Completely Clean Setup (No MCP Servers)

If you also want to disable global MCP servers:

```bash
# Temporarily rename MCP config
mv ~/.config/claude-cli/mcp ~/.config/claude-cli/mcp.disabled

# Start Claude CLI (completely clean)
claude

# When done, restore MCP servers
mv ~/.config/claude-cli/mcp.disabled ~/.config/claude-cli/mcp
```

## Comparing Setups

| Feature | Tools Project | Clean Project |
|---------|--------------|---------------|
| Custom Agents | 33 agents | None |
| MCP Servers | 6+ servers | None (or global only) |
| Workflows | 9+ workflows | None |
| Slash Commands | Custom commands | None |
| Complexity | High | Minimal |
| Best For | Research, complex tasks | Learning, simple tasks |

## Backup Information

Your current setup is backed up at:
`~/.config/claude-cli-backups/current-setup-YYYY-MM-DD/`

To restore your full setup in a new project:

```bash
# Copy .claude directory from Tools project
cp -r ~/projects/Tools/.claude ~/projects/new-project/

# Or create a symlink (changes will affect both)
ln -s ~/projects/Tools/.claude ~/projects/new-project/.claude
```

## Tips

1. **Start Simple**: New projects should start here by default
2. **Add Complexity When Needed**: Copy specific agents/workflows only when required
3. **Keep This Clean**: Don't add `.claude/` directories to projects in this folder
4. **Document Decisions**: If you add extensions, document why

## Example Projects

```
CleanProjects/
├── learning-python/          # No extensions, just learning
├── simple-script/            # Quick automation script
├── test-project/             # Testing new libraries
└── my-website/               # Simple web project
```

## Restoring Extensions to a Project

If you later decide a clean project needs extensions:

```bash
# Option 1: Copy minimal .claude setup
mkdir -p .claude
cp ~/projects/Tools/.claude/config.json.template .claude/config.json

# Option 2: Copy specific agents
mkdir -p .claude/agents
cp ~/projects/Tools/.claude/agents/writing-agent.md .claude/agents/

# Option 3: Copy everything
cp -r ~/projects/Tools/.claude .
```

## Questions?

- **Where is my backup?** `~/.config/claude-cli-backups/current-setup-YYYY-MM-DD/`
- **How do I check if extensions are loaded?** Start Claude and look for custom agents in the prompt
- **Can I use this with existing projects?** Yes, just don't add a `.claude/` directory
- **What if I need just one agent?** Copy only that agent's .md file to `.claude/agents/`

---

**Created:** 2025-11-15
**Purpose:** Provide clean Claude CLI environment for new projects
**Backup Location:** `~/.config/claude-cli-backups/current-setup-2025-11-15/`
