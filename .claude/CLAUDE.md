# Project Conventions - MDC Research Environment

## Overview
This is a scientific research environment for cardiovascular and molecular medicine research at the Max Delbrück Center (MDC Berlin). The system combines agent-based workflows with MCP servers for comprehensive research automation.

## Directory Structure

```
~/.claude/
├── agents/                    # Legacy agents (being migrated)
├── skills/
│   └── mcp/                   # MCP server management skills
├── plugins/
│   ├── local/                 # Local custom plugins
│   │   ├── scientific-research/
│   │   ├── scientific-writing/
│   │   ├── data-science/
│   │   ├── development-tools/
│   │   ├── devops-tools/
│   │   └── agent-system/
│   ├── marketplaces/          # Installed marketplace plugins
│   └── cache/
├── mcp/                       # MCP server system
│   ├── servers/
│   ├── runtime/
│   ├── generated/
│   └── templates/
└── workflows/
```

## Agent Organization Philosophy

### Plugin-Based Architecture
- **Single Responsibility**: Each plugin focuses on one domain
- **3-4 Components**: Average per plugin (optimal token efficiency)
- **Model Assignment**: 55% Haiku (fast/cheap), 45% Sonnet (complex reasoning)

### Agent Naming Conventions
- Format: `{domain}-{role}.md`
- Style: Lowercase, hyphen-separated
- Examples: `research-agent.md`, `manuscript-critic.md`, `github-expert.md`

## Development Standards

### Python
- Version: 3.12+
- Package Manager: `uv` (preferred) or `pip`
- Virtual Environments: Always use for projects
- Style: Black formatting, type hints required
- Testing: pytest with >80% coverage

### Data Analysis
- Primary Tools: Python (pandas, numpy, scipy, matplotlib, seaborn)
- Secondary: R for specialized stats
- Notebooks: Jupyter for exploratory analysis
- Production: Scripts in .py files with proper structure

### Scientific Writing
- Format: Markdown for drafts, LaTeX for final papers
- Style: IMRAD structure (Introduction, Methods, Results, Discussion)
- Citations: BibTeX format
- Figures: Publication-quality (300 DPI, colorblind-safe palettes)

## File Organization Standards

### Document Structure

All project documentation follows this standardized structure:

```
project-root/
├── README.md                    # Project overview (stays in root)
├── QUICK_START.md              # Quick reference (stays in root)
└── docs/
    ├── implementation/         # Implementation reports, technical docs
    ├── specifications/         # Specs, requirements, architecture
    ├── analysis/              # Analysis, assessments, evaluations
    ├── reports/               # Test reports, completion reports
    ├── grants/                # Grant applications (MDC Platform projects)
    ├── presentations/         # Slides, talks (MDC Platform projects)
    ├── publications/          # Papers, manuscripts (MDC Platform projects)
    ├── administrative/        # Admin docs, SOPs (MDC Platform projects)
    └── planning/              # Strategic plans, roadmaps
```

**Note**: Categories are project-specific. Software projects typically use the first 4 categories (implementation, specifications, analysis, reports). MDC Platform projects may use extended categories (grants, presentations, publications, administrative, planning).

### Naming Conventions

#### Dated Documents
Format: `YYYY-MM-DD_type_description.md`

**Examples**:
- `2024-11-15_impl_plugin-architecture-phase-1.md`
- `2024-11-16_spec_office365-integration.md`
- `2024-11-16_analysis_brutal-assessment.md`
- `2024-11-15_report_plugin-architecture-test.md`

**Type Abbreviations**:
- `impl` - Implementation
- `spec` - Specification
- `analysis` - Analysis
- `report` - Report
- `planning` - Planning

#### Permanent Documents
Format: `description.md` (no date prefix)

**Examples**:
- `README.md`
- `QUICK_START.md`
- `architecture-overview.md`
- `api-reference.md`

### Document Type Classification

| Type | Keywords | Content Indicators | Location |
|------|----------|-------------------|----------|
| **Implementation** | PHASE, IMPLEMENTATION, COMPLETE, MIGRATION | Code examples, technical details, past-tense descriptions | `docs/implementation/` |
| **Specification** | SPECIFICATION, STRATEGY, REQUIREMENTS, ARCHITECTURE | Future-tense, planning sections, requirements lists | `docs/specifications/` |
| **Analysis** | ANALYSIS, ASSESSMENT, EVALUATION, REVIEW | Data/findings, conclusions, recommendations | `docs/analysis/` |
| **Report** | REPORT, TEST, RESULTS, METRICS | Test results, metrics tables, pass/fail criteria | `docs/reports/` |
| **Planning** | PLAN, ROADMAP, TODO, TIMELINE | Future goals, milestones, schedules | `docs/planning/` |

### Auto-Organization Rules

**When creating new documentation files (.md, .txt, .pdf)**:

1. **Detect document type** from content and filename keywords
2. **Check memory MCP** for learned classification patterns
3. **Apply naming convention**:
   - Add YYYY-MM-DD prefix if one-time document (report, analysis)
   - No date for living documents (README, specs that evolve)
   - Convert to lowercase-kebab-case
4. **Ensure directory structure exists** (create if missing)
5. **Move file to correct location** under docs/
6. **Update cross-references** in other files if needed
7. **Store classification pattern** in memory MCP for learning

**Whitelisted Root Files** (never move these):
- README.md
- QUICK_START.md
- LICENSE
- .gitignore
- CHANGELOG.md
- CONTRIBUTING.md

### Project Template Usage

When starting a new project in `~/projects/CleanProjects/`:

```bash
# Copy the template
cp -r ~/.claude/projects/clean-project-template/ ~/projects/CleanProjects/my-new-project/
cd ~/projects/CleanProjects/my-new-project/

# Customize README.md with project details
# All subsequent documentation will auto-organize into docs/
```

Projects started with the template begin with proper organization from day 1.

### Integration with Agents

The `administrative-automation-agent` proactively monitors for new documentation files and automatically organizes them according to these standards. The `file-organization` skill codifies these rules into an executable workflow.

**Trigger Points**:
- Creating new .md/.txt files in project root
- User explicitly requests "organize files"
- End of work session cleanup

## MCP Server Usage

### Available Servers
- **pubmed-mcp**: PubMed literature search and paper retrieval
- **knowledge-graph-mcp**: Research paper relationship tracking
- **visualization-mcp**: Publication-quality plots
- **jupyter-mcp**: Code execution in Python/R kernels
- **tavily**: Web search and content extraction
- **gemini-mcp**: Google Gemini AI integration
- **fal-ai**: Image generation and manipulation
- **workflow-mcp**: Workflow automation
- **github**: Repository operations (via installed plugins)

### MCP Server Architect
The `mcp-server-architect` agent automatically:
- Discovers existing servers
- Suggests relevant servers for tasks
- Generates new servers when needed
- Validates and deploys servers
- Learns usage patterns

## Research Workflow

### Literature Review
1. Use `research-agent` or `academic-research-synthesizer`
2. Search PubMed via `pubmed-mcp`
3. Add papers to knowledge graph via `knowledge-graph-mcp`
4. Analyze relationships and trends

### Data Analysis
1. Use `data-analysis-agent` for statistical analysis
2. Execute code via `jupyter-mcp`
3. Create visualizations via `visualization-agent`
4. Generate publication-quality figures

### Scientific Writing
1. Draft with `writing-agent`
2. Review with `manuscript-critic`
3. Create presentations with `presentation-agent`
4. Iterate based on feedback

## Git Workflow

### Commit Standards
- Format: `{type}: {description}`
- Types: feat, fix, docs, style, refactor, test, chore
- Always include Co-Authored-By for AI assistance
- Example: `feat: Add knowledge graph analysis for MDC research portfolio`

### Branch Strategy
- Main branch: `main`
- Feature branches: `feature/{description}`
- Always create PRs for significant changes

## Testing Conventions

### Test Organization
- Unit tests: `tests/test_{module}.py`
- Integration tests: `tests/integration/`
- Test coverage: Minimum 80%, target 90%+

### Test Execution
```bash
pytest                    # Run all tests
pytest -v                # Verbose output
pytest --cov            # With coverage report
```

## Performance Considerations

### Token Efficiency
- Use discovery-first patterns (MCP)
- Restrict agent tool access to necessities
- Use Haiku for deterministic tasks
- Use Sonnet for complex reasoning
- Use Opus sparingly (<1% of tasks)

### Caching
- MCP discovery cache: 5-minute TTL
- Usage patterns tracked in SQLite
- Pattern learning improves suggestions

## User Profile & Responsibilities

### Role & Position
- **Position**: Platform Director - Animal Phenotyping Platform (APP)
- **Position**: Director - Preclinical Research Center (PRC)
- **Institution**: Max Delbrück Center (MDC Berlin)
- **Name**: Dr. Arnd Heuser
- **Contact**: Robert-Rössle-Str. 10, 13125 Berlin
- **Email**: phenotyping@mdc-berlin.de

### Primary Responsibilities (Work Time Distribution)

#### Leadership & Administration (~75% of time)
1. **Administrative Reports** (15%)
   - Quarterly platform reports
   - Annual PRC reports
   - Committee reports (Tierschutz, Animal Welfare, Scientific Advisory Board)
   - User statistics and impact metrics

2. **Presentations** (10%)
   - Stakeholder updates (MDC Directors, Helmholtz)
   - Funding pitches (DFG, EU panels)
   - Conference presentations (FELASA, ESLAV, LASA)
   - Internal training and SOPs

3. **Grant Applications** (15%)
   - DFG (Sachbeihilfe, Großgeräte, SFB)
   - EU Horizon Europe (ERC, MSCA, Research Infrastructures)
   - MDC internal funding schemes
   - Platform sustainability proposals

4. **Scientific Writing** (10%)
   - Research papers
   - Method development publications
   - Platform papers
   - Collaborative publications

5. **Email Communication** (15%)
   - User support and booking management
   - Stakeholder coordination
   - Staff management
   - External collaborations

6. **Financial Planning** (10%)
   - Annual budget planning
   - Quarterly financial tracking
   - User fee optimization
   - Equipment ROI analysis
   - Cost-revenue modeling

7. **Personnel Management** (10%)
   - Staff performance reviews
   - Hiring and recruitment
   - Training coordination
   - Project assignments

8. **Stakeholder Management** (5%)
   - MDC leadership coordination
   - Helmholtz reporting
   - External partnerships
   - Industry collaborations

#### Technical & Strategic (~25% of time)
9. **Platform Method Development** (10%)
   - Multi-modal imaging protocols
   - Workflow optimization
   - Quality control procedures
   - Data analysis pipeline improvement

10. **Strategic Planning** (5%)
    - Equipment investment decisions
    - Platform expansion
    - Service portfolio development
    - Competitive positioning

11. **Research Collaboration** (5%)
    - Joint projects with PIs
    - Method validation studies
    - Pilot studies

12. **Continuous Improvement** (5%)
    - Technology evaluation
    - Process optimization
    - User feedback integration

### Platform Capabilities (APP)

#### Imaging Modalities
- **Micro-CT (μCT)**: Cardiac function, bone density, tumor volume
- **MRI**: Tissue characterization, cardiac imaging, brain imaging
- **High-frequency Ultrasound**: Real-time cardiac function, vascular imaging
- **Photoacoustic Imaging**: Vascular structure, oxygen saturation
- **Multi-photon Microscopy**: High-resolution tissue imaging

#### Animal Models
- **Species**: Mice, Rats
- **Applications**: Cardiovascular disease, cancer, neuroscience, metabolism
- **Phenotyping Focus**: Cardiac function, bone health, tumor growth, vascular changes

#### User Base
- Internal: MDC researchers (CVR, Neuroscience, Cancer, Metabolism)
- External: Charité, other Helmholtz centers, pharmaceutical companies
- Annual users: 40-50 active projects
- Publications: 15-20 papers/year acknowledging APP

### Key Strategic Priorities

1. **Automation Priorities**
   - High: Administrative workflows (reports, presentations, grants)
   - High: Financial planning and tracking
   - Medium: Email communication templates
   - Medium: Imaging data analysis pipelines
   - Low: Routine documentation

2. **Platform Development Goals**
   - Increase throughput 20% annually
   - Establish 2-3 new methods per year
   - Publish platform methodology papers
   - Expand external user base

3. **Funding Objectives**
   - Secure equipment upgrades (€500k-1M annually)
   - Platform sustainability funding
   - Method development grants
   - Training program support

### Work Style & Preferences

- **Focus**: Dual-track approach - Leadership efficiency + Platform innovation
- **Decision-making**: Data-driven, evidence-based
- **Communication**: Professional, concise, stakeholder-appropriate
- **Documentation**: Standardized templates, reproducible workflows
- **Automation**: High ROI activities prioritized
- **Quality**: Publication-grade outputs, institutional compliance

### Common Workflows

1. **Quarterly Reporting Cycle**
   - Data collection → Analysis → Visualization → Report + Presentation
   - Audience: MDC Directors, Helmholtz coordinators
   - Deadline: Within 2 weeks of quarter end

2. **Grant Application Process**
   - Literature review → Preliminary data → Budget → Writing → Review
   - Timeline: 4-6 weeks per application
   - Frequency: 3-5 applications per year

3. **Stakeholder Presentations**
   - Metrics dashboard → Highlights → Financial → Outlook
   - Frequency: Monthly updates, Quarterly deep-dives
   - Format: 15-20 slides, 15-30 min presentation

4. **Budget Planning**
   - Historical analysis → Revenue projection → Cost planning → Scenarios
   - Timeline: Annual (November-December) + Quarterly tracking
   - Tool: Excel workbooks with dashboards

### Domain-Specific Notes

#### Cardiovascular Research
- Focus areas: Heart failure, hypertension, metabolism, genetics
- Common models: Rodent models (mice, rats)
- Imaging: μCT, MRI, ultrasound, photoacoustic
- Phenotyping platform at MDC: Contact phenotyping@mdc-berlin.de

#### Preclinical Research Center (PRC)
- Established: 2020
- Mission: Comprehensive phenotyping services
- Technologies: High-frequency ultrasound, micro-CT, MRI, multiphoton microscopy
- Compliance: Animal welfare (3Rs), FELASA standards, institutional guidelines

## References

### Documentation
- Claude Code: https://code.claude.com/docs
- MCP Protocol: https://modelcontextprotocol.io/
- Plugin Guide: ~/.claude/plugins/README.md (if exists)

### Internal Documentation
- MCP System: ~/.claude/mcp/README.md
- Agent Comparison: ~/.claude/agents/AGENT_COMPARISON.md
- Research Agent Guide: ~/.claude/agents/RESEARCH_AGENT_GUIDE.md

## Best Practices

1. **Always use agents proactively** - Let agents discover and suggest tools
2. **Restrict agent tools** - Only grant necessary access
3. **Version control agents** - Commit project-specific agents to repos
4. **Use CLAUDE.md** - Document project-specific conventions
5. **Test before deploying** - Validate generated code and agents
6. **Monitor token usage** - Keep agents lightweight (<3K tokens)
7. **Learn from patterns** - The system improves with use

---

*Last Updated: November 15, 2025*
*Environment: MDC Berlin Research Infrastructure*
