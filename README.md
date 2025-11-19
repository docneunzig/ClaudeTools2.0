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

## 📚 Documentation

See [QUICK_START.md](QUICK_START.md) for rapid onboarding.

Complete documentation available in `docs/`:
- [Implementation Report](docs/implementation/2024-11-19_impl_file-organization-system.md) - Complete system details
- [System Health Check](docs/reports/2024-11-19_report_system-health-check.md) - Testing results (100% pass)

## 🚀 Quick Start

### Starting New Projects

```bash
cp -r ~/.claude/projects/clean-project-template/ ~/projects/my-new-project/
cd ~/projects/my-new-project/
# Documentation auto-organizes!
```

### Organizing Existing Projects

Ask Claude: `"Organize the files in this project"`

Claude automatically:
1. Classifies documents by content
2. Generates standardized names  
3. Creates docs/ structure
4. Moves files to proper categories
5. Stores patterns for future learning

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

- **Global CLAUDE.md**: File organization standards
- **file-organization skill**: Classification rules and workflow
- **file-organization.yaml**: 8-step orchestration workflow
- **administrative-automation-agent**: Automatic execution
- **clean-project-template**: Pre-organized project starter

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

## 📞 Contact

**Dr. Arnd Heuser**  
Platform Director - Animal Phenotyping Platform  
Max Delbrück Center (MDC Berlin)  
Email: phenotyping@mdc-berlin.de

---

**🤖 Built with [Claude Code](https://claude.com/claude-code)**

**Co-Authored-By: Claude <noreply@anthropic.com>**
