---
name: file-organization
description: Automatically organize project documentation files into proper directory structure with standardized naming
---

# File Organization Skill

## When to Use This Skill

Use this skill **PROACTIVELY** in these situations:

1. **When creating new documentation files** (.md, .txt, .pdf) in project root
2. **When user explicitly requests** "organize files" or "clean up documentation"
3. **At end of work session** if documentation files are in project root
4. **When moving/renaming existing documentation**

**IMPORTANT**: This skill should be invoked automatically whenever creating documentation. It is NOT optional when the conditions above are met.

## Checklist

When organizing files, follow this checklist. **Each item MUST create a TodoWrite entry**:

- [ ] Analyze document content and detect type
- [ ] Check memory MCP for learned classification patterns
- [ ] Determine proper category (implementation/specification/analysis/report/planning)
- [ ] Generate standardized filename with date prefix if appropriate
- [ ] Verify docs/ directory structure exists (create if missing)
- [ ] Move file to correct docs/ subdirectory
- [ ] Scan for cross-references and update them
- [ ] Store classification pattern in memory MCP

## Classification Rules

### Implementation Documents
**Keywords**: PHASE, IMPLEMENTATION, COMPLETE, MIGRATION, SETUP, DEPLOYMENT, BUILD
**Content Indicators**:
- Past-tense descriptions ("implemented", "built", "deployed")
- Code examples and technical details
- Step-by-step execution logs
- "Complete" or "Done" in title

**Location**: `docs/implementation/`
**Naming**: `YYYY-MM-DD_impl_{descriptive-name}.md`

### Specification Documents
**Keywords**: SPECIFICATION, SPEC, STRATEGY, REQUIREMENTS, ARCHITECTURE, DESIGN, PROPOSAL
**Content Indicators**:
- Future-tense language ("will", "should", "propose")
- Requirements lists
- Architecture diagrams descriptions
- Planning sections

**Location**: `docs/specifications/`
**Naming**: `{descriptive-name}-spec.md` (no date for evolving specs) OR `YYYY-MM-DD_spec_{name}.md` (dated versions)

### Analysis Documents
**Keywords**: ANALYSIS, ASSESSMENT, EVALUATION, REVIEW, CRITIQUE, EXAMINATION
**Content Indicators**:
- Data and findings sections
- Conclusions and recommendations
- Comparative analysis
- Critical evaluation

**Location**: `docs/analysis/`
**Naming**: `YYYY-MM-DD_analysis_{descriptive-name}.md`

### Report Documents
**Keywords**: REPORT, TEST, RESULTS, METRICS, SUMMARY, STATUS
**Content Indicators**:
- Metrics tables and statistics
- Pass/fail criteria
- Test results
- Status updates

**Location**: `docs/reports/`
**Naming**: `YYYY-MM-DD_report_{descriptive-name}.md`

### Planning Documents
**Keywords**: PLAN, ROADMAP, TODO, TIMELINE, SCHEDULE, MILESTONES
**Content Indicators**:
- Future goals and objectives
- Timelines and schedules
- Task lists
- Project phases

**Location**: `docs/planning/`
**Naming**: `{descriptive-name}-plan.md` OR `YYYY-MM-DD_planning_{name}.md`

## Extended Categories (MDC Platform Projects)

For MDC Platform Director work, additional categories:

### Grant Applications
**Keywords**: GRANT, DFG, EU, HORIZON, FUNDING, PROPOSAL
**Location**: `docs/grants/`
**Naming**: `YYYY-MM-DD_grant_{agency}-{type}.md`

### Presentations
**Keywords**: PRESENTATION, SLIDES, TALK, CONFERENCE, STAKEHOLDER
**Location**: `docs/presentations/`
**Naming**: `YYYY-MM-DD_presentation_{event-or-audience}.md`

### Publications
**Keywords**: PAPER, MANUSCRIPT, PUBLICATION, JOURNAL, ARTICLE
**Location**: `docs/publications/`
**Naming**: `YYYY-MM-DD_publication_{topic}.md`

### Administrative Documents
**Keywords**: ADMIN, SOP, POLICY, PROCEDURE, COMMITTEE, QUARTERLY
**Location**: `docs/administrative/`
**Naming**: `YYYY-MM-DD_admin_{type}.md`

## Naming Convention Rules

### Date Prefix Logic
**Add YYYY-MM-DD prefix when**:
- One-time report or analysis
- Versioned document (snapshot in time)
- Time-sensitive content

**Omit date prefix when**:
- Living document that evolves (README, ongoing specs)
- Permanent reference documentation
- General guides or overviews

### Filename Format
1. **Extract date** from existing filename OR use current date
2. **Determine type abbreviation** (impl, spec, analysis, report, planning)
3. **Clean description**:
   - Remove ALL_CAPS
   - Remove redundant words (COMPLETE, REPORT, etc.)
   - Convert to lowercase-kebab-case
4. **Assemble**: `YYYY-MM-DD_type_clean-description.md`

**Examples**:
- `PHASE_1_PLUGIN_ARCHITECTURE_COMPLETE.md` → `2024-11-15_impl_plugin-architecture-phase-1.md`
- `OFFICE365_INTEGRATION_SPECIFICATION.md` → `2024-11-16_spec_office365-integration.md`
- `BRUTAL_ASSESSMENT.md` → `2024-11-16_analysis_brutal-assessment.md`
- `PLUGIN_ARCHITECTURE_TEST_REPORT.md` → `2024-11-15_report_plugin-architecture-test.md`

## Edge Cases

### Files That Stay in Root
**Never move these files**:
- README.md
- QUICK_START.md
- LICENSE
- .gitignore
- CHANGELOG.md
- CONTRIBUTING.md
- Any file user explicitly places in root after organization

### Ambiguous Classification
If document doesn't clearly fit a category:
1. **Read first 50 lines** for context
2. **Check memory MCP** for similar past classifications
3. **Look for primary purpose**: What is main goal of document?
4. **Default to**: `docs/analysis/` if still unclear
5. **Ask user** if confidence is low (<50%)

### Multiple Categories
If document fits multiple categories (e.g., "Implementation Report"):
- **Primary category wins**: Implementation details → implementation/
- **Report format** doesn't override content type

### Binary/Code Files
**Do NOT organize**:
- Source code files (.py, .js, .ts, etc.)
- Binary files (.pdf, .docx) unless in project root
- Images and media files
- Configuration files (.json, .yaml, .toml)

**Only organize**: .md, .txt files that are documentation

## Execution Workflow

When this skill is invoked:

1. **Scan project root** for .md and .txt files (exclude whitelisted files)
2. **For each file**:
   - Read content (first 100 lines sufficient)
   - Check memory MCP for learned patterns
   - Classify using rules above
   - Generate new filename
   - Check if docs/{category}/ exists, create if needed
   - Move file
   - Scan project for references to old filename
   - Update references if found
   - Store classification in memory MCP
3. **Report results** to user with summary table

## Memory MCP Integration

After each file organization, store this pattern:

```json
{
  "original_filename": "PHASE_1_PLUGIN_ARCHITECTURE_COMPLETE.md",
  "detected_keywords": ["PHASE", "IMPLEMENTATION", "COMPLETE"],
  "classification": "implementation",
  "new_filename": "2024-11-15_impl_plugin-architecture-phase-1.md",
  "new_location": "docs/implementation/",
  "confidence": "high",
  "timestamp": "2024-11-19T12:00:00Z"
}
```

Before classifying new documents, query memory MCP for similar patterns to improve accuracy.

## Integration with Workflow

This skill can invoke the `file-organization` workflow via workflow-mcp for complex multi-file organizations. For single files, execute directly using available tools (Read, Write, Bash, Grep).

## Tools Required

- **Read**: Analyze file content
- **Write**: Create directory structure
- **Bash**: Move files, create directories
- **Grep**: Find cross-references
- **Edit**: Update cross-references
- **workflow-mcp tools**: For complex orchestration
- **memory MCP tools**: Store/retrieve classification patterns

## Examples

### Example 1: Implementation Report
**Input**: `MEMORY_FILESYSTEM_MCP_IMPLEMENTATION.md` in project root

**Analysis**:
- Keywords found: IMPLEMENTATION, MCP
- Content: Past-tense, technical details, completion report
- Classification: Implementation

**Output**:
- New name: `2024-11-17_impl_memory-filesystem-mcp.md`
- Location: `docs/implementation/`

### Example 2: Strategic Document
**Input**: `STRATEGIC_LEADERSHIP_INTELLIGENCE_SYSTEM.md`

**Analysis**:
- Keywords: STRATEGIC, SYSTEM
- Content: Future plans, requirements, architecture
- Classification: Specification (strategic planning document)

**Output**:
- New name: `strategic-leadership-intelligence-system-spec.md` (no date, evolving spec)
- Location: `docs/specifications/`

### Example 3: Analysis
**Input**: `HEUSER_MDC_KNOWLEDGE_GRAPH_ANALYSIS.md`

**Analysis**:
- Keywords: ANALYSIS
- Content: Data findings, evaluation, recommendations
- Classification: Analysis

**Output**:
- New name: `2024-11-15_analysis_heuser-mdc-knowledge-graph.md`
- Location: `docs/analysis/`

## Success Criteria

File organization is successful when:
- ✅ All .md/.txt documentation moved from root to docs/
- ✅ Whitelisted files (README, QUICK_START) remain in root
- ✅ All filenames follow standardized convention
- ✅ Directory structure exists and is correct
- ✅ Cross-references updated (no broken links)
- ✅ Classification patterns stored in memory MCP
- ✅ User can easily find documents by category

## Failure Modes

If organization fails:
- **Don't move file** - better to leave in place than misclassify
- **Report issue to user** with filename and reason
- **Store failure in memory MCP** to avoid repeating mistake
- **Ask user for guidance** on ambiguous files

---

**Remember**: This skill should be used PROACTIVELY. Per superpowers mandate, if there's even a 1% chance this skill applies, you MUST use it. Creating documentation = automatic trigger for this skill.
