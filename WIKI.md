# WIKI.md — Workflow Wiki Schema

> Full reference for the workflow-wiki knowledge base.
> If you're using Claude Code with this vault, the CLAUDE.md file handles the basics.
> Read this for the complete schema, frontmatter specs, and operation details.

---

## 1 — Architecture

```
workflow-wiki/
├── .raw/                        # Layer 1: immutable source material
│   ├── briefs/                  # Project briefs, take-home prompts, specs
│   ├── builds/                  # Completed project code (snapshots, not live repos)
│   ├── reviews/                 # Review transcripts, feedback, retro notes
│   └── references/              # External articles, docs, prior art
│
├── wiki/                        # Layer 2: LLM-generated knowledge base
│   ├── index.md                 # Master catalog of all wiki pages
│   ├── log.md                   # Chronological operation log (newest first)
│   ├── hot.md                   # Recent context cache (~500 words)
│   ├── overview.md              # Executive summary of team knowledge
│   │
│   ├── projects/                # One page per shipped project
│   │   └── _index.md
│   ├── patterns/                # Reusable solutions
│   │   └── _index.md
│   ├── components/              # Documented code blocks
│   │   └── _index.md
│   ├── decisions/               # Design decisions with rationale
│   │   └── _index.md
│   ├── rubrics/                 # Evaluation and review frameworks
│   │   └── _index.md
│   ├── antipatterns/            # What failed and why
│   │   └── _index.md
│   ├── stack/                   # Tools, libraries, APIs
│   │   └── _index.md
│   └── meta/                    # Dashboards, lint reports
│       └── dashboard.md
│
├── _templates/                  # Layer 3: Obsidian Templater templates
├── CLAUDE.md                    # Project instructions
└── WIKI.md                      # This file
```

### Rules

- `.raw/` is read-only. Never modify source files.
- `wiki/` is yours. Create, update, rename, delete freely.
- Every wiki page has frontmatter. No exceptions.
- Wikilinks over paths. Use `[[Page Name]]` not `[text](path/to/file.md)`.
- Atomic notes. One pattern per page, one decision per page.
- Update, don't duplicate. If a page exists, update it.

---

## 2 — Hot Cache

`wiki/hot.md` is a ~500-word summary of the most recent context.

Update after every ingest, after significant queries, and at end of session.

```yaml
---
type: meta
title: "Hot Cache"
updated: 2026-04-20
---
```

```markdown
# Recent Context

## Last Updated
2026-04-20 — Ingested Deal Tracker Dashboard project

## Key Recent Facts
- Shipped Deal Tracker with status-segmented KPIs, proving dollar-weighted pipeline
  cards are more useful than aggregate stats for lending dashboards
- Identified date-sorting-as-string-comparison as a high-severity antipattern
- Established first internal dashboard review rubric (3 dimensions)

## Recent Changes
- Created: [[Deal Tracker Dashboard]], [[Filter-Responsive Derived Stats]],
  [[Risk-Score Conditional Formatting]], [[Row-Click Detail Drawer]],
  [[KPI Status Card]], [[Sortable Table Header]]
- Flagged: [[Date Sorting as String Comparison]] as antipattern

## Active Threads
- Building internal dashboard review checklist into a comprehensive rubric
- Need to ingest more projects to validate which patterns are truly reusable
  vs. one-off solutions
```

Keep under 500 words. Overwrite completely each time.

---

## 3 — Frontmatter Schema

Every wiki page starts with flat YAML frontmatter.

### Universal fields (every page):

```yaml
---
type: <project|pattern|component|decision|rubric|antipattern|stack|meta>
title: "Human-Readable Title"
created: 2026-04-20
updated: 2026-04-20
status: <seed|developing|proven|evergreen|deprecated>
tags:
  - <domain-tag>
related:
  - "[[Other Page]]"
---
```

### Type-specific fields:

**project:**
```yaml
brief: "[[.raw/briefs/filename]]"
stack: [React, Tailwind, Lucide]
time_constraint: "30 minutes"
patterns_used:
  - "[[Pattern Name]]"
components_created:
  - "[[Component Name]]"
decisions:
  - "[[Decision Name]]"
antipatterns_found:
  - "[[Antipattern Name]]"
review_score: 4/5
shipped: true
```

**pattern:**
```yaml
complexity: <basic|intermediate|advanced>
domain: <dashboard|data-table|forms|navigation|state-management>
projects_used:
  - "[[Project Name]]"
```

**component:**
```yaml
framework: <React|Vue|Vanilla|HTML>
props: [prop1, prop2]
projects_used:
  - "[[Project Name]]"
```

**decision:**
```yaml
project: "[[Project Name]]"
alternatives_considered:
  - "Alternative approach"
trade_offs:
  - "What this gains vs. what it costs"
```

**rubric:**
```yaml
dimensions: [workflow_answer, mechanics, layout]
projects_applied:
  - "[[Project Name]]"
```

**antipattern:**
```yaml
severity: <low|medium|high|critical>
caught_in: "[[Project Name]]"
prevention: "One-line prevention note"
```

**stack:**
```yaml
category: <framework|library|tool|api|service>
version: "latest"
projects_used:
  - "[[Project Name]]"
```

---

## 4 — Operations

### 4.1 SCAFFOLD — First Run

1. Create full folder structure under `wiki/`.
2. Create `_index.md` sub-index for each folder.
3. Create `wiki/overview.md`, `wiki/index.md`, `wiki/log.md`, `wiki/hot.md`.
4. Create `_templates/` with templates for each note type.
5. Create `wiki/meta/dashboard.md`.
6. Present structure and confirm.

### 4.2 INGEST — Single Project

Trigger: user says "ingest [project name]" after dropping artifacts in `.raw/`.

1. Read all project artifacts: brief, code, review notes.
2. Create project page in `wiki/projects/`.
3. For each reusable solution discovered:
   - Check if pattern already exists → update with new project reference.
   - If new → create pattern page with problem/solution/implementation notes.
4. For each reusable code block:
   - Create or update component page with props, behavior, usage notes.
5. For each significant design choice:
   - Create decision page with context, decision, rationale, trade-offs.
6. For each failure or near-miss:
   - Create antipattern page with what happened, fix, prevention.
7. Update or create applicable rubrics from review feedback.
8. Update `wiki/index.md` with all new pages.
9. Update `wiki/hot.md` with this project's context.
10. Append to `wiki/log.md` (newest first):

```markdown
## [2026-04-20] ingest | Deal Tracker Dashboard
- Brief: `.raw/briefs/deal-tracker-challenge.pdf`
- Project: [[Deal Tracker Dashboard]]
- Patterns: [[Filter-Responsive Derived Stats]], [[Risk-Score Conditional Formatting]]
- Components: [[KPI Status Card]], [[Sortable Table Header]]
- Decisions: [[Status-Segmented KPIs Over Aggregate Stats]]
- Antipatterns: [[Date Sorting as String Comparison]]
- Key insight: Dollar-weighted pipeline cards beat aggregate stats for lending dashboards.
```

11. Cross-reference: every pattern links to every project that uses it.

A single project typically produces 8-20 wiki pages.

### 4.3 INGEST — Batch

For ingesting multiple projects at once:

1. List all projects. Confirm with user.
2. Process each project per 4.2. Defer cross-referencing.
3. After all projects: cross-reference pass for shared patterns.
4. Update index, hot cache, and log once at the end.

### 4.4 QUERY

1. Read `wiki/hot.md` first.
2. Read `wiki/index.md` to find relevant pages.
3. Read relevant pages (3-8 typically).
4. Synthesize answer with wikilink citations.
5. If the question reveals a gap: flag it.

### 4.5 LINT

Run every 5-10 projects. Checks:

- Orphan pages (no incoming links)
- Dead links (wikilinks to nonexistent pages)
- Patterns with only one project reference (may not be reusable yet — flag as "unproven")
- Antipatterns without prevention notes
- Rubrics not applied to recent projects
- Missing cross-references between related patterns
- Stale pages (not updated in 10+ projects)

Output: `wiki/meta/lint-report-YYYY-MM-DD.md`

---

## 5 — Status Lifecycle

Pages move through statuses as they prove their value:

```
seed → developing → proven → evergreen
                         ↘ deprecated
```

- **seed**: Extracted from one project. Might be useful. Needs validation.
- **developing**: Used in 2-3 projects. Shape is becoming clear.
- **proven**: Used in 4+ projects. Reliable. Worth teaching to new team members.
- **evergreen**: Fundamental to how the team works. Rarely changes.
- **deprecated**: Superseded or no longer applicable. Keep for historical reference.

---

## 6 — Naming Conventions

- **Filenames**: Title Case with spaces (`Filter-Responsive Derived Stats.md`)
- **Folders**: lowercase with dashes (`wiki/antipatterns/`)
- **Tags**: lowercase, hierarchical (`#domain/dashboard`, `#severity/high`)
- **Unique filenames** so wikilinks work without paths

### Pattern Naming

Name patterns by the problem they solve, not the implementation:

- Good: "Filter-Responsive Derived Stats"
- Bad: "useMemo Pattern for Filtered Arrays"

### Decision Naming

Name decisions as the choice made:

- Good: "Status-Segmented KPIs Over Aggregate Stats"
- Bad: "KPI Card Design Decision"

### Antipattern Naming

Name antipatterns by the failure:

- Good: "Date Sorting as String Comparison"
- Bad: "Sorting Bug"

---

## 7 — Dashboard

`wiki/meta/dashboard.md`:

```
# Workflow Dashboard

## Recent Projects
| Project | Status | Patterns | Score |
|---------|--------|----------|-------|
| [[Deal Tracker Dashboard]] | shipped | 3 | 4/5 |

## Proven Patterns (used in 4+ projects)
(none yet — keep shipping)

## High-Severity Antipatterns
- [[Date Sorting as String Comparison]] — caught in [[Deal Tracker Dashboard]]

## Rubrics
- [[Internal Dashboard Review Checklist]] — 3 dimensions, applied to 1 project
```

Update manually or via Dataview queries if the plugin is installed.

---

## 8 — Visual Customization

Create `.obsidian/snippets/vault-colors.css`:

```css
:root {
  --wf-projects:     #4fc1ff;
  --wf-patterns:     #dcdcaa;
  --wf-components:   #c586c0;
  --wf-decisions:    #ce9178;
  --wf-rubrics:      #6a9955;
  --wf-antipatterns: #d16969;
  --wf-stack:        #569cd6;
}

.nav-folder-title[data-path^="wiki/projects"]     { color: var(--wf-projects); }
.nav-folder-title[data-path^="wiki/patterns"]     { color: var(--wf-patterns); }
.nav-folder-title[data-path^="wiki/components"]   { color: var(--wf-components); }
.nav-folder-title[data-path^="wiki/decisions"]    { color: var(--wf-decisions); }
.nav-folder-title[data-path^="wiki/rubrics"]      { color: var(--wf-rubrics); }
.nav-folder-title[data-path^="wiki/antipatterns"] { color: var(--wf-antipatterns); }
.nav-folder-title[data-path^="wiki/stack"]        { color: var(--wf-stack); }
.nav-folder-title[data-path=".raw"]               { color: #808080; opacity: 0.6; }

.callout[data-callout='antipattern']  { --callout-color: 209, 105, 105; --callout-icon: lucide-alert-triangle; }
.callout[data-callout='proven']       { --callout-color: 106, 153, 85;  --callout-icon: lucide-check-circle; }
.callout[data-callout='trade-off']    { --callout-color: 220, 220, 170; --callout-icon: lucide-scale; }
```

---

## Summary

The team's job: ship projects, review them honestly, drop artifacts in `.raw/`.

The wiki's job: extract patterns, catalog components, document decisions, flag antipatterns, maintain rubrics, cross-reference everything, and make the next project faster than the last.

Knowledge compounds like interest. This is the vault where it accumulates.
