#!/bin/bash

# ClaudeTools 2.0 Installation Script
# Installs file organization system components to ~/.claude/

set -e  # Exit on error

echo "========================================="
echo "ClaudeTools 2.0 Installation"
echo "========================================="
echo ""

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if ~/.claude exists
if [ ! -d ~/.claude ]; then
    echo -e "${YELLOW}Warning: ~/.claude directory not found${NC}"
    echo "Creating ~/.claude directory..."
    mkdir -p ~/.claude
fi

echo -e "${GREEN}Installing ClaudeTools 2.0 components...${NC}"
echo ""

# 1. Install Global CLAUDE.md
echo "1. Installing Global CLAUDE.md..."
if [ -f ~/.claude/CLAUDE.md ]; then
    echo -e "${YELLOW}   Backing up existing CLAUDE.md to CLAUDE.md.backup$(date +%Y%m%d_%H%M%S)${NC}"
    cp ~/.claude/CLAUDE.md ~/.claude/CLAUDE.md.backup$(date +%Y%m%d_%H%M%S)
fi
cp .claude/CLAUDE.md ~/.claude/CLAUDE.md
echo -e "${GREEN}   ✓ Global CLAUDE.md installed${NC}"
echo ""

# 2. Install Skills
echo "2. Installing Skills..."
mkdir -p ~/.claude/skills
cp .claude/skills/file-organization.md ~/.claude/skills/
echo -e "${GREEN}   ✓ file-organization skill installed${NC}"
echo ""

# 3. Install Workflows
echo "3. Installing Workflows..."
mkdir -p ~/.claude/workflows
cp .claude/workflows/file-organization.yaml ~/.claude/workflows/
cp .claude/workflows/mcp-server-lifecycle.yaml ~/.claude/workflows/
echo -e "${GREEN}   ✓ file-organization workflow installed${NC}"
echo -e "${GREEN}   ✓ mcp-server-lifecycle workflow installed${NC}"
echo ""

# 4. Install Agents
echo "4. Installing Agents..."
mkdir -p ~/.claude/agents
if [ -f ~/.claude/agents/administrative-automation-agent.md ]; then
    echo -e "${YELLOW}   Backing up existing administrative-automation-agent.md${NC}"
    cp ~/.claude/agents/administrative-automation-agent.md \
       ~/.claude/agents/administrative-automation-agent.md.backup$(date +%Y%m%d_%H%M%S)
fi
cp .claude/agents/administrative-automation-agent.md ~/.claude/agents/
echo -e "${GREEN}   ✓ administrative-automation-agent installed (updated)${NC}"
echo ""

# 5. Install Project Template
echo "5. Installing Project Template..."
mkdir -p ~/.claude/projects
if [ -d ~/.claude/projects/clean-project-template ]; then
    echo -e "${YELLOW}   Removing existing project template${NC}"
    rm -rf ~/.claude/projects/clean-project-template
fi
cp -r .claude/projects/clean-project-template ~/.claude/projects/
echo -e "${GREEN}   ✓ clean-project-template installed${NC}"
echo ""

# 6. Verify Installation
echo "6. Verifying Installation..."
ERRORS=0

if [ ! -f ~/.claude/CLAUDE.md ]; then
    echo -e "${RED}   ✗ CLAUDE.md not found${NC}"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}   ✓ CLAUDE.md verified${NC}"
fi

if [ ! -f ~/.claude/skills/file-organization.md ]; then
    echo -e "${RED}   ✗ file-organization skill not found${NC}"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}   ✓ file-organization skill verified${NC}"
fi

if [ ! -f ~/.claude/workflows/file-organization.yaml ]; then
    echo -e "${RED}   ✗ file-organization workflow not found${NC}"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}   ✓ file-organization workflow verified${NC}"
fi

if [ ! -f ~/.claude/agents/administrative-automation-agent.md ]; then
    echo -e "${RED}   ✗ administrative-automation-agent not found${NC}"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}   ✓ administrative-automation-agent verified${NC}"
fi

if [ ! -d ~/.claude/projects/clean-project-template ]; then
    echo -e "${RED}   ✗ clean-project-template not found${NC}"
    ERRORS=$((ERRORS + 1))
else
    echo -e "${GREEN}   ✓ clean-project-template verified${NC}"
fi

echo ""

if [ $ERRORS -eq 0 ]; then
    echo "========================================="
    echo -e "${GREEN}Installation Complete! ✓${NC}"
    echo "========================================="
    echo ""
    echo "ClaudeTools 2.0 has been successfully installed."
    echo ""
    echo "Installed Components:"
    echo "  • Global CLAUDE.md with File Organization Standards"
    echo "  • file-organization skill (proactive triggers)"
    echo "  • file-organization workflow (8-step orchestration)"
    echo "  • administrative-automation-agent (updated)"
    echo "  • clean-project-template (pre-organized structure)"
    echo ""
    echo "Next Steps:"
    echo "  1. Start Claude CLI in any project"
    echo "  2. Create .md or .txt files - they'll auto-organize!"
    echo "  3. Or start a new project:"
    echo "     cp -r ~/.claude/projects/clean-project-template ~/projects/my-project"
    echo ""
    echo "Documentation: See docs/ directory"
    echo "Repository: https://github.com/docneunzig/ClaudeTools2.0"
    echo ""
else
    echo "========================================="
    echo -e "${RED}Installation Completed with Errors${NC}"
    echo "========================================="
    echo ""
    echo -e "${RED}$ERRORS error(s) occurred during installation.${NC}"
    echo "Please check the output above and retry."
    echo ""
    exit 1
fi
