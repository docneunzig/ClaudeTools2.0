# ClaudeTools 2.0

> Automated file organization system for Claude CLI with intelligent document classification, standardized naming conventions, and memory-enhanced learning.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Claude Code](https://img.shields.io/badge/Claude-Code-blue)](https://claude.com/claude-code)
[![Status](https://img.shields.io/badge/Status-Production%20Ready-brightgreen)](https://github.com/docneunzig/ClaudeTools2.0)

---

## 🎯 Overview

**ClaudeTools 2.0** is a comprehensive file organization system designed for Claude CLI that automatically organizes project documentation into standardized structures with intelligent classification, consistent naming conventions, and continuous learning through memory integration.

Built for the **MDC Research Infrastructure** (Max Delbrück Center, Berlin), this system seamlessly integrates with existing Claude CLI workflows, MCP servers, and agents to provide effortless documentation management.

## ✨ Key Features

- 🤖 **Intelligent Classification**: Automatic document type detection based on content analysis
- 📂 **Organized Structure**: Standardized docs/ directory with category subdirectories  
- 📝 **Smart Naming**: Automatic conversion to `YYYY-MM-DD_type_description.md` format
- 🧠 **Memory Learning**: Continuous improvement through Memory MCP integration
- 🔧 **Zero Config**: Works out-of-the-box, leverages existing MCP infrastructure
- ✅ **Production Ready**: 100% test pass rate (55/55 tests)

## 🚀 Installation

### Quick Install (Recommended)

```bash
# Clone the repository
git clone https://github.com/docneunzig/ClaudeTools2.0.git
cd ClaudeTools2.0

# Run installation script
./install.sh
```

The install script will:
- ✅ Install global CLAUDE.md with file organization standards
- ✅ Install file-organization skill (proactive triggers)
- ✅ Install file-organization workflow (8-step orchestration)
- ✅ Update administrative-automation-agent (if exists) or install new
- ✅ Install clean-project-template for new projects
- ✅ Verify all components installed correctly
- ✅ Backup existing files before overwriting

### Manual Installation

If you prefer manual installation:

```bash
# 1. Copy global CLAUDE.md
cp .claude/CLAUDE.md ~/.claude/CLAUDE.md

# 2. Copy skill
mkdir -p ~/.claude/skills
cp .claude/skills/file-organization.md ~/.claude/skills/

# 3. Copy workflows
mkdir -p ~/.claude/workflows
cp .claude/workflows/file-organization.yaml ~/.claude/workflows/
cp .claude/workflows/mcp-server-lifecycle.yaml ~/.claude/workflows/

# 4. Copy agent
mkdir -p ~/.claude/agents
cp .claude/agents/administrative-automation-agent.md ~/.claude/agents/

# 5. Copy project template
mkdir -p ~/.claude/projects
cp -r .claude/projects/clean-project-template ~/.claude/projects/
```

### Verification

After installation, verify the system:

```bash
# Check all components are in place
ls -la ~/.claude/CLAUDE.md
ls -la ~/.claude/skills/file-organization.md
ls -la ~/.claude/workflows/file-organization.yaml
ls -la ~/.claude/agents/administrative-automation-agent.md
ls -la ~/.claude/projects/clean-project-template/
```

## 📚 Documentation

See [QUICK_START.md](QUICK_START.md) for rapid onboarding.

Complete documentation available in `docs/`:
- [Implementation Report](docs/implementation/2024-11-19_impl_file-organization-system.md) - Complete system details
- [System Health Check](docs/reports/2024-11-19_report_system-health-check.md) - Testing results (100% pass)

## 🎬 Getting Started

### Starting New Projects

```bash
# Copy the template
cp -r ~/.claude/projects/clean-project-template/ ~/projects/my-new-project/
cd ~/projects/my-new-project/

# Start creating documentation - auto-organizes!
# Files are automatically classified and moved to docs/ subdirectories
```

### Organizing Existing Projects

Ask Claude: `"Organize the files in this project"`

Claude automatically:
1. Classifies documents by content
2. Generates standardized names  
3. Creates docs/ structure
4. Moves files to proper categories
5. Stores patterns for future learning

### Automatic Organization

Files are automatically organized when:
- Creating new `.md` or `.txt` files in project root
- User explicitly requests "organize files"
- End of work session cleanup

## 📂 Directory Structure

```
project-root/
├── README.md
├── QUICK_START.md
└── docs/
    ├── implementation/    # Implementation reports, technical docs
    ├── specifications/    # Specs, requirements, architecture
    ├── analysis/         # Analysis, assessments, evaluations
    ├── reports/          # Test reports, status reports
    └── planning/         # Strategic plans, roadmaps
```

## 🧪 Test Results

**Status**: ✅ **ALL SYSTEMS OPERATIONAL** (100% pass rate)

| Component | Tests Passed |
|-----------|--------------|
| MCP Servers | 6/6 ✅ |
| Skills | 2/2 ✅ |
| Workflows | 7/7 ✅ |
| Agents | 27/27 ✅ |
| Templates | 1/1 ✅ |
| File Organization | 12/12 ✅ |

## 🛠️ Components

### Installed Components

| Component | Location | Purpose |
|-----------|----------|---------|
| **Global CLAUDE.md** | `~/.claude/CLAUDE.md` | File organization standards |
| **file-organization skill** | `~/.claude/skills/` | Classification rules and workflow |
| **file-organization.yaml** | `~/.claude/workflows/` | 8-step orchestration workflow |
| **mcp-server-lifecycle.yaml** | `~/.claude/workflows/` | MCP server management |
| **administrative-automation-agent** | `~/.claude/agents/` | Automatic execution |
| **clean-project-template** | `~/.claude/projects/` | Pre-organized project starter |

### System Architecture

```
User creates document.md
    ↓
Global CLAUDE.md mandates organization
    ↓
Claude invokes file-organization skill (proactive)
    ↓
Administrative-automation-agent executes
    ↓
Workflow-mcp orchestrates steps
    ↓
1. Analyze content (filesystem MCP)
2. Check memory for patterns (memory MCP)
3. Classify document type
4. Generate standardized filename
5. Move to docs/{category}/
6. Update cross-references
7. Store pattern in memory
    ↓
Document organized ✓
Memory improved ✓
```

## 📖 Classification Rules

| Document Type | Keywords | Location |
|--------------|----------|----------|
| Implementation | PHASE, IMPLEMENTATION, COMPLETE, MIGRATION | `docs/implementation/` |
| Specification | SPEC, STRATEGY, REQUIREMENTS, ARCHITECTURE | `docs/specifications/` |
| Analysis | ANALYSIS, ASSESSMENT, EVALUATION, REVIEW | `docs/analysis/` |
| Report | REPORT, TEST, RESULTS, METRICS | `docs/reports/` |
| Planning | PLAN, ROADMAP, TODO, TIMELINE | `docs/planning/` |

## 🎓 Use Cases

### Research Infrastructure
- Technical documentation organization
- Grant application tracking
- Quarterly report management
- Publication archival

### Software Development
- Implementation report structure
- Specification tracking
- Test report organization
- Planning document management

### MDC Platform Director
- Platform reporting automation
- Financial tracking
- Stakeholder communication
- User statistics management

## 🔧 Requirements

### Prerequisites

- **Claude CLI** installed and configured
- **MCP Servers** (optional but recommended):
  - `workflow-mcp` - For workflow orchestration
  - `filesystem` - For file operations
  - `memory` - For learning patterns

### Compatibility

- ✅ macOS (tested)
- ✅ Linux (compatible)
- ✅ Windows (with WSL)

## 🤝 Contributing

This system is designed for the MDC research infrastructure but can be adapted for other use cases.

### Reporting Issues

Report issues via [GitHub Issues](https://github.com/docneunzig/ClaudeTools2.0/issues).

### Extensions

The system is designed to be extensible:
- Add new document types
- Create custom classification rules
- Define project-specific categories
- Build specialized templates

## 📜 License

MIT License - See [LICENSE](LICENSE) file for details

## 🙏 Acknowledgments

Built for the **Max Delbrück Center (MDC Berlin)** research infrastructure.

Developed using:
- [Claude Code](https://claude.com/claude-code)
- [Model Context Protocol (MCP)](https://modelcontextprotocol.io/)
- Modern AI-assisted development practices

## 📞 Contact

**Dr. Arnd Heuser**  
Platform Director - Animal Phenotyping Platform  
Max Delbrück Center (MDC Berlin)  
Email: phenotyping@mdc-berlin.de

## 🔗 Resources

- **Repository**: https://github.com/docneunzig/ClaudeTools2.0
- **Documentation**: See `docs/` directory
- **Quick Start**: [QUICK_START.md](QUICK_START.md)
- **Installation**: Run `./install.sh`

---

**🤖 Built with [Claude Code](https://claude.com/claude-code)**

**Co-Authored-By: Claude <noreply@anthropic.com>**
